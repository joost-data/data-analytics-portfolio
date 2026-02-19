# Project Brief — NHS Scotland A&E Performance (Power BI)

## Objective
Build an executive-style Power BI report that helps understand:
1) how A&E demand changes over time,
2) how waiting over 4 hours changes over time,
3) when and where pressure is most visible.

## Data Sources
NHS Scotland open data (CSV), covering 2007–2025:
- Monthly Accident and Emergency Activity
- When
- Referral Source

## Key Decisions
- Use **AttendanceCategory = All** as the consistent definition across visuals.
- Use a single **Year range (between) slicer** for interactivity.
- Focus the report on patterns and distribution (not causes).

## Modeling Approach
- Built a semantic model in Power BI to keep measures consistent.
- Standardized Month (YYYYMM) into a proper Date field.
- Created a Date dimension to support filtering and time-based analysis.
- Ensured relationships allow consistent filtering across tables.

## Report Design (Story Flow)
Page 1 — Overview:
- Demand trend + waiting performance + hotspots

Page 2 — Drivers:
- Arrival routes + month-of-year pattern + time-of-day pattern

Page 3 — Definitions:
- KPI definitions + data notes + interpretation guardrails

## Deliverables
- Screenshots (3 pages)
- PDF export
- PPTX presentation
- [Insights summary](`reports/insights.md`)
