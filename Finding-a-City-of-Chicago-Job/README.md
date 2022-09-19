In this project I imported and cleaned public jobs data from the City of Chicago in order to gain insights about possible job opportunities that fit my skillset, interest, and future outlook. This project was a success and helped me discover a job to apply to.

Currently I'm unemployeed which means I'm Doing qeuite a bit of job searching. I like my city and wanted to see if I could find a career that helps to make it a better place but when I navigated to the Official Chicago’s Career site, I was met with a clunky and dated interface that provided little background about the city departments or available jobs. I was determined to make career searching a bit better.

Check out the Excel File linked above to try it for yourself or check out the OneDrive link [here](https://1drv.ms/x/s!AlA2N9MdYGUCgndznuefmiUkq4Gy?e=hTlwCu). Alternatively, read my high detailed breakdown on Medium [here](https://medium.com/@ian.patete/finding-a-chicago-city-job-ee18a5055f6a). This will be a synopsis of that document. 

First I needed to ask some questions, clean some data, and adjust it to a workable format. After a brief skim, I formulated some general questions and an ideal product for my analysis. They were roughly: How are resources distributed? What are the best-paying departments and positions? Expected salary range? How should I analyze the different metrics in this dataset and how could I use aggregate functions? I decided on a guiding goal for this analysis. I’d like to be able to search for job positions using keywords and a desired salary range in the departments that would be the best fit for me in the long run."

I needed to add a few columns to make this data workable. I created a Yearly Income column using IF() and ISBLANK() functions to convert the variety of entries to a single expected yearly income. With this standardization, I created a reference table and used VLOOKUP() to break this info into Salary Ranges. I also removed a number of unnecessary items. 

Next, I was able to move onto some more detailed data exploration using pivot tables. I constructed 5 tables detailing a variety of information. These were the sketches, if you will, for the more permanent and resilient tables I would build around these insights. Some things I uncovered were the distribution of resources in the city, the most common salary ranges, the toppaid positions and departments, and the highest number of employees per department and position. Permanent tables were then constructed using IFSUM(), IFAVERAGE(), IFCOUNT(), TOP(), SEARCH(), and MATCH() functions. 

The final graphics such as pie charts, bar charts, and tables were accompanied by splicer filters when applicable. The final product was a dashboard that allowed the user to learn about the City of Chicago jobs with a few tools and then finally put their insights into a search. The search table allows the users to filter by some key metrics and use a two keyword search to navigate job titles of interest. The rest of the takeaways are described below.

<img src='https://github.com/ianpatete/Portfolio-Projects/blob/main/Finding-a-City-of-Chicago-Job/images/Screen%20Shot%202022-09-07%20at%2012.18.23%20PM.png' width='1000'>


The first section of the dashboard includes a breakdown of the Budget for Employees in 2021. Unsurprisingly, Police and Fire employees take up a combined 61% of the employee budget and are the overwhelming majority. Water Management is the third largest, which makes sense due to the presence of our great Lake Michigan nearby. Streets and sanitation, Aviation, and Transportation round out the other top segments.Interestingly, the most common salary range for a City of Chicago job is in the $90k -$110K Salary range. This is drastically more common than any other range. Overall, salaries for the City displayed an expected normal distribution.The highest paid employees are often the heads of each department, the mayor, or niche legal services. The most common jobs are Police Officers/Detectives and Fire Fighters/Sergents, and Truck Drivers.


<img src='https://github.com/ianpatete/Portfolio-Projects/blob/main/Finding-a-City-of-Chicago-Job/images/Screen%20Shot%202022-09-07%20at%2012.19.49%20PM.png' width='1000'>


The second section is a breakdown of departments. More specifically, the average salary and the ount of positions in each salary range. Despite Police and Fire being 1 and 2 from a budget perspective, they are not 1 and 2 for average salary (Their ranking is still within the top 6 however). Instead, Buildings and The Board of Ethics take the 1 and 2 average salary spots. Budget and Management, and Human Relations round out the top 5. Me personally, I looking for salaries in the $50K-70K and $70K-$90K salary ranges. Using this as a filter I was able to learn that Police, Streets, and Sanitation, and Fire had the most jobs in this category.


<img src='https://github.com/ianpatete/Portfolio-Projects/blob/main/Finding-a-City-of-Chicago-Job/images/Screen%20Shot%202022-09-07%20at%2012.20.26%20PM.png' width='1000'>

The Final section was the Job Search Tool. Remembering back to my initial vision, this is the product I aimed to build with this data. I’d say the mission statement was 100% accomplished. I’d like to be able to search for job positions using keywords and a desired salary range in the department that would be the best fit for me in the long term. I found 24 jobs that matched the description of the 5 departments I liked, in the salary ranges I wanted, using the 2 keywords (“data” and “analyst”) that best fit my data.

In the end, was this data analysis valuable to me?

Yeah!

I found many jobs that peaked my interest with my search tool but when I transferred the job info to the job search page, I wasn’t able to find any openings for the specified positions I had found. Some data based jobs that I felt underqualified were available but I may return to those later in my career. I was able to make one application based off this analysis to a position titled “GIS Database Analyst” from the DIAS department. I will also be able to check this jobs board in the future for my desired Job Titles.

I wanted to make this analysis public because now the data is not just about me! Hopefully, the attached excel document can assist anyone else in learning about City of Chicago Jobs. If just one other person finds this useful it might change from a ‘kinda’ success to an overwhelming one!
