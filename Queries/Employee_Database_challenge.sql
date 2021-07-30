-- Deliverable 1 QUERIES
SELECT  e.emp_no,
        e.first_name,
        e.last_name,
        tl.title,
        tl.from_date,
        tl.to_date
INTO retirement_titles
FROM employees AS e
    INNER JOIN titles AS tl
        ON (e.emp_no = tl.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- savere retirement_titles as cvs	 
COPY retirement_titles TO '/Users/xenia/Data Bootcamp/Analysis_Projects/Pewlett-Hackard-Analysis/Data/retirement_titles.csv' DELIMITER ',' CSV HEADER;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no),
        rt.first_name,
        rt.last_name,
        rt.title,

INTO unique_titles
FROM retirement_titles AS rt
ORDER BY rt.emp_no, rt.to_date DESC;

-- savere unique_titles as cvs	 
COPY unique_titles TO '/Users/xenia/Data Bootcamp/Analysis_Projects/Pewlett-Hackard-Analysis/Data/unique_titles.csv' DELIMITER ',' CSV HEADER;

-- Retiring Titles
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY title
ORDER BY COUNT(title) DESC;

-- save retiring_titles as cvs
COPY retiring_titles TO '/Users/xenia/Data Bootcamp/Analysis_Projects/Pewlett-Hackard-Analysis/Data/retiring_titles.csv' DELIMITER ',' CSV HEADER;


-- DELIVERABLE 2 QUERIES

--mentorship-eligibility table
SELECT DISTINCT ON (e.emp_no)
		e.emp_no,
		e.first_name,
        e.last_name,
        de.from_date,
        de.to_date,
		tl.title
INTO mentorship_eligibility
FROM employees AS e
	INNER JOIN dept_emp AS de
        ON (e.emp_no = de.emp_no)
    INNER JOIN titles AS tl
        ON (e.emp_no = tl.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
		AND (de.to_date = ('9999-01-01'))
ORDER BY e.emp_no;

-- save mentorship_eligibility as cvs
COPY mentorship_eligibility TO '/Users/xenia/Data Bootcamp/Analysis_Projects/Pewlett-Hackard-Analysis/Data/mentorship_eligibility.csv' DELIMITER ',' CSV HEADER;

