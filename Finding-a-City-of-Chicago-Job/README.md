In this project I imported and cleaned public jobs data from the City of Chicago in order to gain insights about possible job opportunities that fit my skillset, interest, and future outlook. This project was a success and helped me discover a job to apply to.

Currently I'm unemployeed which means I'm Doing qeuite a bit of job searching. I like my city and wanted to see if I could find a career that helps to make it a better place but when I navigated to the Official Chicago’s Career site, I was met with a clunky and dated interface that provided little background about the city departments or available jobs. I was determined to make career searching a bit better.

Check out the Excel File linked above to try it for yourself or check out the OneDrive link [here](https://1drv.ms/x/s!AlA2N9MdYGUCgndznuefmiUkq4Gy?e=hTlwCu). Alternatively, read my high detailed breakdown on Medium [here](https://medium.com/@ian.patete/finding-a-chicago-city-job-ee18a5055f6a). This will be a synopsis of that document. 

First I needed to ask some questions, clean some data, and adjust it to a workable format. After a breif skim, I formulated some general questons and a ideal product for my analyis. They were roughly: How are resources distributed?What are the best-paying departments and positions? Expected salary range? How should I analyze the different metrics in this dataset and how could I use aggregate functions? I decided on a guiding goal for this analysis. I’d like to be able to search for job positions using keywords and a desired salary range in the departments that would be the best fit for me in the long run."

I needed to add a few colunms to make this data workable. I created a Yearly Income coluns using IF() and ISBLANK() fuctions to convert the variety of entries to a single expected yearly income column. With this standardized, I created a reference table and used VLOOKUP() to break this info into salary catagores. I also removed a nummber of unnessesary rows. 


<img src='https://github.com/ianpatete/Portfolio-Projects/blob/main/Finding-a-City-of-Chicago-Job/images/Screen%20Shot%202022-09-07%20at%2012.18.23%20PM.png' width='1000'>


The first section of the dashboard includes a breakdown of the Budget for Employees in 2021. Unsurprisingly, Police and Fire employees take up a combined 61% of the employee budget and are the overwhelming majority. Water Management is the third largest, which makes sense due to the presence of our great Lake Michigan nearby. Streets and sanitation, Aviation, and Transportation round out the other top segments.

Interestingly, the most common salary range for a City of Chicago job is in the $90k -$110K Salary range. This is drastically more common than any other range. Overall, salaries for the City displayed an expected normal distribution.

The highest paid employees are often the heads of each department, the mayor, or niche legal services. The most common jobs are Police Officers/Detectives and Fire Fighters/Sergents, and Truck Drivers.


<img src='https://github.com/ianpatete/Portfolio-Projects/blob/main/Finding-a-City-of-Chicago-Job/images/Screen%20Shot%202022-09-07%20at%2012.19.49%20PM.png' width='1000'>


The second section is a breakdown of departments. More specifically, the average salary and the ount of positions in each salary range. Despite Police and Fire being 1 and 2 from a budget perspective, they are not 1 and 2 for average salary (Their ranking is still within the top 6 however). Instead, Buildings and The Board of Ethics take the 1 and 2 average salary spots. Budget and Management, and Human Relations round out the top 5.

Me personally, I looking for salaries in the $50K-&0K and $70K-$90K salary ranges. Using this as a filter I was able to learn that Police, Streets, and Sanitation, and Fire had the most jobs in this category.


<img src='https://github.com/ianpatete/Portfolio-Projects/blob/main/Finding-a-City-of-Chicago-Job/images/Screen%20Shot%202022-09-07%20at%2012.20.26%20PM.png' width='1000'>

The Final section was the Job Search Tool. Remembering back to my initial vision, this is the product I aimed to build with this data. I’d say the mission statement was 100% accomplished.

I’d like to be able to search for job positions using keywords and a desired salary range in the department that would be the best fit for me in the long term.

I found 24 jobs that matched the description of the 5 departments I liked, in the salary ranges I wanted, using the 2 keywords (“data” and “analyst”) that best fit my data.

