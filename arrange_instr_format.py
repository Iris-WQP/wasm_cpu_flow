def rearrange_file(input_file, output_file):
    with open(input_file, 'r') as file:
        lines = file.readlines()
    
    # combine the lines into one line and remove the spaces
    lines = [line.strip() for line in lines]
    # remove the empty lines
    lines = [line for line in lines if line]
    lines = ''.join(lines)
    lines = lines.replace(' ', '')

    # write the lines to the output file, two characters per line
    with open(output_file, 'w') as file:
        for i in range(0, len(lines), 2):
            file.write(lines[i:i+2] + '\n')

def distract_instrs(input_file, output_file):
    # read the input file
    with open(input_file, 'r') as file:
        lines = file.readlines()

    #detect whether the line contains ":"
    # if it does, istract the contents between ":" and ";" for each line
    with open(output_file, 'w') as file:
        for line in lines:
            if ':' in line:
                start = line.index(':')
                end = 50
                file.write(line[start+1:end] + '\n')

# main function
if __name__ == '__main__':
    distract_instrs('gemm_bin.txt', 'gemm_instr_bin.txt')
    rearrange_file('gemm_instr_bin.txt', 'gemm_instr_bin_rearranged.txt')