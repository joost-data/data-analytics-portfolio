# Project 03 — NHS Scotland A&E Performance Analysis

## Executive Summary

This project analyzes Accident & Emergency (A&E) performance across NHS Scotland using publicly available monthly data.

The analysis focuses on attendance volumes, waiting time performance, breach patterns, and operational drivers such as referral source and time of attendance.

A dimensional model was designed in Power BI to transform raw CSV releases into an executive-level dashboard highlighting system pressure and access performance.

---

## Business Questions

- Is A&E demand increasing over time?
- Are waiting time targets being met consistently?
- Which Health Boards experience the most pressure?
- What referral pathways and time patterns drive breaches?

---

## Dataset

**Source:** NHS Scotland Open Data (Open Government Licence)

Files Used:
- Monthly Accident and Emergency Activity (core KPIs)
- When (attendance timing patterns)
- Referral Source (arrival pathways)

**Characteristics:**
- Monthly aggregated operational data
- Multiple dimensions (board, department type, referral, time)
- Contains quality flags (QF columns)

---

## Data Model

A star schema was implemented in Power BI:

**Fact Table**
- Monthly A&E Activity (attendances, waits over 4/8/12 hours)

**Dimensions**
- Date (Month, Year)
- Health Board (HBT)
- Referral Source
- Time Pattern (Day, Hour, In/Out of Hours)

This structure enables executive summaries and driver analysis within the same report.

---

## Key Performance Indicators

- Total Attendances
- % Seen Within 4 Hours
- Number Over 4 / 8 / 12 Hours
- YoY Attendance Change
- Breach Rates by Referral Source
- Peak Attendance Timing Patterns

---

## Key Findings (Initial Observations)

- Attendance volumes show structural seasonal variation.
- Breaches concentrate within specific Health Boards.
- Referral pathways differ in their relative contribution to waiting time pressure.
- Out-of-hours attendance patterns provide operational context for system load.

---

## Deliverables

- Power BI Dashboard (.pbix)
- Executive PDF Export
- Supporting documentation
- Data model documentation

---

## Limitations

- Aggregated monthly data (no patient-level detail)
- Public reporting format limits causal interpretation
- Quality flag (QF) fields require careful handling
