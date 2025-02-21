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
        if line_number == len(lines):
            lines.append(data + '\n')
        else:
            # 替换指定行的内容
            lines[line_number] = data + '\n'

        # 将修改后的内容写回文件
        with open(file_path, 'w', encoding='utf-8') as file:
            file.writelines(lines)

        print(f"成功在第 {line_number} 行写入数据：{data}")
    except FileNotFoundError:
        print(f"文件 {file_path} 未找到！")
    except Exception as e:
        print(f"发生错误：{e}")


# 示例用法
file_path = 'block_nest_hex.txt'  # 文件路径
line_number = 3  # 指定行号
data = "这是新写入的内容"  # 要写入的数据
write_to_specific_line(file_path, line_number, data)