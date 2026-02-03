# Developer Technology Trends Analysis (IBM Capstone)

## Executive Summary
This project analyzes current and anticipated technology trends among software developers using global survey data. The analysis focuses on programming languages, databases, platforms, and developer demographics.

The findings show that developer ecosystems are shaped by **stability with gradual change**. Core technologies remain dominant, while interest in newer and cloud-native tools grows incrementally rather than through disruptive shifts. Python was used for data cleaning and aggregation, IBM Cognos Analytics for interactive dashboards, and insights were communicated through a stakeholder-ready presentation.

---

## Business Questions
- Which programming languages and databases are most widely used today?
- Which technologies do developers want to work with in the future?
- How do technology preferences vary across demographic groups?
- What implications do these trends have for developers, organizations, and technology strategy?

---

## Dataset
**Source:** Stack Overflow Developer Survey dataset (CSV)

**Key characteristics:**
- Global survey of software developers
- Multi-valued categorical fields (semicolon-separated)
- Large raw file size requiring preprocessing for BI tooling

---

## Tools & Technologies
- Python (pandas)
- Visual Studio Code
- IBM Cognos Analytics
- Microsoft PowerPoint
- Git & GitHub

---

## Methodology (High Level)
Raw survey data was cleaned and pre-aggregated in Python to address BI tool constraints. Multi-choice responses were separated, summarized, and aggregated to compute technology usage counts in advance. The aggregated dataset was then uploaded to IBM Cognos Analytics to enable accurate, performant dashboarding.

---

## Key Findings

### Programming Language Trends
- Usage is concentrated in a small set of dominant programming languages.
- Future preferences closely mirror current usage, indicating **incremental evolution rather than major shifts**.
- Emerging languages attract disproportionate interest relative to their current adoption.

**Implications:**
- Core languages remain the foundation of developer capability.
- Skill development should prioritize widely used languages, with targeted investment in selected emerging technologies.

---

### Database Trends
- SQL and relational databases remain widely used across teams.
- Interest in cloud-based and scalable database solutions is steadily increasing.
- Developers commonly work across both established and newer data platforms.

**Implications:**
- SQL skills remain highly relevant.
- Familiarity with cloud-native databases is growing in importance.
- Platform strategies should balance operational stability with selective innovation.

---

## Dashboard Insights
The dashboards integrate **current technology usage, future interest, and developer demographics** in a single view.

Key observations include:
- PostgreSQL and AWS lead both current usage and future interest, signaling continuity rather than disruption.
- Web framework preferences show mild rotation but remain concentrated within leading technologies.
- Future interest strongly reflects existing adoption patterns.
- Respondents skew toward mid-career professionals (ages 25–44) with Bachelor’s or Master’s degrees.
- Geographic participation is uneven, with the U.S. exerting outsized influence on observed trends.

---

## Deliverables
- Cleaned and aggregated dataset
- Interactive dashboards (IBM Cognos Analytics)
- Stakeholder-ready presentation
- Project documentation

---

## Limitations & Next Steps
- Survey data is self-reported and subject to response bias.
- Analysis focuses on frequency rather than causality.
- Future work could extend the analysis with regional comparisons, salary segmentation, or longitudinal trend analysis.

---

## Conclusion
The analysis highlights clear patterns in programming language and database usage while emphasizing the balance between stability and gradual change in developer ecosystems. Interactive dashboards enable accessible exploration of current and future technology trends, and demographic context adds depth to the findings. Overall, the project supports more informed decision-making for developers, organizations, and technology leaders.
