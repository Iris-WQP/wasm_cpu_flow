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
            # remove chars after ";"
            if ';' in line:
                end = line.index(';')
                line = line[:end]
            if ':' in line:
                start = line.index(':')
                end = 50
                file.write(line[start+1:end] + '\n')

def write_to_specific_line(file_path, line_number, data):
    """
    在指定行写入数据
    :param file_path: 文件路径
    :param line_number: 指定行号 从0开始计数
    :param data: 要写入的数据（字符串）
    """
    try:
        # 打开文件并读取所有行
        with open(file_path, 'r', encoding='utf-8') as file:
            lines = file.readlines()

        # 检查行号是否有效
        if line_number < 0 or line_number > len(lines):
            print(f"指定的行号 {line_number} 超出文件范围！")
            return

        # 在指定行插入数据
        # 如果是插入到文件末尾，则直接追加
        if line_number == len(lines) + 1:
            lines.append(data + '\n')
        else:
            # 替换指定行的内容
            lines[line_number - 1] = data + '\n'

        # 将修改后的内容写回文件
        with open(file_path, 'w', encoding='utf-8') as file:
            file.writelines(lines)

        print(f"成功在第 {line_number} 行写入数据：{data}")
    except FileNotFoundError:
        print(f"文件 {file_path} 未找到！")
    except Exception as e:
        print(f"发生错误：{e}")

def revise_line_number(file_path):
    with open(file_path, 'r') as file:
        lines = file.readlines()
    index_now = -1
    for i in range(len(lines)):
        # 如果有:，则将:前的十六进制格式字符串转化为十六进制数
        if ':' in lines[i]:
          if 'move' not in lines[i]:
            index_string = lines[i].split(':')[0]
            index = int(index_string, 16)
            # 如果index大于index_now，则将index_now更新为index
            if index > index_now:
                index_now = index
            else:
                for j in range(0, i):
                    if ':' in lines[j]:
                        if 'move' not in lines[j]:
                            check_index_string = lines[j].split(':')[0]
                            check_index = int(check_index_string, 16)
                            if check_index == index:
                                lines[j] = lines[i]
                                lines[i] = ''
                                break
    with open(file_path, 'w') as file:
        for line in lines:
            file.write(line)
            
        



# main function
if __name__ == '__main__':
    revise_line_number('test/wat_files/vmm_50.txt')
    distract_instrs('test/wat_files/vmm_50.txt', 'wasm_benchmark_file/temp.txt')
    rearrange_file('wasm_benchmark_file/temp.txt', 'test/hex_files/vmm_50_hex.txt')
    