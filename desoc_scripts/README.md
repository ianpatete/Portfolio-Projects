This project is hosted on cloud platforms and updated on a weekly basis. To view static documents of the project select the file and brows the images above. To view the live hosted sources please navigate to the [Tableau Public Dashboard](https://public.tableau.com/app/profile/ian.patete/viz/CryptoEmmisionsDashboard/Dashboard1) and the working [Google Sheet](https://docs.google.com/spreadsheets/d/1Q5B2RS-O3zRHBMSQaXPVrWsegu3yrsxECwC2HTxcd1U/edit#gid=997172495).

Crypto Assets are hard to understand for most new or experienced recipients. Most do not know that these assets are inflationary and can not visualize what this inflation looks like in real market terms. This inspired me to create a dashboard that tracks these metrics for a few of the most relevant crypto assets. 

        This dashboard needed to have a few features:
              -Very low maintence (5 minutes Weekly).
              -The ability to compare assets.
              -A visual component for the relationship between price and emmissions. 
              -Astetically pleasing and simple to understand. 
    
I decided that Google Sheets fit for the scope of the project. This wouldn't contain enough data to warrant a database but it did need some room. It also needed to be able to draw API data without the need to build a Python Script. Google Sheets has an "add on" called API Connector that allows users to send API requests and refresh them quickly. The perfect tool for my application. After connecting the sheet to time series data, I set up 18 requests. 

<img src='https://github.com/ianpatete/Portfolio-Projects/blob/main/Crypto-Inflation-Dashboard/images/Screen%20Shot%202022-09-26%20at%201.56.08%20PM.png' width='200'>    <img src='https://github.com/ianpatete/Portfolio-Projects/blob/main/Crypto-Inflation-Dashboard/images/Screen%20Shot%202022-09-26%20at%201.56.29%20PM.png' width='200'>

Importing crypto API data has been made easy due to the ecosystem of connectors built within the industry. The next step I encountered was turning Google Sheets into an inexpensive, highly functional, light weight database. This would require some complex but resilient functions. The API drew in the Closing Price Data and date for each of the 9 assets in separate sheets. The second set of requests returned the Supply of that Asset and date. Date is the like metric and I wanted to know the price at each data for further calculations. This is similar to a JOIN in SQL but Sheets does not have an easy function for this. The solution was to Use VLOOKUP in Conjunction with ARRAYFORMULA which allowed me to match at each date. IFERROR fixed the bug where datasets of different sizes would result in errors. The QUERY function was able to import all data from the desired sheet. Additionally, I calculated 3 metrics, "daily_tokens_emited", "daily_dollars_emited" (which combines that metric with daily price), and an asset ticker label (ETH for example).

    =QUERY({eth_price!A2:B,ARRAYFORMULA(IFERROR(VLOOKUP(eth_price!A2:A,eth_supply!$A:B,2,0),""))},"SELECT *",0)

The second problem was to draw these datasets into Main datasets that can be saved and exported as 1 CSV. This was accomplished using the QUERY function. It allowed my to quarry all 9 assets and format them in a continuous list. The query function allowed me to exclude NULL values which was crucial. It allowed data of any length to be joined. The resilience of this method makes the dataset a 1 click reset that expands to fit new data. 

    ={QUERY(btc_metrics!A:G,"SELECT * WHERE B IS NOT NULL",0);QUERY(sheet!A:G,"SELECT * WHERE B IS NOT NULL",0); (this is coninued to encompase all of the required coins)


<img src='https://github.com/ianpatete/Portfolio-Projects/blob/main/Crypto-Inflation-Dashboard/images/Screen%20Shot%202022-09-27%20at%208.43.41%20AM.png' width='500'>

Following the completion of my data table, I moved to Tableau for data visulaization. The google sheet data can be refreshed manually with one button on the dashboard. For each metric, I made a counter tile for each metric, and given a time horizon. 'asset' was used as a parameter which allowed me to make a dropdown menu for asset selection. I created a dual-axis bar chart comparing the increasing supply to the given price over 30 days. Then all sheets were duplicated in order to create a dashboard that was comparison suitable. 


<img src='https://github.com/ianpatete/Portfolio-Projects/blob/main/Crypto-Inflation-Dashboard/images/Screen%20Shot%202022-09-26%20at%209.53.21%20AM.png' width='500'>

This concluded my analysis. Not I can compare assets and view their emissions. I am personally watching the emissions over time for AAVAX vs SOL, AAVE vs MKR, and UNI vs CRV. These are my favorites to analyze due to them occupying very similar niches. This project will help aid me in determining which product might have better long-term sustainability, due to having less inflationary pressure and more concrete revenue. 





