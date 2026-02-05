# Data Science Project Configuration

> For Python data analysis and machine learning projects

## Project-Specific Rules

### Tech Stack Detection
- **Jupyter**: Detect `.ipynb` files
- **Data Analysis**: pandas, numpy, scipy
- **Machine Learning**: scikit-learn, tensorflow, pytorch
- **Visualization**: matplotlib, seaborn, plotly

### Directory Structure
```
project/
├── data/              # Data files
│   ├── raw/          # Raw data
│   └── processed/    # Processed data
├── notebooks/         # Jupyter notebooks
├── src/              # Source code
├── models/           # Trained models
└── reports/          # Reports and visualizations
```

### Code Style
- Follow PEP 8 conventions
- Use type hints
- Add docstrings to functions

### Common Commands
```bash
# Install dependencies
pip install -r requirements.txt

# Start Jupyter
jupyter notebook

# Run scripts
python src/train.py

# Test
pytest tests/
```

### Data Processing Best Practices
- Don't modify raw data, save processed versions
- Don't commit data files to Git (use DVC or Git LFS)
- Document data processing steps
- Use random seeds for reproducibility

### Model Management
- Save model training parameters
- Record model performance metrics
- Version model files
