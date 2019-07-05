# GTExIdConverter

This package was developed in order to convert GTEx variant IDs, which have the format chr_pos_allele1_allele2_build, to rsIDs. It uses reference data from the [GTEx Project](https://gtexportal.org/home/datasets)

example:
## (1) Converting one GTEx ID
# input:
```
GTExIdConvert("6_31186208_A_G_b37")
```
# output:
```
          variant_id rs_id
1 6_31186208_A_G_b37 rs28360994
```

## (2) translating multiple GTEx IDs (note: must all be from the same chromosome)
# input: 
```
ids = c("10_64851_AT_A_b37", "10_61803062_T_G_b37")
GTExIdConvert(variant_ids = ids)
```
#output:
```
           variant_id rs_id 
1 10_61803062_T_G_b37 rs1002442
2   10_64851_AT_A_b37 rs548882871
```
