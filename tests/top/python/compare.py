# Compare testbench output with python output

sim_path = '../bssr_64_sim_h.dat'
out_path = '../../../vivado/vivado.sim/sim_2/behav/xsim/bssr_64_output_h.dat'

with open(sim_path, 'r') as sim, open(out_path, 'r') as out:
    count = 0
    error = 0
    for sim_line, out_line in zip(sim, out):
        if sim_line != out_line:
            error += 1
            print(f'sim={sim_line.strip()} out={out_line.strip()} line={count+1}')
        count += 1

print(f'count={count} error={error}')