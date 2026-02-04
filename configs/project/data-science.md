# 数据科学项目配置

> 适用于 Python 数据分析、机器学习项目

## 项目特定规则

### 技术栈识别
- **Jupyter**: 检测 `.ipynb` 文件
- **数据分析**: pandas, numpy, scipy
- **机器学习**: scikit-learn, tensorflow, pytorch
- **可视化**: matplotlib, seaborn, plotly

### 目录结构
```
project/
├── data/              # 数据文件
│   ├── raw/          # 原始数据
│   └── processed/    # 处理后的数据
├── notebooks/         # Jupyter notebooks
├── src/              # 源代码
├── models/           # 训练好的模型
└── reports/          # 报告和可视化
```

### 代码风格
- 遵循 PEP 8 规范
- 使用类型提示
- 函数添加 docstring

### 常用命令
```bash
# 安装依赖
pip install -r requirements.txt

# 启动 Jupyter
jupyter notebook

# 运行脚本
python src/train.py

# 测试
pytest tests/
```

### 数据处理最佳实践
- 原始数据不修改，保存处理后的版本
- 数据文件不提交到 Git（使用 DVC 或 Git LFS）
- 记录数据处理步骤
- 使用随机种子保证可复现性

### 模型管理
- 保存模型训练参数
- 记录模型性能指标
- 版本化模型文件
