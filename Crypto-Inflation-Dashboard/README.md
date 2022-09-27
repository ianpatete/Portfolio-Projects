This project is hosted on cloud platforms and updated on a weekly basis. To view static documents of the project select the file and brows the images above. To view the live hosted sources please navigate to the [Tableau Public Dashboard](https://public.tableau.com/app/profile/ian.patete/viz/CryptoEmmisionsDashboard/Dashboard1) and the working [Google Sheet](https://docs.google.com/spreadsheets/d/1Q5B2RS-O3zRHBMSQaXPVrWsegu3yrsxECwC2HTxcd1U/edit#gid=997172495).

Crypto Assets are hard to understand for most new or experieced recipients. Most do not know that these assets are inflationary and can not visualize what this infation looks like in real market terms. This inpired me to create an dashboard that tracks these metrics for a few of the most relevent crypto assets. 

        This dashboard needed to have a few features:
              -Very low maintence (5 minutes Weekly).
              -The ability to compare assets.
              -A visual component for the relationship between price and emmissions. 
              -Astetically pleasing and simple to understand. 
    
I decided taht Google Sheets fit for this scope of a project. This wouldnt need to contain enough data to warent a database but it did need some room. It also needed to be able to draw API data without the need to built a Python Script. Google Sheets has an "add on" called API Connector that allows users to send an API requests and refresh them all of them with one click. The perfect tool for my application. After coneenting the sheet to time series data, I set up 18 requests. 

<img src='https://github.com/ianpatete/Portfolio-Projects/blob/main/Crypto-Inflation-Dashboard/images/Screen%20Shot%202022-09-26%20at%201.56.08%20PM.png' width='200'>    <img src='https://github.com/ianpatete/Portfolio-Projects/blob/main/Crypto-Inflation-Dashboard/images/Screen%20Shot%202022-09-26%20at%201.56.29%20PM.png' width='200'>

Importing crypto API data has been made easy due to the ecosytme of conectors built within the industry. The next step I encountered was turning Google Sheets into a inexpensive, highly fuctional, light weight database. This would require some complex but resilient functions. The API drew in the Closing Price Data and date for each of the 9 assets in seperate sheets. The second set of requests returned the Supply of that Asset and date. Date is the like metric and I wanted to know the price at each data for further calculations. This is similar to a JOIN in SQL but Sheets does not have an easy fucntion for this. The solution was to Use VLOOKUP in Conjuction with ARRAYFORMULA which allowed me to match at each date. IFERROR fixed the bug where datasets of different size would result in errors. The QUERY function was able to import all data from a desired sheet.

    =QUERY({eth_price!A2:B,ARRAYFORMULA(IFERROR(VLOOKUP(eth_price!A2:A,eth_supply!$A:B,2,0),""))},"SELECT *",0)

The second problem was to draw these datasets into Main datasets that can be saved an exported as 1 CSV. This was accomplished using the QUERY function. It allowed my to quarry all 9 assets and format them in a continuous list. The query fuction allowed me to exclude NULL values which was crucial. It allowed data of any length to be joined. The resilience of this method makes the datset a 1 click reset that expands to fit new data. 

    ={QUERY(btc_metrics!A:G,"SELECT * WHERE B IS NOT NULL",0);QUERY(sheet!A:G,"SELECT * WHERE B IS NOT NULL",0); (this is coninued to encompase all of the required coins)


<img src='https://github.com/ianpatete/Portfolio-Projects/blob/main/Crypto-Inflation-Dashboard/images/Screen%20Shot%202022-09-27%20at%208.43.41%20AM.png' width='500'>



<img src='https://github.com/ianpatete/Portfolio-Projects/blob/main/Crypto-Inflation-Dashboard/images/Screen%20Shot%202022-09-26%20at%209.53.21%20AM.png' width='500'>







