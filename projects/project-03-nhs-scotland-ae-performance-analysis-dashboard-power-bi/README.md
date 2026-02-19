# Project 03 — NHS Scotland A&E Performance Analysis

## Executive Summary
This project analyzes Accident & Emergency (A&E) performance across NHS Scotland using publicly available data from 2007 to 2025.
The report focuses on three questions: how demand changes over time, how often people wait longer than 4 hours, and when pressure tends to be highest.

The result is a simple, executive-style Power BI report with:
- A clear overview of demand and waiting performance
- A “drivers” page showing when and how people attend A&E
- A definitions and data notes page to support correct interpretation

## Quick links
- [Dashboard screenshots:](./dashboards/)
- [Insights summary:](./reports/insights.md)
- [Slides (PPT + PDF):](./slides/)

## What you can learn from this report
- Whether A&E attendance is rising or falling over time
- Whether long waits are becoming more or less common
- Which areas (Health Boards) see the highest volumes of long waits
- When pressure tends to peak (by month of the year and time of day)
- How arrival routes (referral sources) relate to overall attendance volume

---

## Business Questions
- Is A&E (Accident & Emergency Department) demand increasing over time?
- Are waiting time outcomes improving or worsening?
- Where are long waits concentrated?
- When does pressure tend to be highest?
- How do arrival routes and timing patterns help explain demand?

---

## Dataset

**Source:** NHS Scotland open data (CSV)
**Coverage:** 2007–2025 (monthly reporting)

**Files used**
- **Monthly Accident and Emergency Activity**: core KPIs (attendances and long waits)
- **When**: timing patterns (day / hour / in-hours vs out-of-hours)
- **Referral Source**: how people arrived (e.g., ambulance, GP practice)

**Important notes**
- This is aggregated reporting data (not patient-level).
- The report shows patterns and change over time. It does not prove causes.

## Tools
- Power BI (browser version)
- Basic dimensional modeling (semantic model)
- Measures for KPI calculation and consistency

## Report Pages
### Page 1 — A&E performance overview
Shows:
- Total attendances
- Share seen within 4 hours
- Number waiting over 4 hours
- Latest year vs previous year (within the selected range)
Plus trend charts and a view of where long waits are highest.

### Page 2 — What drives A&E pressure
Shows:
- Attendance by referral route
- Waiting over 4 hours by month of the year
- Attendances by hour of day (timing pattern)

### Page 3 — How to read this report
Defines key terms and explains data limitations so results are not misread.

---

## Key Performance Indicators

- Total Attendances
- % Seen Within 4 Hours
- Number Over 4 Hours
- YoY Attendance Change
- Breach Rates by Referral Source
- Peak Attendance Timing Patterns

---

## KPI Definitions

- **Total attendances**: total number of A&E visits in the period.
- **Over 4 hours (count)**: number of attendances where the wait exceeded 4 hours.
- **Seen within 4 hours (%)**: the share of attendances that did not exceed 4 hours.
- **Latest year vs previous year**: compares the most recent year in the selected range to the year before it.

## Deliverables
- Power BI report (interactive)
- PDF export of the report (for sharing)
- Screenshots of each report page
- Written insights summary

## Limitations

- Aggregated monthly data only (no patient-level detail)
- No causal conclusions can be drawn from these charts alone
- Some fields include quality flags which require cautious interpretation
