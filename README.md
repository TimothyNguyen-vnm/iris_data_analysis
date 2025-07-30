# iris_data_analysis
A complete analysis pipeline in R using the Iris dataset, covering data transformation with dplyr, visualizations with ggplot2, statistical testing (t-tests, ANOVA), and unsupervised learning via K-Means clustering.

# 🌸 Iris Data Exploration & Clustering in R

This project provides a comprehensive analysis of the classic **Iris flower dataset** using **R**. It walks through data exploration, transformation, visualization, hypothesis testing, and unsupervised learning through **K-Means clustering**. Designed for beginners to intermediate R users, the project highlights powerful packages like `dplyr`, `ggplot2`, `GGally`, `cluster`, and `fpc`.

---

## 📦 Packages Used

| Package    | Purpose                                 |
|------------|-----------------------------------------|
| `dplyr`    | Data manipulation and transformation    |
| `ggplot2`  | Data visualization                      |
| `GGally`   | Enhanced scatterplot matrix (`ggpairs`) |
| `reshape2` | Data reshaping (e.g., `melt()`)         |
| `cluster`  | Clustering algorithms                   |
| `fpc`      | Cluster visualization                   |

Install them using:

```r
install.packages(c("dplyr", "ggplot2", "GGally", "cluster", "fpc", "reshape2"))

iris-data-exploration/
├── iris_analysis.R       # Main analysis script
├── README.md             # Project overview and instructions
├── .gitignore            # Ignore R session files (optional)
└── iris_plots/           # (Optional) Directory for saved visualizations

### ✅ 1. Data Exploration
- View structure, types, summary, and shape of the dataset.
- Use `summary()`, `str()`, `class()`, and `dim()`.

### 🔧 2. Data Transformation
- Filter rows by species and conditions.
- Add and sort columns with `mutate()` and `arrange()`.
- Reshape with `melt()` for plotting.

### 📈 3. Data Visualization
- Create histograms, boxplots, scatter plots, and pair plots.
- Use both base R and `ggplot2`.

### 🔬 4. Hypothesis Testing
- Compare two species' petal lengths using a **t-test**.

### 🧠 5. Clustering
- Use **K-Means clustering** to group flowers.
- Visualize clusters and compare to actual species.
