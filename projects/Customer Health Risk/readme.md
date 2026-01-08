# Customer Health & Risk Monitoring (SQL Practice)

## Overview

This project explores how SQL-based analytics can be used to monitor customer health, surface operational risks, and quantify value delivered across a customer base.

The goal is to design metrics and queries that help teams understand which customers are doing well, which may need attention, and where operational inefficiencies or quality issues are emerging. I built this project as a way to practice and strengthen SQL skills in a realistic, business-oriented context.

## Business Question

- How can we proactively identify customers who may be at risk due to declining performance, quality issues, or operational slowdowns?
- How can customer-level metrics be structured to support ROI conversations and prioritization by Customer Success, Product, or Leadership?

These insights would be most useful to:
- Customer Success teams monitoring account health
- Product and Operations teams looking for systemic issues
- Leadership teams evaluating value delivery and retention risk

## Data

**Source:** Simulated operational and customer data (schema-only)

**Description:** This project assumes an integrated analytics environment with data coming from:
- A CRM system (customer metadata and contracts)
- A product or operational database (workflow events and processing times)
- An outcomes system capturing quality signals (e.g. denials or failures)

No real customer data is included. The focus is on schema design, metric definition, and SQL logic rather than raw data values.

## Approach

1. I designed a simple relational schema based on others I've seen representing customer, operational, and outcome data
2. I defined success metrics aligned to customer health, efficiency, and quality
3. I wrote SQL queries to aggregate metrics at the customer-month level
4. I created risk flags and summary outputs that could feed dashboards or executive reporting

The goal was to mirror how analytics work is done in practice: SQL for extraction and aggregation, with results consumed by BI tools or downstream analysis.

## Key Metrics

- Tickets Processed: a proxy for usage and customer engagement
- Average Processing Time: highlights operational efficiency and workflow friction
- Data Error Rate: surfaces upstream quality issues that impact downstream outcomes
- Denial Rate: represents outcome quality and potential revenue or satisfaction risk
- Value-to-Cost Ratio: a simple ROI signal comparing estimated value delivered to subscription cost

## Key Insights

- Customer health can be monitored effectively using a small number of well-chosen operational and quality metrics
- Changes in efficiency or quality metrics often act as early warning signals before more obvious issues (like volume drops) appear
- Combining usage, efficiency, and outcome metrics provides a more complete picture than any single KPI on its own

## Tools & Technologies

- SQL (primary focus)
- Aggregations, window functions, CTEs
- Customer-level KPI and risk modeling
- Data warehouse–style modeling (schema design and metric layering)

*This project was intentionally SQL-forward as part of building deeper comfort with analytical SQL in a realistic business setting.*

## Outcome & Impact

This analysis demonstrates how SQL can be used to:
- Monitor customer health at scale
- Identify accounts that may need proactive support
- Support ROI and value-based conversations
- Surface operational and quality risks before they become larger problems

The structure and queries in this project could be used directly as the foundation for dashboards, alerts, or automated reporting.

## Next Steps

- Incorporate time-based trends and rolling averages for smoother risk detection
- Connect outputs to a BI tool for visualization and self-serve reporting
- Add alerting logic for high-risk customers or sudden metric changes
- Expand the value model with more detailed cost and outcome assumptions

## How to Run

This project is structured to reflect how analytics work is often shared internally: as a set of schemas and SQL queries that can be adapted to an existing data warehouse.

To run or adapt this analysis in a SQL environment:

1. Create the tables
   - Start by reviewing and executing `schema.sql` in a SQL database (e.g., Postgres, Snowflake).
   - The schema defines the structure expected by the analysis but does not include any real data.

2. Load data (optional)
   - Populate the tables with simulated or internal data that matches the schema.
   - No sample data is included in this repository by design; the focus is on query structure and metric logic.

3. Run analytical queries
   - Execute the SQL files in the `queries/` folder in order:
     1. `01_customer_health_kpis.sql` — builds customer-level operational and quality metrics
     2. `02_roi_analysis.sql` — estimates value delivered relative to subscription cost
     3. `03_risk_flags.sql` — identifies early warning signals and at-risk customers
     4. `04_exec_summary.sql` — produces a high-level view suitable for leadership reporting

4. Visualize or operationalize
   - The outputs of these queries are designed to feed BI tools (e.g., Tableau, Power BI, Sigma) or downstream Python analysis.
   - In a production setting, these queries would typically be scheduled as part of a reporting or ETL pipeline.

>Note: I know I sound like a broken record, but this project was built to practice and demonstrate SQL analytics patterns rather than to serve as a plug-and-play application. 
