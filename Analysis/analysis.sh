#!/bin/bash

source /Users/luke_zondagh_m1/.zshrc 

conda activate /Users/luke_zondagh_m1/Softwares/anaconda3/envs/amber 

# Copy scripts to make concatenated plots

cp scripts/ligand_rmsd_all.py  Ligand/all/
cp scripts/receptor_rmsd_all.py RMSD/all
cp scripts/receptor_rmsf_all.py RMSF/all/
cp scripts/receptor_RoG_all.py RoG/all/


while read line
do

# Copy scripts to make individual plots

cp scripts/ligand_rmsd.py Ligand/"${line}_MD"/
cp scripts/receptor_rmsd.py RMSD/"${line}_MD"/
cp scripts/receptor_rmsf.py RMSF/"${line}_MD"/
cp scripts/hbond.py H_Bond/"${line}_MD"/
cp scripts/receptor_RoG.py RoG/"${line}_MD"/
cp scripts/prolif_binding_interaction_analysis.ipynb Trajectories/"${line}_MD"/

# Execute individual plot scripts

sed -i "" "s/LIG/${line}/g" Ligand/"${line}_MD"/ligand_rmsd.py
sed -i "" "s/LIG/${line}/g" RMSD/"${line}_MD"/receptor_rmsd.py
sed -i "" "s/LIG/${line}/g" RMSF/"${line}_MD"/receptor_rmsf.py
sed -i "" "s/LIG/${line}/g" H_Bond/"${line}_MD"/hbond.py
sed -i "" "s/LIG/${line}/g" RoG/"${line}_MD"/receptor_RoG.py

python Ligand/"${line}_MD"/ligand_rmsd.py

python RMSD/"${line}_MD"/receptor_rmsd.py
python RMSF/"${line}_MD"/receptor_rmsf.py
python H_Bond/"${line}_MD"/hbond.py
python RoG/"${line}_MD"/receptor_RoG.py	 

#sed -i "" "s/${line}/LIG/g" ligand_rmsd.py
#sed -i "" "s/${line}/LIG/g" receptor_rmsd.py
#sed -i "" "s/${line}/LIG/g" receptor_rmsf.py
#sed -i "" "s/${line}/LIG/g" hbond.py
#sed -i "" "s/${line}/LIG/g" receptor_RoG.py

cp Ligand/"${line}_MD"/rmsd_lig_ref.dat Ligand/all/"${line}_MD_rmsd_lig_ref.dat"
cp Ligand/"${line}_MD"/rmsd_lig_ref.hist Ligand/all/"${line}_MD_rmsd_lig_ref.hist"

cp RoG/"${line}_MD"/RoG_protein.dat RoG/all/"${line}_MD_RoG_protein.dat"
cp RMSD/"${line}_MD"/rmsd_bb.dat RMSD/all/"${line}_MD_rmsd_bb.dat"
cp RMSD/"${line}_MD"/rmsd_bb.hist RMSD/all/"${line}_MD_rmsd_bb.hist"
cp RMSF/"${line}_MD"/rmsf_byres.dat RMSF/all/"${line}_MD_rmsf_byres.dat"

#done < test.list
done < dir.list

# Execute individual plot scripts

python Ligand/all/ligand_rmsd_all.py
python RMSD/all/receptor_rmsd_all.py
python RMSF/all/receptor_rmsf_all.py
python RoG/all/receptor_RoG_all.py

conda deactivate 

