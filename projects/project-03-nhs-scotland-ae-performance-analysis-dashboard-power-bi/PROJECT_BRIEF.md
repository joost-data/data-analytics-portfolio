# Project Brief — NHS Scotland A&E Performance (Power BI)

## Objective
Build an executive-style Power BI report that helps understand:
1) how A&E demand changes over time,
2) how waiting performance changes over time (especially waits over 4 hours),
3) when and where pressure is most visible.

The report uses NHS Scotland open data covering 2007–2025.

## Data Sources
CSV releases from NHS Scotland open data:
- Monthly Accident and Emergency Activity (core KPI table)
- When (timing patterns: day/hour/in-hours vs out-of-hours)
- Referral Source (arrival routes)

## Key Data Reality
The data is aggregated and published for reporting.
This means the analysis focuses on patterns, trend, and distribution — not causal claims.

## Modeling Approach (Semantic Model)
A star-style model was used to keep measures consistent and visuals reliable.

**Core fact table**
- Monthly A&E activity (monthly performance measures)

**Supporting tables**
- When (timing patterns)
- Referral (arrival routes)

**Shared dimensions**
- Date (built from Month field)
- Health Board (HBT)

## Key Preparation Steps
1. Loaded CSVs into Power BI.
2. Standardized the Month field (YYYYMM) into a usable Date (first day of the month).
3. Removed or ignored Quality Flag (QF) columns to avoid misinterpretation.
4. Applied a global filter:
   - AttendanceCategory = All
5. Created measures for consistency rather than relying on pre-calculated percentages.

## KPI Measures (High level)
- Total Attendances
- Over 4 hours (count)
- Seen within 4 hours (%)
- Over 8 hours (count)
- Over 12 hours (count)
- Latest year vs previous year (within selected year range)

## Report Design (Story Flow)
**Page 1 — A&E performance overview**
- What is happening overall? (trend + headline KPIs)
- Where are long waits concentrated?

**Page 2 — What drives A&E pressure**
- When does pressure tend to rise? (month of year, hour of day)
- How do people arrive? (referral routes)

**Page 3 — How to read this report**
- Definitions and data notes to prevent misuse or over-claiming.

## Quality & Interpretation Checks
- Verified that the Year range slicer affects all pages consistently.
- Checked KPI consistency between cards and charts.
- Ensured all titles and subtitles use plain English and avoid jargon.

## Deliverables Checklist
- [ ] Power BI report saved with clear name
- [ ] PDF export created
- [ ] 3 dashboard screenshots captured (one per page)
- [ ] reports/insights.md written (key observations + implications)
- [ ] README.md updated (portfolio-facing)
- [ ] Slides folder created for PPT/PDF versions
