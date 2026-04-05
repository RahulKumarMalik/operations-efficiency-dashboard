# 🚀 Operations Efficiency & Process Bottleneck Analysis

![MySQL](https://img.shields.io/badge/MySQL-00000F?style=for-the-badge&logo=mysql&logoColor=white)
![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)
![Python](https://img.shields.io/badge/Python-14354C?style=for-the-badge&logo=python&logoColor=white)

## 📌 Live Interactive Dashboard
👉 **[View the Live Dashboard Here](https://[your-username].github.io/[your-repo-name]/)** *(Note: Replace this bracketed text with your actual GitHub Pages link once generated!)*

## 🏢 Business Problem
A mid-size e-commerce operation was experiencing fulfilling delays and stockouts. Management lacked visibility into the supply chain lifecycle, making it impossible to identify whether delays were caused by supplier unreliability, warehouse processing lags, or capacity constraints.

## 💡 Analytical Solution
Designed a relational supply chain database and engineered an end-to-end analytical workflow to identify system bottlenecks. 
- Modeled a 6-table normalized database in **MySQL** containing 80,000+ transactional records.
- Utilized **SQL Window Functions and CTEs** to isolate the top 5 process bottlenecks based on cycle time, order-to-ship lag, and warehouse dwell time.
- Developed an **Excel Capacity Planning Model** leveraging trend extrapolation to recommend a 15% staff reallocation.
- Built a **Live Executive Dashboard** to communicate the projected impact of the staff reallocation on SLA adherence and fulfillment delays.

## 🛠️ Repository Structure
- `index.html`: The interactive front-end dashboard visualizing the final business outcomes.
- `data_generator.py`: Python script utilizing `Faker` and `Pandas` to generate 80,000+ rows of realistic operational mock data.
- `1_schema_setup.sql`: DDL scripts establishing the normalized relational database structure.
- `2_bottleneck_analysis.sql`: Advanced SQL queries for cycle time analysis and lead-time deviation calculations.
