# Pricing Elasticity Simulation

## Overview
In this project, I explored how price changes can affect customer demand and overall revenue. Using simulated data, I modeled the relationship between price, conversion behavior, and revenue to better understand the tradeoffs involved in pricing decisions.

I created this project to practice analyzing demand sensitivity and to demonstrate how data can be used to identify pricing ranges that balance volume and revenue.

## Business Question
- How does demand change as price increases?
- At what price range does revenue peak when accounting for both price and conversion rate?
- How can simulated demand modeling inform pricing decisions before real-world testing?

These insights would be useful for:
- Product or growth teams evaluating pricing strategies
- Analysts supporting A/B pricing tests
- Stakeholders interested in understanding demand sensitivity and revenue tradeoffs

## Data
- Source: Simulated pricing and purchase behavior data
- Description:  
  The dataset represents individual users exposed to varying price points. For each user, a purchase decision is simulated based on a decreasing probability of conversion as price increases.
- Size: ~5,000 simulated user observations with price and purchase outcome

The data is intentionally simulated to focus on modeling behavior patterns rather than relying on real customer data.

## Approach
1. Simulated user exposure to a range of prices
2. Modeled purchase probability as a function of price
3. Calculated conversion rates and revenue outcomes
4. Aggregated results by price range to analyze demand patterns
5. Visualized conversion and revenue trends to identify tradeoffs

I emphasize understanding relationships and interpreting outcomes rather than fitting a complex predictive model.

## Key Metrics
- Conversion Rate — measures how likely users are to purchase at different price levels  
- Price — the independent variable driving demand changes  
- Expected Revenue — combines price and conversion behavior to estimate revenue impact  
- Volume vs. Price Tradeoff — highlights how higher prices reduce demand but increase per-unit value  

## Key Insights
- Conversion rates decline steadily as price increases, reflecting price sensitivity in user behavior
- Lower prices drive higher volume but do not necessarily maximize revenue
- Revenue peaks at a mid-range price point where price and demand are balanced
- Small increases in price near the optimal range can materially impact revenue outcomes

These results illustrate why pricing decisions require balancing volume and margin rather than optimizing for a single metric.

## Tools & Technologies
- Python
- pandas for data manipulation and aggregation
- matplotlib for visualization

## Outcome & Impact
This analysis demonstrates how pricing simulations can be used to:
- Explore demand sensitivity before launching pricing experiments
- Identify candidate price ranges for A/B testing
- Support data-informed pricing discussions with stakeholders

## Next Steps
- Incorporate segmentation to model different customer types
- Simulate competitive pricing scenarios
- Extend the model to include retention or lifetime value effects
- Validate findings through real-world experiments or historical data
