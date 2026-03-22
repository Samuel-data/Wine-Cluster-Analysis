## **Wine Retail: Customer Segmentation & Cluster Analysis**

### **Project Overview**
This project identifies distinct customer segments within a wine retail dataset to drive a more efficient, resource-conscious marketing strategy. By grouping customers based on purchase volume, discount sensitivity, and varietal preference, we transition from "blanket" marketing to targeted, high-conversion promotions.

### **The Data**
The analysis is based on `WineData.csv`, which tracks customer responses to various wine offers.
* **Note:** If the dataset is large or private, ensure it is listed in your `.gitignore`.

### **Key Technical Features**
* **Exploratory Data Analysis (EDA):** Statistical summary of purchasing behavior (volume vs. discounts).
* **K-Means Clustering:** Optimization of cluster counts (k=3) using the Elbow Method to balance granularity and business logic.
* **Segment Profiling:** Identification of three core personas: "Bulk Buyers," "Varietal Specialists," and "Occasional Shoppers."

### **Actionable Strategy**
Based on the clusters, we developed the **"Clear Liquids"** campaign, which targets the high-volume cluster with specific bulk-purchase incentives for whites and sparkling wines.

### **Tools Used**
* **Language:** R
* **Libraries:** `tidyverse` (dplyr, ggplot2), `cluster`

### **How to Use**
1. Clone the repo.
2. Open `Cluster-Assignment.R` in RStudio.
3. Run the script to generate the segmentation model and visualizations.
