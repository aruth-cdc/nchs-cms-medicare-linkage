# NCHS-CMS Medicare linkage, 2014-2018

This repo contains documentation and information for the NCHS-CMS Medicare data linkage. More info can be found here: https://www.cdc.gov/nchs/data-linkage/medicare.htm 

## **Data sources:**
+ CMS
  + Medicare enrollment
  + FFS claims
  + Prescription drug events
  + Patient assessments
  + 2016-2018 MA encounter data
+ NHIS
+ NHANES
+ NHANES III
+ NNHS

## **Medicare data files**

The following Medicare data files are available: 

+ Master Beneficiary Summary File (MBSF)
+ Standard Analytic Files (SAFs)
  + FFS - final action health care claims
    + Inpatient; SNF; Outpatient; Carrier; HHA; DME; Hospice
  + Medicare advantage - claims submitted by MAOs
    + Inpatient; SNF; Outpatient; Carrier; HHA; DME
+ Medicare Provider Analysis and Review (MedPAR)
  + Hospitalization and SNF stays covered by FFS Medicare
+ Medicare Part D Prescription Drug Events
+ Home Health Outcome and Assessment Information Set (OASIS)
+ Long-Term Care Minimum Data Set (MDS) 

### Master Beneficiary Summary File components
+ **Base A/B/C/D segment**: includes individual-level contextual info such as linkage ID, DOB, Medicare coverage start date, and geocodes
+ **Chronic Conditions segment**: occurrence and timing of chronic conditions
+ **Cost and utilization segment**: payment info
+ **Prescription drug event (PDE) claims**: prescription drug coverage and type

