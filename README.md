# Funnel Analysis

## Task Description
1. Analyze the data in the `raw_events` table. Spend time querying the table, getting more familiar with the data. Identify events captured by users visiting the website.
2. Now that you have your unique events table, create a sales funnel chart from events in it. Not all events are relevant, productive to be used in this chart. Identify & collect data that you think could be used

- Use between 4 to 6 types of events in this analysis.
- Create a funnel chart with a country split. Business is interested in the differences between the top 3 countries in the funnel chart.
- Top countries are decided by their overall number of events.
- Provide insights if any are found.
- See if you can come up with any other ideas/slices for funnel analysis that could be worth a look.

## Results, Key Insights, and Recommendations

The funnels.sql code was utilized to extract data for further analysis. Funnels were generated for the top three countries based on the percentages of customer drop-off throughout the events. 

![image](https://github.com/user-attachments/assets/3ff2768b-c145-4484-bca3-c8e3506d17d5)


#### ✅ High Drop-Off at "Add to Cart" Stage		<br>	
Moving from “View_item” to “Add to Cart,” we observe high drop-off rates across all three countries—78-79%—with about 20-21% of users adding items to their cart. This suggests potential issues, such as low product appeal, ineffective pricing strategy, or website usability problems (e.g., complicated navigation or slow loading times). <be>	

**💡What should be done?** The business should optimise product attractiveness, test competitive pricing, simplify website navigation, and enhance user experience.	<br><br>			

#### ✅ High Drop-Off at "Add Payment Info" Stage		<br>		
At the “Add Payment Info” stage, conversion drops significantly to around 58-60%, meaning that 40-42% of users abandon their purchase after entering shipping details. Possible reasons include unexpected shipping costs or additional fees, a lack of preferred payment options, a complicated checkout process, or trust issues.	<br>	

**💡What should be done?** The business should optimise the checkout experience by offering transparent pricing, different payment options, guaranteeing security, and simplifying the overall checkout process. 			
			
			
			
			
			
