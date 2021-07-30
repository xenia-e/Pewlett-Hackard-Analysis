# Pewlett-Hackard Analysis
## Overview of Project
Using provided SQL data, we need to determine the number of retiring employees per title and identify employees that are eligible to participate in a mentorship program. Then, export all data to CSV files for further use.

## Deliverables

This assignment consists of two technical analysis deliverables and a written report:

__Deliverable 1:__ [The Number of Retiring Employees by Title](https://github.com/xenia-e/Pewlett-Hackard-Analysis/blob/main/Data/retiring_titles.csv)

__Deliverable 2:__ [The Employees Eligible for the Mentorship Program](https://github.com/xenia-e/Pewlett-Hackard-Analysis/blob/main/Data/mentorship_eligibility.csv)

__Deliverable 3:__ A written report on the employee database analysis ([README.md](https://github.com/xenia-e/Pewlett-Hackard-Analysis/blob/main/README.md))


# Results


1. Using the following query we determined that 90398 roles will need to be filled as the "silver tsunami" begins to make an impact to eliminate its impact 
```
SELECT SUM(rt.count) as retiring_count
FROM retiring_titles as rt;
```

2. We found out that there are only 1549 qualified retirement-ready employees in the departments to mentor the next generation of Pewlett-Hackard employees using COUNT :
```
SELECT COUNT(me.emp_no)
FROM mentorship_eligibility as me;
```
3. To understand the situation with mentors and retiring employees clearer I suggest  comparing data on mentor count and retiring titles count to analyze it side by side.  (It is essential to use LEFT JOIN in the second query. This will allow us to see if any retiring titles have no eligible mentors)

```
-- COUNT THE NUMBER OF ELIGIBLE MENTORS FOR EACH TITLE
SELECT COUNT(me.emp_no), 
 me.title
INTO mentors_count
FROM mentorship_eligibility as me
GROUP BY title;
```
```
-- COMPARE MENTORS AND RETIRING TITLES
SELECT rt.title, 
 rt.count as retiring_count, 
 mc.count as mentor_count 
FROM retiring_titles as rt
LEFT JOIN mentors_count AS mc
 ON (rt.title = mc.title) 
ORDER BY rt.count DESC;

```
Using provided earlier two queries we combine data into the following table:
![Comparison table for nubber of retiring titles and eligible mentors by title](https://github.com/xenia-e/Pewlett-Hackard-Analysis/blob/main/Data/mentor_to_retiring_counts.png)

This data allow us to see that there are nearly not enough mentors in Pewlett-Hackar to reduce the impact of "silver tsunami".  

# Summary
As a summary of the performed analysis, we can suggest:
1. Reevaluate the mentorship eligibility to match company needs if it seems reasonable and implementable.
2. Start hiring new employees as soon as possible in order not to stay with an insufficient number of employees after the "silver tsunami" hits. 

