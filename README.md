# 🚀 Operations Efficiency & Process Bottleneck Analysis

![MySQL](https://img.shields.io/badge/MySQL-00000F?style=for-the-badge&logo=mysql&logoColor=white)
![Power BI / Streamlit](https://img.shields.io/badge/Streamlit-FF4B4B?style=for-the-badge&logo=Streamlit&logoColor=white)
![Python](https://img.shields.io/badge/Python-14354C?style=for-the-badge&logo=python&logoColor=white)

## 📌 Business Problem
A mid-size e-commerce operation was experiencing fulfilling delays and stockouts. Management lacked visibility into the supply chain lifecycle, making it impossible to identify whether delays were caused by supplier unreliability, warehouse processing lags, or capacity constraints.

## 💡 Solution
Designed a relational supply chain database and engineered an end-to-end analytical workflow to identify system bottlenecks. 
- Modeled a 6-table normalized database in **MySQL** containing 80,000+ transactional records.
- Utilized **SQL Window Functions and CTEs** to isolate the top 5 process bottlenecks based on cycle time, order-to-ship lag, and warehouse dwell time.
- Built an interactive **Web Dashboard** tracking SLA adherence and on-time delivery rates.
- Developed a **Capacity Planning Model** leveraging trend extrapolation to recommend a 15% staff reallocation, reducing fulfillment delays.

## 🛠️ Repository Structure
- `app.py`: The interactive Streamlit dashboard simulating the final Power BI presentation.
- `requirements.txt`: Python dependencies for the web app.
- `data_generator.py`: Python script utilizing `Faker` and `Pandas` to generate 80,000+ rows of realistic operational mock data.
- `1_schema_setup.sql`: DDL scripts establishing the normalized relational database structure.
- `2_bottleneck_analysis.sql`: Advanced SQL queries for cycle time analysis and lead-time deviation calculations.

## 🚀 How to Run Locally
1. Install dependencies: `pip install -r requirements.txt`
2. Run the dashboard: `streamlit run app.py`
3. (Optional) Run `python data_generator.py` to generate raw CSV data for MySQL testing.
