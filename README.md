# Data Analytics Portfolio

## About

I’m Joost — a data and analytics professional with 12+ years of experience translating complex marketing, product, and research data into clear, decision-ready insights.

My background spans SaaS, research, and international organizations, where I’ve worked across reporting, experimentation support, performance diagnosis, and leadership dashboards. I focus on defining the right questions, preparing reliable data (SQL, Python, Excel), and explaining results in a way that helps non-technical stakeholders understand what is happening and why it matters.

I’m currently formalizing and documenting my analytics practice through structured portfolio projects, combining Python, SQL, BI dashboards, and clear written communication. I use generative AI selectively to accelerate drafting and iteration, with emphasis on verification, reproducibility, and judgment.

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

## Upcoming Projects

### Project 03 - Anchor BI Project (in progress)


---

## How to Read This Portfolio

Each project is documented at two levels:
- **README.md** — concise, external-facing summary focused on insights and outcomes
- **PROJECT_BRIEF.md** — internal, step-by-step documentation of analytical decisions and trade-offs

The goal is clarity, judgment, and real-world relevance rather than technical display.
