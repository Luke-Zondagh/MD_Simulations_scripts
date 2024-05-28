average_int_e = 0
average_dH = 0
with open('Out_mmpbsa.dat', 'r') as f:
  for line in f:
    line = line.strip('\n')
    if line[0:11] == 'Differences':
      for dl in f:
        dl = dl.strip('\n')
        if dl[0:7] == 'VDWAALS':
          vdw = float(dl[13:35])
        elif dl[0:3] == 'EEL':
          ele = float(dl[13:35])
        elif dl[0:11] == 'DELTA TOTAL':
          dH = float(dl[13:35])
average_int_e = average_int_e + vdw + ele
average_dH = average_dH + dH

types_list = ['complex', 'receptor', 'ligand']
frame_int_energy = {}
for key in types_list:
  frame_int_energy[key] = []
  for i in range(10):
    infname = '_MMPBSA_' + key + '_pb.mdout.' + '0'
    inf = open(infname, 'r')
    for line in inf:
      line = line.strip('\n')
      if line[0:8] == ' VDWAALS' and line[26:29] == 'EEL':
        vdw = float(line[10:24]); ele = float(line[35:49])
        key_int_e = vdw + ele
        frame_int_energy[key].append(key_int_e)

#print(frame_int_energy)
import math

eterm_list = []
for i in range(len(frame_int_energy['complex'])):
  int_e = frame_int_energy['complex'][i] - frame_int_energy['receptor'][i] - frame_int_energy['ligand'][i]
  d_int_e = int_e - average_int_e
  eterm = (d_int_e/(298.0 * 0.001985875)) 
  x = (math.e ** eterm)
  eterm_list.append(x)

mean = sum(eterm_list)/len(eterm_list)
entropy = math.log(mean)*298.0*0.001985875
outline = 'PB_energy =' + ' ' + str(average_dH) + ' ' + 'Interaction_entropy =' + ' ' + str(entropy) + ' ' + 'Binding_free_energy =' + ' ' + str(average_dH + entropy)
print(outline)
with open("entropy_results.txt", "w") as file:
    file.write(outline)
