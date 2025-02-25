import pandas as pd
import matplotlib.pyplot as plt

# 读取Excel文件
file_path = '表格1.xlsx'
df = pd.read_excel(file_path, sheet_name='Sheet1')

# 提取数据
operate_numbers = df['Operate number']
wasm_cycles = df['wasm cpu cycle ']
wasmer_cycles = df['wasmer cycle']

# 设置图表样式
plt.figure(figsize=(3.5, 3.5))
# plt.rcParams['font.family'] = 
plt.rcParams['font.size'] = 9

# 绘制柱状图
bar_width = 0.35
index = range(len(operate_numbers))

plt.bar(index, wasm_cycles, bar_width, color='darkblue', label='WASM CPU Cycle')
plt.bar([i + bar_width for i in index], wasmer_cycles, bar_width, color='lightblue', label='Wasmer Cycle')

# 设置纵坐标为对数比例
plt.yscale('log')

# 设置横轴标签和标题
plt.xlabel('Operate Number')
plt.ylabel('Cycle Count (log scale)')
plt.title('VMM Test')
plt.xticks([i + bar_width / 2 for i in index], operate_numbers, rotation=45)

# 添加图例
plt.legend()

# 调整布局
plt.tight_layout()

# 保存为PDF
plt.savefig('vmm_test.pdf', format='pdf')

# 显示图表
plt.show()