I believe in a personal responsibility to contribute positively to the world's safety and understanding regarding COVID-19. Using my bachelor's Level understanding of Biology, my passion for fitness and nutrition, and my data analyst skills, I created a project to analyze Covid Deaths across the world using different health metrics.


Our World In Data provides a vast archive of global COVID-19 data on their site for free (A goldmine of a resource). After filtering through their site I was disappointed that the health data within the source wasn't covered in any graphic. I decided to download it for myself and see what I could find. Three pieces of data stood out. These were the cardiovascular death rate for each country and region of the world, the smoking percentage of these populations, and the diabetes prevalence. I decided to explore these three metrics and compare them with covid death data to see if there were any insights I could discover about covid death and personal health. 


<img src='https://github.com/ianpatete/Portfolio-Projects/blob/main/COVID-Deaths-and-Health-Across-the-World/images/Screen%20Shot%202022-09-19%20at%209.43.13%20AM.png' width='1000'>

The main query for the data aimed to isolate Covid death rate per 100,000 people per country with the given Cardiovascular Death rate with the same units. For the covid rate, I adjusted the query to be a pre-vaccine year-long time window, for more clarity. The window selected was BETWEEN '2020-05-01' AND '2021-05-01' because of the US rollout of vaccines to the public post-May 1st. One aspect of the data that needed to be accounted for was the redundant continents in the location field (Asia was present in locations as well as Asian countries), which skewed the rates. The solution was to exclude all blank Continents since this was common across these locations. This was used for all queries. Blank death records were also removed. This was stored as a CTE and then joined to the health metrics table on location. 


I decided that this data was best represented as a map but with one problem, The sheer amount of data in this presentation made a map illegible. This is where the idea to filter the data by selected region or by selected country presented itself. This greatly improved the presentation of the data. After detailing the map with color based on the covid death rate, I moved to the metric comparison. This was completed with 2 bar charts ordered by cardiovascular death rate from lowest to highest. The covid death rate was shown below in parallel and matched for each country, 


This showed the relationship between cardiovascular deaths and covid death rate with the hypothesis that they would be correlated. It was not to be the case. Since data is organized by increasing cardiovascular death rate and you'd expect a correlation with the covid rate increasing proportionately. With the data visualized, it is apparent that there is no relationship between the two variables as the Covid rate seemed distributed at random. This is inciteful as it suggests that the heart-related deaths of a population aren’t a major factor. Further analysis of metrics such as access to healthcare and GDP should be accounted for in this calculation. 


<img src='https://github.com/ianpatete/Portfolio-Projects/blob/main/COVID-Deaths-and-Health-Across-the-World/images/Screen%20Shot%202022-09-19%20at%209.43.50%20AM.png' width='1000'>

The diabetes rate analysis was a more detailed extraction process. First I extracted the diabetes rate in a population and and goruped it by Country. I then used Tableau to perform a Cluster Analysis in order to statistically break down the population into groupd. It revealed 5 groups that I catogorized as Low Risk to Extreme Risk. Returuning to SQL I used the percentage ranges of these groupd to catogorize the locatoin data. Deaths were selected as a more general version of the pervious query, with tatl death per 1000,000 people of each contry used as the metric. These 2 querries were stored using CTEs and joined on loacation while grouping by risk level. Some final calculations, sub queries, and datatype conversions finialized the process.


To display the data I decided to walk the viewer through this analysis process. The Cluster analysis is visualized with nuetral colors to seperate it fro mthe death analysis. The Risk_levels were disreeibed with ha population pie chart and a bar graph representing hte average at each risk level. Risk Levels were colored by the risk of COVID death, This color-scheme is consitant accorss the poject. 


The hypothesis of this analysis is that populations with higher percentages of diabetes would alos have a higher percentage of total deaths. The analysis did not comfirm this thesis. The highest death rate was the 'High_Risk' Group which was lower than the 'Severe_Risk' and the "Extreme_Risk' Groups. The population distibution was highly scewed toward the 'Medium_Risk' and "High_Risk" groups which likely clouds the results due to sample size differences. Althought he high risk group saw a slightly higher death rate than the medium risk, the overal inconsistancy of the data prevents any decisive conclusions. 


<img src='https://github.com/ianpatete/Portfolio-Projects/blob/main/COVID-Deaths-and-Health-Across-the-World/images/Screen%20Shot%202022-09-19%20at%209.44.22%20AM.png' width='1000'>


The smoker analysis was the simpliest of the 3. First I created some headline metrics such as total deaths, smokers, and covidd deaths to put the global population into perspective. I then found the Smoking percentage of each country by finding the average of the Male and Female Population percentages (I assumed a 50/50 male/female ratio for all). This was grouped by country. I then found the percentage of the population that had died from dovid in order to make a scatter plot later down the line in the same units. These two queries were stored as CTE's and the joined on location. 

For the presentation of the data I began with the headline metrics querried earlier. Personally I found it shocking that over 1.4B people globally are smokers. This also puts the later conclusion in perspective. I ploted Covid death Percentage and Popultaion Percentage with each point as a country. I then performed a cluster analysis and deermine 3 distict groups that were collored according to severity of there covid death percentage. Fianlyl, I found hte average of the ddeath percentage per group and displayed it als a bar graph.

The thesis was that populations with a higher smking percentage wouldl also have a higher covid death percentage. This was strongly supported by the analysis. Teh clusters reveled 3 different popultons, not 2 or 4, which is significant. There were 2 populations of low covid death that were had low rates of smokers and high rates of smokers. This would be expected at random. There was a 3rd group that had a high smoking percentage and a high covid death percentage. No group of low smokers and high death rate existed statistically. Thise allowed me to confidently state the conclusions that High smoking populations often had higher death percentages than low smoking countries. 

Overal the anaysis was a success. All though all my assumptions going into the analysis were not correct, I still gained valuable insights at ever stage. The significance of smoking in covid death percentage is something I will tell my friends and family about going forward. I am very glad public data of this calaber is avalible to allow data curious induvidual like myself to answer presing questoins of health and saftey. 

