# Ad Performance Metrics Analysis

## Overview
In this project, I explored how advertising performance data can be used to evaluate channel effectiveness, creative performance, and overall campaign efficiency. The goal was to practice analyzing common growth and marketing metrics and to communicate insights that could realistically inform budget allocation or optimization decisions.

I created this project to strengthen my ability to translate raw campaign data into clear, actionable takeaways using a mix of metrics and visualizations.

## Business Question
- Which advertising channels are performing most efficiently?
- How does performance vary across different creatives?
- Where might reallocating budget lead to better outcomes?

These insights would be useful for:
- Marketing and growth teams evaluating campaign performance
- Product or analytics teams supporting paid acquisition strategy
- Stakeholders making budget or creative decisions

## Data
- Source: Simulated ad campaign data
- Description: 
  The dataset represents advertising performance across multiple channels and creatives. Each row includes impressions, clicks, conversions, and spend, allowing for the calculation of common performance metrics such as CTR, conversion rate, and cost per acquisition.
- Size: A small, channel-by-creative dataset designed to surface meaningful differences without relying on real campaign data

The data is intentionally simulated to keep the project self-contained while still reflecting realistic performance patterns.

## Approach
1. Generated mock campaign data across channels and creatives
2. Calculated core performance metrics such as CTR, conversion rate, CPC, and CPA
3. Aggregated results at the channel and creative level
4. Visualized key metrics to make differences easy to interpret
5. Summarized insights in plain language to support decision-making

## Key Metrics
- **Click-Through Rate (CTR)** — measures how effectively ads generate engagement  
- **Conversion Rate** — indicates how well clicks translate into desired actions  
- **Cost per Click (CPC)** — helps assess traffic efficiency  
- **Cost per Acquisition (CPA)** — highlights which channels and creatives deliver conversions most cost-effectively  

## Key Insights
- Performance varies meaningfully across channels, particularly when comparing cost per acquisition
- Some creatives consistently outperform others, suggesting opportunities for creative iteration
- Lower-cost traffic does not always translate to lower-cost conversions
- Aggregated metrics help reveal patterns that are not obvious at the individual campaign level

## Tools & Technologies
- Python
- pandas for metric calculation and aggregation
- matplotlib for visualization

## Outcome & Impact
This analysis demonstrates how ad performance data can be used to:
- Evaluate the effectiveness of marketing spend
- Identify high- and low-performing channels
- Support data-informed decisions around budget allocation and creative strategy

The same approach could be applied to real campaign data to support ongoing performance monitoring or experimentation.

## Next Steps
- Add time-based trends to analyze performance changes over time
- Incorporate A/B testing results for creative comparisons
- Expand the dataset to include additional channels or audience segments
- Connect outputs to a dashboard for ongoing reporting
