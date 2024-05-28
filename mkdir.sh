#!/bin/bash

sed -i 's/lzondagh/tmakgoba/g' MD_scripts/preproduction/1_min_h_restrnt_MD.pbs
sed -i 's/lzondagh/tmakgoba/g' MD_scripts/preproduction/2_equilibration_10K_MD.pbs
sed -i 's/lzondagh/tmakgoba/g' MD_scripts/preproduction/3_9_min_MD.pbs
sed -i 's/lzondagh/tmakgoba/g' MD_scripts/preproduction/10_heating_100K_MD.pbs
sed -i 's/lzondagh/tmakgoba/g' MD_scripts/preproduction/11_18_MD.pbs

sed -i 's/tmakgoba@uwc.ac.za/lzondagh@uwc.ac.za/g' MD_scripts/preproduction/1_min_h_restrnt_MD.pbs
sed -i 's/tmakgoba@uwc.ac.za/lzondagh@uwc.ac.za/g' MD_scripts/preproduction/2_equilibration_10K_MD.pbs
sed -i 's/tmakgoba@uwc.ac.za/lzondagh@uwc.ac.za/g' MD_scripts/preproduction/3_9_min_MD.pbs
sed -i 's/tmakgoba@uwc.ac.za/lzondagh@uwc.ac.za/g' MD_scripts/preproduction/10_heating_100K_MD.pbs
sed -i 's/tmakgoba@uwc.ac.za/lzondagh@uwc.ac.za/g' MD_scripts/preproduction/11_18_MD.pbs

sed -i 's/lzondagh/tmakgoba/g' MD_scripts/production/19_production_MD_r1.pbs
sed -i 's/lzondagh/tmakgoba/g' MD_scripts/production/19_production_MD_r2.pbs
sed -i 's/lzondagh/tmakgoba/g' MD_scripts/production/19_production_MD_r3.pbs
sed -i 's/lzondagh/tmakgoba/g' MD_scripts/production/19_production_MD_r4.pbs
sed -i 's/lzondagh/tmakgoba/g' MD_scripts/production/19_production_MD_r5.pbs
sed -i 's/lzondagh/tmakgoba/g' MD_scripts/production/19_production_MD_r6.pbs
sed -i 's/lzondagh/tmakgoba/g' MD_scripts/production/19_production_MD_r7.pbs
sed -i 's/lzondagh/tmakgoba/g' MD_scripts/production/19_production_MD_r8.pbs
sed -i 's/lzondagh/tmakgoba/g' MD_scripts/production/19_production_MD_r9.pbs
sed -i 's/lzondagh/tmakgoba/g' MD_scripts/production/19_production_MD_r_10.pbs
sed -i 's/lzondagh/tmakgoba/g' MD_scripts/production/analysis_scripts/cpptraj.pbs

sed -i 's/tmakgoba@uwc.ac.za/lzondagh@uwc.ac.za/g' MD_scripts/production/19_production_MD_r1.pbs
sed -i 's/tmakgoba@uwc.ac.za/lzondagh@uwc.ac.za/g' MD_scripts/production/19_production_MD_r2.pbs
sed -i 's/tmakgoba@uwc.ac.za/lzondagh@uwc.ac.za/g' MD_scripts/production/19_production_MD_r3.pbs
sed -i 's/tmakgoba@uwc.ac.za/lzondagh@uwc.ac.za/g' MD_scripts/production/19_production_MD_r4.pbs
sed -i 's/tmakgoba@uwc.ac.za/lzondagh@uwc.ac.za/g' MD_scripts/production/19_production_MD_r5.pbs
sed -i 's/tmakgoba@uwc.ac.za/lzondagh@uwc.ac.za/g' MD_scripts/production/19_production_MD_r6.pbs
sed -i 's/tmakgoba@uwc.ac.za/lzondagh@uwc.ac.za/g' MD_scripts/production/19_production_MD_r7.pbs
sed -i 's/tmakgoba@uwc.ac.za/lzondagh@uwc.ac.za/g' MD_scripts/production/19_production_MD_r8.pbs
sed -i 's/tmakgoba@uwc.ac.za/lzondagh@uwc.ac.za/g' MD_scripts/production/19_production_MD_r9.pbs
sed -i 's/tmakgoba@uwc.ac.za/lzondagh@uwc.ac.za/g' MD_scripts/production/19_production_MD_r_10.pbs
sed -i 's/tmakgoba@uwc.ac.za/lzondagh@uwc.ac.za/g' MD_scripts/production/analysis_scripts/cpptraj.pbs

sed -i 's/lzondagh/tmakgoba/g' MD_scripts/MMPBSA_scripts/mmPbsa_serial.pbs
sed -i 's/tmakgoba@uwc.ac.za/lzondagh@uwc.ac.za/g' MD_scripts/MMPBSA_scripts/mmPbsa_serial.pbs

while read line
do

# Make neccessary directories

echo "Making directory"

mkdir ${line}
mkdir -p ${line}/preproduction
mkdir -p ${line}/preproduction/analysis
mkdir -p  ${line}/production
mkdir -p ${line}/production/analysis
mkdir -p ${line}/MM-PBSA
mkdir -p ${line}/MD_info

# Copy pbs, input, analysis and MMPBSA scripts 

echo "Copying files to new directory"

cp MD_scripts/preproduction/* ${line}/preproduction/

cp MD_scripts/production/* ${line}/production/
cp -R MD_scripts/production/analysis_scripts ${line}/production/analysis/

cp -R MD_scripts/MMPBSA_scripts/ ${line}/MM-PBSA/

# Change the pbs scripts to contain the compound name and pathway

echo "modify pbs scripts"

sed -i "s/LIG/${line}/g" ${line}/preproduction/1_min_h_restrnt_MD.pbs
sed -i "s/LIG/${line}/g" ${line}/preproduction/2_equilibration_10K_MD.pbs
sed -i "s/LIG/${line}/g" ${line}/preproduction/3_9_min_MD.pbs
sed -i "s/LIG/${line}/g" ${line}/preproduction/10_heating_100K_MD.pbs
sed -i "s/LIG/${line}/g" ${line}/preproduction/11_18_MD.pbs

sed -i "s/LIG/${line}/g" ${line}/production/19_production_MD_r1.pbs
sed -i "s/LIG/${line}/g" ${line}/production/19_production_MD_r2.pbs
sed -i "s/LIG/${line}/g" ${line}/production/19_production_MD_r3.pbs
sed -i "s/LIG/${line}/g" ${line}/production/19_production_MD_r4.pbs
sed -i "s/LIG/${line}/g" ${line}/production/19_production_MD_r5.pbs
sed -i "s/LIG/${line}/g" ${line}/production/19_production_MD_r6.pbs
sed -i "s/LIG/${line}/g" ${line}/production/19_production_MD_r7.pbs
sed -i "s/LIG/${line}/g" ${line}/production/19_production_MD_r8.pbs
sed -i "s/LIG/${line}/g" ${line}/production/19_production_MD_r9.pbs
sed -i "s/LIG/${line}/g" ${line}/production/19_production_MD_r_10.pbs
sed -i "s/LIG/${line}/g" ${line}/production/analysis/analysis_scripts/cpptraj.pbs

sed -i "s/LIG/${line}/g" ${line}/MM-PBSA/MMPBSA_scripts/mmPbsa_serial.pbs

# Copy prepared complexes to directory

cp Ligands_RESP/tleap/files_4_MD/${line}/* ${line}/

done < dir.list
