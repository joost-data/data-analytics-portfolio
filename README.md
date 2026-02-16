# Data Analytics Portfolio

## About

I’m Joost — a Data Analyst with 12+ years of experience translating complex, multi-source performance and product data into evidence-based decisions, clear dashboards, and executive-ready insights.

My background spans SaaS, healthcare, and research environments. I’ve owned analytics and reporting end-to-end: defining questions with stakeholders, gathering and cleaning data (SQL, Python, Excel/Sheets), analysing performance and behaviour (funnels, attribution, cohorts, experiments), and communicating results in a way that supports clear next steps.

This portfolio contains structured projects that reflect how analysts work in real teams: a clear problem statement, a reproducible approach, concise findings, and decision framing. Where I use generative AI, it’s for drafting and iteration—final outputs are verified and documented for clarity and reproducibility.

---

## Projects

### Project 01 — Superstore SQL Profitability Analysis (SQLite)

End-to-end SQL case study analyzing where profit is created and destroyed in a retail business.

**What I did**
- Normalized raw CSV data into a relational schema (`customers`, `products`, `orders`, `order_items`).
- Built analysis views to support time-based and operational questions.
- Quantified profit drivers and loss concentration to inform pricing and discount decisions.

**Selected evidence**
- Overall profit margin: **12.47%** (profit **$286,397** on sales **$2,297,201**).
- Discount depth is the dominant profitability driver:
  - **0% discount:** **29.51%** margin (**+$320,988** profit)
  - **30%+ discount:** **–48.16%** margin (**–$125,007** profit)
- Losses concentrate in a small number of sub-categories and SKUs, notably **Tables** and several **Machines** products.

Repo: `./project-01-analysis-sql-superstore-profitability`

---

### Project 02 — Developer Survey Analysis & Visualization (Python, BI, Storytelling)

Analysis of current and anticipated technology trends among software developers using large-scale survey data.

This project focuses on transforming messy, multi-valued survey data into accurate, performant dashboards and stakeholder-ready insights.

**What I did**
- Prepared and cleaned raw survey data in Python, handling multi-valued categorical fields.
- Designed a pre-aggregation strategy to ensure accurate counts and fast BI performance.
- Built interactive dashboards in IBM Cognos covering:
  - Current technology usage  
  - Future technology preferences  
  - Developer demographics
- Synthesized findings into a concise presentation for a non-technical audience.

**Key takeaways**
- A small set of languages and databases dominate current usage.
- Future preferences largely follow existing adoption, indicating gradual rather than disruptive change.
- Relational databases remain foundational, with growing interest in cloud-native solutions.
- Demographics provide important context for interpreting technology trends.

Repo: `./project-02-data_visualization-python-developer-survey`

---

### Project 03 — NHS Scotland A&E Performance Analysis (Power BI)

Public-sector performance dashboard analyzing Accident & Emergency demand and waiting time performance across NHS Scotland.

##What I did##
- Designed a dimensional model from raw monthly public health datasets.
- Engineered KPIs to evaluate attendance growth and breach patterns.
- Built a 3-page executive dashboard:
  - Performance overview
  - Operational drivers (referral & timing)
  - Data definitions & governance notes

- Focus
  - Executive-level reporting
  - Health system pressure analysis
  - Transparent KPI definitions

Repo: ./projects/project-03-nhs-scotland-ae-performance-analysis
