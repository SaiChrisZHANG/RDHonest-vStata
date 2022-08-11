clear all

adopath + "."

cap log close 
log using "rdhonest.txt",replace 

********************************************************************************
//  1. Lee08
qui: use "./data/lee08.dta",clear 


// 1.1 uni kernel

rdhonestV2 voteshare margin, m(0.1) kernel("uni") h(10) 

// 1.1.1 uni kernel + optimal h 
rdhonestV2 voteshare margin, m(0.1) kernel("uni") 
rdhonestV2 voteshare margin, m(0.1) kernel("uni") opt_criterion("OCI")
rdhonestV2 voteshare margin, m(0.1) kernel("uni") opt_criterion("FLCI") 

// 1.1.2 uni kernel + optimal h + without M + est_w saved as wgt 
rdhonestV2 voteshare margin, kernel("uni") est_w("wgt")

// 1.2 tri kernel 
rdhonestV2 voteshare margin, m(0.1) kernel("tri") h(10) 

// 1.2.1 tri kernel + optimal h 
rdhonestV2 voteshare margin, m(0.1) kernel("tri") 
rdhonestV2 voteshare margin, m(0.1) kernel("tri")   opt_criterion("OCI")
rdhonestV2 voteshare margin, m(0.1) kernel("tri")   opt_criterion("FLCI") 

// 1.2.2 tri kernel + optimal h + without M + est_w saved as wgt 
rdhonestV2 voteshare margin, kernel("tri") est_w("wgt")

********************************************************************************
// 2. rcp
qui: use "./data/rcp.dta",clear 

// 2.1 uni kernel
rdhonestV2  cn (retired=elig_year), m(4 0.4) kernel("uni") h(3) est_w("wgt")

// 2.1.1 uni kernel + optimal h 
rdhonestV2  cn (retired=elig_year), m(4 0.4) kernel("uni") t0(0)
rdhonestV2  cn (retired=elig_year), m(4 0.4) kernel("uni") t0(0) opt_criterion("OCI")
rdhonestV2  cn (retired=elig_year), m(4 0.4) kernel("uni") t0(0) opt_criterion("FLCI") 

// 2.1.2 uni kernel + optimal h + without M + est_w saved as wgt 
rdhonestV2  cn (retired=elig_year), kernel("uni") t0(0) est_w("wgt")

// 2.2 tri kernel 
rdhonestV2  cn (retired=elig_year), m(4 0.4) kernel("tri") h(3) 

// 2.2.1 tri kernel + optimal h 

rdhonestV2  cn (retired=elig_year), m(4 0.4) kernel("tri") t0(0)
rdhonestV2  cn (retired=elig_year), m(4 0.4) kernel("tri")   opt_criterion("OCI") t0(0)
rdhonestV2  cn (retired=elig_year), m(4 0.4) kernel("tri")   opt_criterion("FLCI")  t0(0)

// 2.2.1 tri kernel + optimal h + without M + est_w saved as wgt 
rdhonestV2  cn (retired=elig_year), kernel("tri") t0(0) est_w("wgt")

 
log close 
