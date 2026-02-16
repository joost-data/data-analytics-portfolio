# Project Brief — NHS Scotland A&E Performance

## Objective

Transform publicly available NHS A&E operational data into an executive-grade performance dashboard using dimensional modeling principles.

---

## Workflow

1. Downloaded Monthly A&E, When, and Referral datasets.
2. Reviewed schema and quality flag (QF) fields.
3. Cleaned data in Power BI:
   - Removed or handled QF columns appropriately.
   - Standardized Month field (YYYYMM → Date).
4. Designed star schema:
   - Fact_AE_Monthly (core KPIs)
   - Dim_Date
   - Dim_Board
   - Dim_Referral
   - Dim_TimePattern
5. Created calculated measures:
   - % Within 4 Hours
   - % Over 8 Hours
   - YoY Attendance Change
6. Built 3-page dashboard:
   - Executive Overview
   - Drivers (Referral + Time)
   - Definitions & Data Notes
7. Exported report to PDF.
8. Documented findings and limitations.

---

## Modeling Notes

- Fact table grain: One row per Month × Health Board × Department Type.
- Percentage fields recalculated where appropriate to avoid dependency on pre-calculated columns.
- Quality Flag (QF) columns reviewed to avoid misinterpretation.
- Relationships enforced as single-direction from dimensions to fact.

---

## Deliverables

- Power BI report
- PDF export
- Documentation
- Portfolio-ready README
