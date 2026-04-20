# E-Commerce Customer & Sales Analysis 🛒

## Project Overview
An end-to-end data analysis project on a real UK-based online retailer 
using Python for data cleaning and RFM analysis, MySQL for advanced SQL 
queries, and Tableau for interactive visualization. The dataset contains 
541,909 transactions cleaned down to 397,884 quality records.

## Tools Used
- **Python (Pandas)** — data cleaning, EDA, RFM analysis
- **MySQL** — advanced SQL queries with CTEs and window functions
- **Tableau Public** — interactive dashboard
- **GitHub** — version control and portfolio hosting

## Dataset
- **Source:** UCI Machine Learning Repository — Online Retail Dataset
- **Records:** 541,909 raw transactions → 397,884 after cleaning
- **Period:** December 2010 to December 2011

## Dashboard
🔗 [View Live Tableau Dashboard](https://public.tableau.com/app/profile/shardul.tidke/viz/E-CommerceAnalysis_17766848201130/Dashboard2)

## Data Cleaning Steps
- Dropped 135,080 rows with missing CustomerID (24.9% of data)
- Removed 8,905 cancelled orders identified by 'C' prefix in InvoiceNo
- Removed 40 rows with negative or zero quantity and unit price
- Added TotalPrice column (Quantity × UnitPrice)
- Parsed InvoiceDate to datetime format

## Key Business Findings

**1. Revenue peaked in November 2011 at £1,161,817**
The business showed a strong upward growth trend from mid-2011, 
with revenue nearly doubling from £447,137 in February to £1,161,817 
in November. The December drop is due to incomplete data — dataset 
ends on 9th December.

**2. PAPER CRAFT LITTLE BIRDIE was the top revenue product**
This single product generated the highest revenue across all 
transactions — suggesting it should be prioritised in inventory 
planning, promotions, and restocking decisions.

**3. Netherlands was the top international market**
Excluding the UK which dominates domestically, Netherlands led 
international revenue followed by EIRE and Germany. These three 
markets represent the highest international expansion opportunity.

**4. 385 customers are At Risk — urgent business priority**
These customers previously bought frequently but have gone inactive. 
Targeted re-engagement campaigns like discount vouchers or personalised 
emails could recover significant revenue from this group.

**5. Only 96 customers are Loyal out of 4,338 total**
Just 2.2% of customers are in the Loyal segment — suggesting the 
business struggles with customer retention. Introducing a loyalty 
programme could significantly improve repeat purchase rates.

**6. 1,042 customers are completely Lost**
24% of the customer base has not purchased in nearly 2 years with 
minimal order history. Marketing spend on this segment should be 
minimised — focus budget on Champions and At Risk instead.

**7. Champions (1,006 customers) drive disproportionate value**
With an average frequency of 10.96 purchases, Champion customers 
are the backbone of the business. Retaining them through exclusive 
offers and early access to new products should be a top priority.

## RFM Segmentation Summary

| Segment | Customers | Avg Recency | Avg Frequency | Avg Monetary |
|---------|-----------|-------------|---------------|--------------|
| Champions | 1,006 | 378 days | 10.96 | £3.76 |
| Loyal | 96 | 375 days | 3.29 | £1.78 |
| Potential Loyalist | 400 | 397 days | 3.03 | £2.89 |
| New Customer | 238 | 392 days | 1.00 | £1.40 |
| At Risk | 385 | 455 days | 4.95 | £3.45 |
| Lost | 1,042 | 581 days | 1.12 | £1.39 |
| Others | 1,171 | 458 days | 2.28 | £2.25 |

## Advanced SQL Concepts Used
- **CTEs** — breaking complex queries into readable named steps
- **Window Functions** — RANK() for customer leaderboard, 
  LAG() for month over month revenue growth calculation
- **Date Functions** — YEAR(), MONTH() for time series analysis

## Project Structure
ecommerce-analysis/
├── data/
│   ├── rfm_segments.csv
│   ├── monthly_revenue.csv
│   ├── top_products.csv
│   └── top_countries.csv
├── notebooks/
│   └── ecommerce_analysis.ipynb
├── queries.sql
├── README.md
├── .gitignore
└── LICENSE

## Business Recommendations
1. **Re-engage At Risk customers** — 385 customers with good history 
   going inactive. Send personalised discount within 30 days.
2. **Protect Champions** — 1,006 high frequency customers. 
   Give them early access, loyalty rewards, and personalised service.
3. **Convert New Customers** — 238 one-time buyers. 
   Follow up with a second purchase incentive within 2 weeks.
4. **Expand Netherlands presence** — top international market, 
   consider localised marketing and faster shipping options.
5. **Deprioritise Lost segment** — 1,042 customers inactive for 
   2 years. Minimal marketing spend, one final win-back email only.
