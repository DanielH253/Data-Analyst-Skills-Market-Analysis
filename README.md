**Skills Demonstrated:**

- SQL (JOINs, aggregations, filtering, GROUP BY, HAVING, CTEs, Subqueries)
- Salary vs demand trade-off modeling
- ETL with Power Query
- Visualization (Excel Charts)
- Version control with Git
----------------------------------------------------------------------------------------------------------------------------------------------------
**1. Problem:** Aspiring Data Analysts often lack clear information about which skills are most valuable for remote Data Analyst roles in the United States. This project analyzes U.S.-based remote job postings to identify skill demand and salary trends to support data-driven career decisions.
----------------------------------------------------------------------------------------------------------------------------------------------------
**2. Questions:**
----------------------------------------------------------------------------------------------------------------------------------------------------
- What are the highest-paying remote Data Analyst roles in the U.S.?
- Which remote Data Analyst role levels have the highest average salaries?
- Which skills are most commonly required in the highest-paying remote Data Analyst postings?
- Which skills are most in demand in U.S.-based remote Data Analyst postings?
- Which skills command the highest average salaries?
- Which skills offer the best balance of demand and compensation?
----------------------------------------------------------------------------------------------------------------------------------------------------
**3. Methodology:**
----------------------------------------------------------------------------------------------------------------------------------------------------
The dataset was filtered to include only remote (“Anywhere”) Data Analyst roles located in the United States. Job postings were joined with their associated skill records to link required skills with salary information. Skill demand was measured by counting the frequency of each skill across postings. Average salaries were calculated both at the role level and per individual skill. To identify optimal skills, demand and average salary metrics were evaluated together to highlight skills that demonstrate both strong market demand and competitive compensation.

**Disclaimer:** Because the analysis uses average salaries rather than medians, results may be influenced by higher-paying outliers.
----------------------------------------------------------------------------------------------------------------------------------------------------
**4. Results and Insights**
The following analysis focuses on U.S.-based remote Data Analyst roles.

**- Highest-paying Individual Postings (01_highest_paying_jobs.sql)**

Q: What are the highest-paying Data Analyst job postings?
A: The highest-paying postings are predominantly concentrated in **senior and executive-level roles** within major organizations. The top salary observed was **$336,500** for a **Director of Analytics** role at Meta.

However, high compensation is not exclusive to senior titles. **Standard Data Analyst** roles at large organizations such as Pinterest (**$232,423**) and UCLA Health (**$217,000**) also rank among the top-paying postings. This suggests that organizational scale and industry context can significantly influence compensation, sometimes outweighing title alone.
----------------------------------------------------------------------------------------------------------------------------------------------------
**- Average Salary by Role Level (02_avg_salary_by_role.sql)**

Q: How do average salaries compare between Data Analyst and Senior Data Analyst roles?
A: Senior Data Analyst roles earn approximately **20.6%** more on average than Data Analyst roles.
The average salary for Senior Data Analysts is **$113,409.59** compared to **$94,019.60** for Data Analysts.
This indicates a measurable compensation premium for experience and seniority in the U.S. remote market.
----------------------------------------------------------------------------------------------------------------------------------------------------
**- Skills in Top-Paying Roles (03_top_skills_high_salary_roles.sql)**

Q: Which skills appear most frequently in the highest-paying postings?
A: This dataset shows that in high-paying job postings, **SQL** dominates with 61 mentions, with **Snowflake** (Data Warehouse) and **Oracle** (Relational Database) as the most cited SQL dialects, appearing in 12 and 9 postings respectively. **Python** is also widely required, appearing in 45 postings, whereas its alternative, **R**, appears in 26 — indicating that the market generally favors **Python over R**, though **R** remains relevant.

For BI tools, **Tableau** appears 40 times, while **Looker** shows up in 18 postings, and **Power BI** is mentioned only 12 times, highlighting a clear preference for Tableau in high-paying Data Analyst roles. **Excel** appears 17 times, showing that spreadsheet skills remain an essential part of a Data Analyst's kit.

Cloud tools such as **Azure** or **AWS** appear in fewer than 10 postings, suggesting that while not core for Data Analysts, cloud experience is a valuable "nice to have."
----------------------------------------------------------------------------------------------------------------------------------------------------
**- Most In-Demand Skills (04_most_in_demand_skills.sql)**

Q: Which skills are most frequently required across all postings?
A: With the salary restriction removed, overall skill mentions increase substantially. **SQL** remains the most demanded skill, rising from 61 mentions in high-paying postings to 493 mentions across the broader market. The gap between SQL and the second most demanded skill is significant, reinforcing SQL’s position as the foundational requirement for Data Analyst roles.

Among database technologies, **Snowflake** (59 mentions), **Oracle** (46), and **SQL Server** (43) are the most frequently referenced SQL-related platforms. This indicates that while SQL itself is universal, specific database environments vary, with Snowflake leading among cloud data warehouse solutions.

**Tableau** emerges as the second most demanded skill overall, appearing in 293 postings. **Excel** follows closely with 290 mentions, showing that spreadsheet-based analysis remains highly relevant across the market. Compared to the high-paying subset, Excel’s stronger presence in the broader dataset suggests it is widely required across a range of compensation levels.

**Python** appears in 285 postings, ranking just below Tableau and Excel. While it drops slightly in position compared to the high-paying subset, its frequency confirms that it remains a core technical skill. **R** appears in 175 postings, indicating that although Python is more commonly required, R still maintains a meaningful presence in the Data Analyst ecosystem.

Among BI tools, Tableau (293) clearly leads, followed by **Power BI** (130), **SAS** (81), and **Looker** (76). This hierarchy suggests a strong market preference for Tableau, with Power BI serving as a significant alternative.

Cloud platforms such as **Azure** (35) and **AWS** (31) appear far less frequently than core analytical tools. While cloud knowledge is present in the market, it does not appear to be a primary requirement for most Data Analyst roles compared to SQL, BI tools, and programming languages.
----------------------------------------------------------------------------------------------------------------------------------------------------
**- Highest-Paying Skills (05_top_salaries_for_skills.sql)**

This analysis explores the relationship between technical competencies and compensation for U.S.-based remote Data Analyst roles. By filtering for a minimum frequency of 10 job postings, the study identifies a clear bifurcation in the labor market: High-volume foundational skills (Excel, SQL) provide broad market accessibility, while specialized technical ecosystems (Big Data, Cloud, Engineering-heavy Python) command the highest salary premiums.

**1. The Premium Tier: Hybrid & Engineering Skills**
The highest average salaries are associated with skills that overlap with Data Engineering and scalable infrastructure.

**Data Orchestration:** Tools like **Databricks** ($133,342) and **Hadoop** ($120,509) lead the rankings, signaling a premium on large-scale data processing.

**Technical Specialization:** Specialized Python libraries like **Pandas** ($146,476) and lower-level languages, such as **C** ($122,914), **C++** ($109,336), and **Go** ($118,776) appear in high-paying, niche roles, suggesting that performance-intensive environments offer higher compensation.

**Cloud Infrastructure:** While not the most demanded, **AWS** ($116,222) and **Azure** ($113,936) consistently appear in higher-tier salary brackets.

**2. The Core Analyst Stack: Consistency over Premium**
Foundational tools remain essential for market entry but do not independently drive top-tier salaries.

**Languages:** **Python** ($106,526) maintains a slight salary and demand lead over **R** ($105,589).

**BI Tools:** **Looker** ($111,240) commands a higher premium than market leaders **Tableau** ($104,401) and **Power BI** ($100,270), signaling a contrast where Tableau was the most demanded skill compared to Looker, but the latter offers higher compensation.

3. **The "Excel Paradox"**
**Excel** represents the widest gap between utility and compensation. While it is one of the most frequently requested skills globally, it ranks significantly lower in salary ($90,542). This reinforces its status as a foundational requirement rather than a specialized differentiator.
----------------------------------------------------------------------------------------------------------------------------------------------------
**- Optimal Skills (Demand x Compensation) (06_optimal_skills.sql)**

Q: Which skills offer the strongest combination of high demand and high pay?
A: To determine the most optimal skills, a combined metric was calculated by multiplying skill demand by average salary. The results were then ordered by this value to identify skills offering the strongest balance between market demand and compensation.

The top two skills remain unchanged from the most in-demand ranking: **SQL** and **Tableau**. Their leading positions indicate that they not only appear frequently in job postings but also maintain competitive salary levels, making them the strongest overall performers in this dataset.

The first meaningful shift occurs in third place. While **Excel** (290 mentions) slightly exceeds **Python** (285 mentions) in demand, Python’s higher average salary ($106,526 vs. $90,542) elevates it above Excel in the optimization ranking. This suggests that although Excel is marginally more common, Python offers stronger compensation leverage, making it the more strategically balanced skill between the two.

For the first time, **R** does not rank directly behind Python. While R’s average salary ($105,589) is comparable to Python’s, its lower demand (175 mentions) places it in fifth position, creating a noticeable gap between it and Excel. This reinforces a consistent pattern observed throughout the analysis: Python maintains both broader demand and slightly stronger salary positioning compared to R.

Among BI tools, **Power BI** remains ahead of **Looker** and **SAS** in the optimization ranking. Although Looker and SAS offer marginally higher average salaries, Power BI’s substantially stronger demand secures its higher placement among the cited tools, second only to Tableau. For someone choosing between these tools, Tableau appears to offer the most balanced trade-off between employability and compensation, with Power BI also being a solid choice.

Within SQL dialects, **Snowflake, Oracle, and SQL Server** retain the same order observed in the demand analysis. Notably, their ranking aligns with both demand and salary levels. Snowflake leads not only in frequency but also in compensation among the three, making it the strongest option when evaluated through an optimization lens.

Cloud tools remain outside the very top tier. Although **AWS** ($116,222) offers a slightly higher average salary than **Azure** ($113,936), Azure’s marginally higher demand (35 vs. 31 mentions) results in a slightly stronger optimization score. However, the differences in both demand and salary are small enough that either skill could be considered comparable in practical terms.
----------------------------------------------------------------------------------------------------------------------------------------------------

**Key Takeaways:**

- **SQL** is the most consistently valuable skill in the Data Analyst market, ranking highest in demand and remaining strong when compensation is considered.

- **Tableau** and **Python** form the core analytical stack alongside SQL, offering both strong demand and competitive salaries.

- **Excel** is highly demanded but offers lower average compensation, suggesting it is foundational but less associated with higher-paying roles.

- **Python** outperforms **R** in both demand and salary balance, reinforcing its position as the preferred programming language for Data Analysts.

- High-paying skills often overlap with engineering and infrastructure domains (e.g., **Pandas, Databricks, Hadoop, Cloud platforms**), but these appear in fewer postings and may reflect more specialized roles.

- SQL dialects such as **Snowflake** show both strong demand and competitive salaries, making them strategically valuable within the database ecosystem.

- Cloud skills (**AWS, Azure**) provide solid compensation but are not core requirements for most Data Analyst roles based on demand frequency.

- Overall, the Data Analyst market appears to have two tiers:

---- Broad Analyst Roles → High demand, moderate pay (**SQL, Excel, Tableau**)

---- Hybrid / Advanced Roles → Lower demand, higher pay (**Big Data, Cloud, Engineering tools**)