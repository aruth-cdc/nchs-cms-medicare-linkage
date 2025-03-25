# *****************************************************************************************
# April 2021
# 
# ** LINKED NCHS-CMS MEDICARE (2014-2018) FEASIBILITY STUDY TXT FILE **
#
# The following R code can be used to read the fixed-width format LINKED NCHS-CMS 
# MEDICARE (2014-2018) FEASIBILITY STUDY TXT FILE from a stored location into a R data frame.  
# Basic frequencies are also produced.  
# There is a small section of code that needs to be uncommented if you are reading an NHANES file
# or the NNHS file
#
# IMPORTANT INFORMATION REGARDING THE SURVEY ID VARIABLE:
#
# FOR NHIS SURVEYS USE PUBLICID AS THE ID VARIABLE   
# FOR NHANES SURVEYS USE SEQN AS THE ID VARIABLE  
# FOR NNHS USE RESNUM AS THE ID VARIABLE 
# 
# *****************************************************************************************   
#
# NOTE:   To download and save the feasibility files to your hard-drive, follow these steps:
# 
# (1)     Designate a folder on your hard-drive to download the feasibility file.  In this example,
#         the data will be saved to "C:\Feasibility Study Data"
#
# (2)     The feasibility data files can be accessed from this website:  
#        https://www.cdc.gov/nchs/data-linkage/medicare-feasibility.htm/
#
#         In this example, the data file is saved in the folder, "C:\Feasibility Study Data", and the 
#         data file is saved as "MCARE1418_FEAS_NHIS_1998.TXT". 
#
# *****************************************************************************************   
#
# R NOTES:
# (1)     For convenience, the user can place the name of the public-use NCHS-CMS MEDICARE FEASIBILITY
#         they are reading in and creating as an R data frame in just two places:  (1) the line beginning 
#         with srvyin; and (2) the line beginning with srvyout.  The resulting R data frame
#         will have the shorthand name assigned in the srvyout line.   
#
# (2)     Variable labels are not provided. Please see the feasibility file codebook for 
#         this information.
#
# (3)     Variable value formats are not attached to the variables.
#           
# *****************************************************************************************


#install.packages("readr")    #if package is not installed already, then uncomment and run this line
#install.packages("dplyr")    #if package is not installed already, then uncomment and run this line
library(readr)
library(dplyr)


# the location where the .TXT file is saved:
setwd ("C:/Feasibility Study Data")

# remove all objects from the R environment
rm(list=ls())


# place survey name here (substitute survey name where <SURVEY> is, and survey cycle where <DATE> is):
#srvyin <- paste("MCARE1418_FEAS_<SURVEY>_<DATE>.TXT")   # full .TXT name here
srvyin <- paste("MCARE1418_FEAS_NHIS_1998.TXT")   # full .TXT name here
srvyout <- "NHIS_1998" # shorthand dataset name here

# Example syntax:
#srvyin <- paste("MCARE1418_FEAS_NHIS_1998.TXT")   
#srvyout <- "NHIS_1998"      


# read in the fixed-width format ASCII file
dsn <- read_fwf(file=srvyin,
                col_types = "ciiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii",
                fwf_cols(publicid = c(1,14),
                         medicare_match_1418 = c(15),
                         on_mbsf_2014 = c(16),
                         on_mbsf_2015 = c(17),
                         on_mbsf_2016 = c(18),
                         on_mbsf_2017 = c(19),
                         on_mbsf_2018 = c(20),
                         
                         on_medpar_2016 = c(21),
                         on_medpar_2017 = c(22),
                         on_medpar_2018 = c(23),
                         
                         on_partd_pde_2016 = c(24),
                         on_partd_pde_2017 = c(25),
                         on_partd_pde_2018 = c(26),
                         
                         on_carrier_ffs_2016 = c(27),
                         on_carrier_ffs_2017 = c(28),
                         on_carrier_ffs_2018 = c(29),
                         
                         on_dme_ffs_2016 = c(30),
                         on_dme_ffs_2017 = c(31),
                         on_dme_ffs_2018 = c(32),
                         
                         on_hha_ffs_2016 = c(33),
                         on_hha_ffs_2017 = c(34),
                         on_hha_ffs_2018 = c(35),
                         
                         on_hospice_ffs_2016 = c(36),
                         on_hospice_ffs_2017 = c(37),
                         on_hospice_ffs_2018 = c(38),
                         
                         on_outpat_ffs_2016 = c(39),
                         on_outpat_ffs_2017 = c(40),
                         on_outpat_ffs_2018 = c(41),
                         
                         on_inpat_ffs_2016 = c(42),
                         on_inpat_ffs_2017 = c(43),
                         on_inpat_ffs_2018 = c(44),
                         
                         on_snf_ffs_2016 = c(45),
                         on_snf_ffs_2017 = c(46),
                         on_snf_ffs_2018 = c(47),
                         
                         on_oasis_2016 = c(48),
                         on_oasis_2017 = c(49),
                         on_oasis_2018 = c(50),
                         
                         on_mds_2016 = c(51),
                         on_mds_2017 = c(52),
                         on_mds_2018 = c(53),
                         
                         on_carrier_ma_2016 = c(54),
                         on_dme_ma_2016 = c(55),
                         on_hha_ma_2016 = c(56),
                         on_inpat_ma_2016 = c(57),
                         on_outpat_ma_2016 = c(58),
                         on_snf_ma_2016 = c(59)
                ),
                na = "."
)
#*********This section is for NHANES only ************
#dsn$seqn <- as.integer(substr(dsn$publicid,1,6))
#dsn <- select(dsn,-publicid)
#******************************************************

#*********This section is for NNHS only ************
#dsn$resnum <- as.integer(substr(dsn$publicid,1,6))
#dsn <- select(dsn,-publicid)
#******************************************************


# Structure and contents of data
str(dsn)

# Variable frequencies
table(dsn$medicare_match_1418)
table(dsn$on_mbsf_2014)
table(dsn$on_mbsf_2015)
table(dsn$on_mbsf_2016)
table(dsn$on_mbsf_2017)
table(dsn$on_mbsf_2018)

table(dsn$on_medpar_2016)
table(dsn$on_medpar_2017)
table(dsn$on_medpar_2018)

table(dsn$on_partd_pde_2016)
table(dsn$on_partd_pde_2017)
table(dsn$on_partd_pde_2018)

table(dsn$on_carrier_ffs_2016)
table(dsn$on_carrier_ffs_2017)
table(dsn$on_carrier_ffs_2018)

table(dsn$on_dme_ffs_2016)
table(dsn$on_dme_ffs_2017)
table(dsn$on_dme_ffs_2018)

table(dsn$on_hha_ffs_2016)
table(dsn$on_hha_ffs_2017)
table(dsn$on_hha_ffs_2018)

table(dsn$on_hospice_ffs_2016)
table(dsn$on_hospice_ffs_2017)
table(dsn$on_hospice_ffs_2018)

table(dsn$on_outpat_ffs_2016)
table(dsn$on_outpat_ffs_2017)
table(dsn$on_outpat_ffs_2018)

table(dsn$on_inpat_ffs_2016)
table(dsn$on_inpat_ffs_2017)
table(dsn$on_inpat_ffs_2018)

table(dsn$on_snf_ffs_2016)
table(dsn$on_snf_ffs_2017)
table(dsn$on_snf_ffs_2018)

table(dsn$on_oasis_2016)
table(dsn$on_oasis_2017)
table(dsn$on_oasis_2018)

table(dsn$on_mds_2016)
table(dsn$on_mds_2017)
table(dsn$on_mds_2018)

table(dsn$on_carrier_ma_2016)
table(dsn$on_dme_ma_2016)
table(dsn$on_hha_ma_2016)
table(dsn$on_inpat_ma_2016)
table(dsn$on_outpat_ma_2016)
table(dsn$on_snf_ma_2016)

# Re-name the dataset, DSN, to the short survey name then remove other R objects
assign(paste0(srvyout), dsn)
rm(dsn, srvyin, srvyout)


cb <- read_csv("data/codebook_feasibility-file.csv")
