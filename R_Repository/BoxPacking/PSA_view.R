library(gbp)
library(readr)
library(dplyr)
library(assertthat)
library(rgl)
library(gbp)
library(plot3D)

#- bpp_solver: input: order list in data.table `it` and bin list in data.table `container`

#- it
#  it item <data.table>
#  - oid order id <integer>
#  - sku items id <character>
#  - l it length which scale will be placed along x-coordinate <numeric>
#  - d it depth  which scale will be placed along y-coordinate <numeric>
#  - h it height which scale will be placed along z-coordinate <numeric>
#  - w it weight which scale will be placed along w-coordinate <numeric>
# l d h are subject to rotate, while w is on a separate single dimension

#- container
#  container bins <data.table>
#  - id container id <character>
#  - l: container length limit along x-coordinate <numeric>
#  - d: container depth  limit along y-coordinate <numeric>
#  - h: container height limit along z-coordinate <numeric>
#  - w: container weight limit along w - a separate single dimension <numeric>
#  - l, d, h will be sorted to have l >= d >= h within solver
# bin must be ordered by preference such that the first bin is most preferred one.

#- bpp_solver: output: packing solution

#- sn
#  sn bpp_solution packing solution <list>
#  - it item <data.table>
#    - oid: order id <integer>
#    - sku: stock keeping unit as it id <character>
#    - tid: ticket id - an unique id within oid <integer>
#    - otid: order id x ticket id - an unique indentifier indicate it with same tid can be packed into one bin <character>
#    - bid: container id <integer>
#    - x, y, z it position in bid bin <numeric>
#    - l, d, h it scale along x, y, z <numeric>
#    - w it weight <numeric>
#  - container bins <data.table>
#    - id container id <character>
#    - l container length limit along x-coordinate <numeric>
#    - d container depth  limit along y-coordinate <numeric>
#    - h container height limit along z-coordinate <numeric>
#    - w container weight limit along w - a separate single dimension <numeric>

#- bpp_viewer: a packing solution viewer
#   requires rgl, run in r-console will create interactive 3d views in rgl window
# bpp_viewer(sn)

#- gbp4d
#- ldhw: item l, d, h, w in matrix

results = read.csv(file = "C:/Users/tahat/Downloads/PSA_BoxPacking/R_Repository/BoxPacking/Data_for_study/Results_2019_07_02.csv")
head(results)

containers_select = results[results$tid=="1",]    #Sélection d'un container
containers_select

it <- data.table::data.table(
    oid = c(containers_select$oid),
    sku = c(containers_select$sku),
    l   = c(containers_select$l),
    d   = c(containers_select$d),
    h   = c(containers_select$h),
    w   = c(containers_select$w)
)
knitr::kable(it)  #Visualisation du tableau des packages

bn <- data.table::data.table(
    id = c(containers_select$tid),
    l  = c(12032),
    d  = c(2350),
    h  = c(2698),
    w  = c(100000)
)
knitr::kable(bn)  #Visualisation du tableau containers

sn <- gbp::bpp_solver(it = it, bn = bn)
sn$it
sn$bn

ldhw <- t(as.matrix(it[oid == 43648L, .(l, d, h, w)]))
ldhw

#- m: bin l, d, h in matrix
m <- t(as.matrix(bn[ , .(l, d, h, w)])) # multple bin (nécessaire pour déterminer les paramètres pour un container)
m

#- p: item fit sequence w.r.t bin
p <- gbp4d_solver_dpp_prep_create_p(ldhw, m[, 4L]) # single bin
p

#- sn
sn4d <- gbp4d_solver_dpp(p, ldhw, m[, 4L])

sn4d$it # matrix of items x, y, z, w (weight container is holding when fit it into container),
        #l, d, h, w (weight of it itself)
        #(x, y, z, w set into -1 when item not fit into bin)

sn4d$k  # indicator of which items are fitted into bin
sn4d$bn # matrix of bins l, d, h, w (weight limit)
sn4d$o  # volume of items fitted into bin
sn4d$ok # indicator of whether all items are fitted into bin

gbp4d_checkr(sn4d) #- check: no overlap in 3d volume and no over weight limit
gbp4d_viewer(sn4d)


#- gbp1d

v <- apply(ldhw[1L:3L, ], 2L, prod)

sn1d <- gbp1d_solver_dpp(p = v, w = ldhw[4L, ], c = 714.28)

sn1d$p # vector of items profit
sn1d$w # vector of items weight
sn1d$c # weight limit constraint
sn1d$k  # indicator of which items are selected
sn1d$o  # weight of items selected
sn1d$ok # indicator of whether all items are selected
