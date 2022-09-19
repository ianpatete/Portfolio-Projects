I believe in a personal responsibility to contribute positively to the world's safety and understanding regarding COVID-19. Using my bachelor's Level understanding of Biology, my passion for fitness and nutrition, and my data analyst skill, I created a project to analyze Covid Deaths across the world using different health metrics.


Our World In Data After filtering thorugh
their site I was disapointed that the health data within the source wasn't covered in any graphic 

<img src='https://github.com/ianpatete/Portfolio-Projects/blob/main/COVID-Deaths-and-Health-Across-the-World/images/Screen%20Shot%202022-09-19%20at%209.43.13%20AM.png' width='1000'>

Teh main query for the data aimed to isolate Covid death rate per 100,000 people per country with the given Cardiovascular Death rate metric at of the smae numbers. For the covid rate, I adjusted the query to be a pre-vaccine year long tome window, for more clarity. The window selected was BETWEEN '2020-05-01' AND '2021-05-01' because of the US rollout of vaccines to the public post May 1st. One aspect of the data that needed to be accounted for were the redundant continents in the location feild (Asia was present in locations as well as Asian countries), scewing the rates. The solutions was to exclude all ' ' Continents since this was common across these locaations. Blank death records were also removed. This was stored as a CTE adn then joined to the health metrics on location. 


I decided that this data was best represented as a map but with one problem, The sheir amount of data in this country presentation made a map illegible. This is where the idea to filter the data by selected region or by selcted country, presented itself as a good idea. This greatly improved the presentation of the data. 


Thsi data was ment to show th relationship between cardiovascular deaths and covid death rate with the hypothesis that they would be correlated. This proved not to be the case. In data is orginized by incresing cardiovascular deeath rate and youd expect a correlation wit hthe covid rate increasing prportiantly. Wit hthe data visualized it is apprent that there is no relationship between the two variables and hte codie rate seems to be distributed at random. This is insitefull as it suggess that raw death rate alone isnt a determining factor but instead access to healthcare or per capita income might be more important. 


<img src='https://github.com/ianpatete/Portfolio-Projects/blob/main/COVID-Deaths-and-Health-Across-the-World/images/Screen%20Shot%202022-09-19%20at%209.43.50%20AM.png' width='1000'>

The diabetes rate analysis was a more detailed extraction process. First I extracted the diabetes rate in a population and and goruped it by Country. I then used Tableau to perform a Cluster Analysis in order to statistically break down the population into groupd. It revealed 5 groups that I catogorized as Low Risk to Extreme Risk. Returuning to SQL I used the percentage ranges of these groupd to catogorize the locatoin data. Deaths were selected as a more general version of the pervious query, with tatl death per 1000,000 people of each contry used as the metric. These 2 querries were stored using CTEs and joined on loacation while grouping by risk level. Some final calculations, sub queries, and datatype conversions finialized the process.


To display the data I decided to walk the viewer through this analysis process. The Cluster analysis is visualized with nuetral colors to seperate it fro mthe death analysis. The Risk_levels were disreeibed with ha population pie chart and a bar graph representing hte average at each risk level. Risk Levels were colored by the risk of COVID death, This color-scheme is consitant accorss the poject. 


The hypothesis of this analysis is that populations with higher percentages of diabetes would alos have a higher percentage of total deaths. The analysis did not comfirm this thesis. The highest death rate was the 'High_Risk' Group which was lower than the 'Severe_Risk' and the "Extreme_Risk' Groups. The population distibution was highly scewed toward the 'Medium_Risk' and "High_Risk" groups which likely clouds the results due to sample size differences. Althought he high risk group saw a slightly higher death rate than the medium risk, the overal inconsistancy of the data prevents any decisive conclusions. 


<img src='https://github.com/ianpatete/Portfolio-Projects/blob/main/COVID-Deaths-and-Health-Across-the-World/images/Screen%20Shot%202022-09-19%20at%209.44.22%20AM.png' width='1000'>


The smoker analysis was the simpliest of the 3. First I created some headline metrics such as total deaths, smokers, and covidd deaths to put the global population into perspective. 

