# Tableau_project_British_Airways_reviews (Data Source: Kaggle)

###### 1. Problem Statement
British Airways (BA) is a leading airline serving passengers worldwide, but in a highly competitive industry, ensuring high levels of customer satisfaction is vital. BA needs a systematic way to analyze customer reviews to identify strengths and weaknesses in their service. This dashboard leverages customer review data to pinpoint areas requiring improvement, providing BA with actionable insights to enhance service quality and customer loyalty.

###### 2. Data and Approach
This dashboard uses customer review data and includes the following elements:

###### 1.Parameter:
A custom parameter, "Pick a Metric", allows users to switch between different review metrics, such as Overall Rating, Cabin Staff Service, Seat Comfort, Food, and Value for Money. This flexibility enables stakeholders to focus on specific aspects of the customer experience based on their needs.

###### 2.Calculated Field:
A calculated field, "Metric Selected", is used in conjunction with the "Pick a Metric" parameter to dynamically display the chosen metric. The calculated field is defined as:

Formulas written:
CASE [Pick a Metric]
  WHEN 'Overall Rating' THEN [Rating]
  WHEN 'Cabin Staff Service' THEN [Cabin Staff Service]
  WHEN 'Entertainment' THEN [Entertainment]
  WHEN 'Food' THEN [Food Beverages]
  WHEN 'Ground Service' THEN [Ground Service]
  WHEN 'Seat Comfort' THEN [Seat Comfort]
  WHEN 'Value' THEN [Value For Money]
END
This setup allows the dashboard to adapt seamlessly to different metrics, making it a powerful tool for in-depth analysis.

###### 3. Visualizations:

###### Overall Rating Trends by Month:
A line chart to track changes in overall rating over time, identifying patterns or seasonal fluctuations.
###### Rating by Country:
A geographic map visualization highlights average ratings across different regions, helping BA identify areas where service adjustments may be necessary.
###### Average Rating by Aircraft Model:
A bar chart shows customer satisfaction across different aircraft types, which can inform decisions on aircraft deployment.

#### Key Insights and Outcomes

###### Service Areas for Improvement:
Cabin staff service (2.8) and seat comfort (2.4) ratings are lower than average, indicating areas where customers feel improvement is needed.
Geographical Insights:
The map visualization shows differences in customer satisfaction by country, providing BA with insights into regional preferences or potential service gaps.

###### Aircraft-Based Feedback:
Ratings by aircraft model reveal that certain aircraft (like the Boeing 747) receive higher ratings (4.9), while others (such as the A319) lag behind. BA can use this information to prioritize aircraft upgrades or deploy higher-rated models on specific routes.

###### Consistent Issues with Inflight Amenities:
Food and beverage (1.9) and entertainment (1.1) ratings are particularly low. This suggests the need for enhancements in inflight amenities to meet customer expectations.

###### Monthly Trends:
The line chart of overall rating trends shows fluctuations over time, suggesting that seasonal factors or specific events may impact customer satisfaction. BA can utilize this information to make staffing or service adjustments during peak periods.

#### Suggested Actions:

###### Cabin Staff Training:
Addressing lower ratings in cabin staff service through targeted training could improve the overall customer experience, especially during high-demand periods.

###### Seat Comfort Enhancements:
Addressing seat comfort complaints could involve upgrading seat quality or offering more legroom in economy classes.

###### Upgrade Inflight Amenities:
Given the low scores for food and entertainment, BA could consider revamping its meal and entertainment offerings, particularly for long-haul flights.

###### Optimized Aircraft Allocation:
BA could prioritize deploying high-rated aircraft, like the Boeing 747, on premium or high-traffic routes to improve customer satisfaction.

##### Project Outcome
This dashboard provides British Airways with a versatile tool for customer feedback analysis. By allowing users to switch between metrics, it empowers BA to perform targeted analysis and make data-driven decisions to enhance customer satisfaction, ultimately fostering loyalty and maintaining competitiveness in the airline industry.

###### Dashboard Link:
https://public.tableau.com/app/profile/shashank.shekhar3512/viz/BritishAirways_17308997626080/Dashboard1?publish=yes
