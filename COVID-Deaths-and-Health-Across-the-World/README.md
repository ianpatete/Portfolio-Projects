I believe in a personal responsibility to contribute positively to the world's safety and understanding regarding COVID-19. Using my bachelor's Level understanding of Biology, my passion for fitness and nutrition, and my data analyst skills, I created a project to analyze Covid Deaths across the world using different health metrics.


Our World In Data provides a vast archive of global COVID-19 data on their site for free (A goldmine of a resource). After filtering through their site I was disappointed that the health data within the source wasn't covered in any graphic. I decided to download it for myself and see what I could find. Three pieces of data stood out. These were the cardiovascular death rate for each country and region of the world, the smoking percentage of these populations, and the diabetes prevalence. I decided to explore these three metrics and compare them with covid death data to see if there were any insights I could discover about covid death and personal health. 


The final product can be viewed at Tabeau Public [here](https://public.tableau.com/views/CovidDeathsandHeathAcrosstheWorld/CovidDeathsandHealth?:language=en-US&:display_count=n&:origin=viz_share_link) and the SQL querries are nested above. 

<img src='https://github.com/ianpatete/Portfolio-Projects/blob/main/COVID-Deaths-and-Health-Across-the-World/images/Screen%20Shot%202022-09-19%20at%209.43.13%20AM.png' width='1000'>

The main query for the data aimed to isolate Covid death rate per 100,000 people per country with the given Cardiovascular Death rate with the same units. For the covid rate, I adjusted the query to be a pre-vaccine year-long time window, for more clarity. The window selected was BETWEEN '2020-05-01' AND '2021-05-01' because of the US rollout of vaccines to the public post-May 1st. One aspect of the data that needed to be accounted for was the redundant continents in the location field (Asia was present in locations as well as Asian countries), which skewed the rates. The solution was to exclude all blank Continents since this was common across these locations. This was used for all queries. Blank death records were also removed. This was stored as a CTE and then joined to the health metrics table on location. 


I decided that this data was best represented as a map but with one problem, The sheer amount of data in this presentation made a map illegible. This is where the idea to filter the data by selected region or by selected country presented itself. This greatly improved the presentation of the data. After detailing the map with color based on the covid death rate, I moved to the metric comparison. This was completed with 2 bar charts ordered by cardiovascular death rate from lowest to highest. The covid death rate was shown below in parallel and matched for each country, 


This showed the relationship between cardiovascular deaths and covid death rate with the hypothesis that they would be correlated. It was not to be the case. Since data is organized by increasing cardiovascular death rate and you'd expect a correlation with the covid rate increasing proportionately. With the data visualized, it is apparent that there is no relationship between the two variables as the Covid rate seemed distributed at random. This is inciteful as it suggests that the heart-related deaths of a population aren’t a major factor. Further analysis of metrics such as access to healthcare and GDP should be accounted for in this calculation. 


<img src='https://github.com/ianpatete/Portfolio-Projects/blob/main/COVID-Deaths-and-Health-Across-the-World/images/Screen%20Shot%202022-09-19%20at%209.43.50%20AM.png' width='1000'>

The diabetes rate analysis was a more detailed extraction process. First I extracted the diabetes rate in a population and grouped it by Country. I then used Tableau to perform a Cluster Analysis in order to statistically break down the population into groups. It revealed 5 groups that I categorized as Low Risk to Extreme Risk. Returning to SQL, I used the percentage ranges of these groups to categorize the location data. Deaths were selected as a more general version of the previous query death rate query, with total death per 1000,000 people of each country used as the metric. These 2 queries were stored using CTEs and joined on location while grouping by risk level. Some final calculations, sub-queries, and datatype conversions finialized the process.


To display the data I decided to walk the viewer through this analysis process. The Cluster analysis is visualized with neutral colors to separate it from the death analysis. The risk levels were described with a population pie chart and a bar graph which represented the average death rate at each risk level. Risk Levels were colored by the risk of COVID death (This color-scheme is consistent across the project). 


The hypothesis of this analysis is that populations with higher percentages of diabetes would also have a higher percentage of total deaths. The analysis did not confirm this thesis. The highest death rate was in the 'High_Risk' Group which was lower than the 'Severe_Risk' and the "Extreme_Risk' Groups. The population distribution was highly skewed toward the 'Medium_Risk' and "High_Risk" groups which likely clouds the results due to sample size differences. Although the high-risk group saw a slightly higher death rate than the medium risk, the overall inconsistency of the data prevents any decisive conclusions. 



<img src='https://github.com/ianpatete/Portfolio-Projects/blob/main/COVID-Deaths-and-Health-Across-the-World/images/Screen%20Shot%202022-09-19%20at%209.44.22%20AM.png' width='1000'>



The smoker analysis was the simplest of the 3. In my first few SQL queries, I created some headline metrics such as global population, the global number of smokers, and the global number of Covid deaths.  This put the global population into perspective. I then found the smoking percentage of each country by finding the average of the male and female population percentages (I assumed a 50/50 male/female ratio for all). This was grouped by country. I then found the percentage of the population that had died from Covid in order to make a scatter plot later down the line in the same units. These two queries were stored as CTEs and joined them on location. 

For the presentation of the data, I began with the headline metrics queried earlier. Personally, I found it shocking that over 1.4B people globally are smokers. This also puts the later conclusion in perspective. I plotted Covid death percentage and Population percentage with each point as a country. I then performed a cluster analysis and determined 3 distinct groups that were colored according to the severity of their covid death percentage. Finally, I found the average death percentage per group and displayed it as a bar graph.

The thesis was that populations with a higher smking percentage would also have a higher covid death percentage. This was strongly supported by the analysis. The clusters revealed 3 different populations, not 2 or 4, which is significant. There were 2 populations of low covid death that had low rates of smokers and high rates of smokers. This would be expected at random. There was a 3rd group that had a high smoking percentage and a high covid death percentage. No group of low smokers and high death rates existed statistically. This allowed me to confidently conclude that High smoking populations often had higher death percentages than low-smoking countries. 

Overall the analysis was a success. Although all my assumptions going into the analysis were not correct, I still gained valuable insights at every stage. The significance of smoking in covid death percentage is something I will tell my friends and family about going forward. I am very glad public data of this caliber is available to allow data-curious individuals like myself to answer pressing questions of health and safety fro themselves. 
