WITH Kpis AS (
  SELECT * FROM CustomerHealthKpis
),
Trends AS (
  SELECT
    CustomerId,
    Month,
    TicketsProcessed,
    AvgProcessingMinutes,
    DataErrorRate,
    DenialRate,
    LAG(TicketsProcessed) OVER (PARTITION BY CustomerId ORDER BY Month) AS PrevTickets,
    LAG(AvgProcessingMinutes) OVER (PARTITION BY CustomerId ORDER BY Month) AS PrevAvgMins,
    LAG(DataErrorRate) OVER (PARTITION BY CustomerId ORDER BY Month) AS PrevErrorRate,
    LAG(DenialRate) OVER (PARTITION BY CustomerId ORDER BY Month) AS PrevDenialRate
  FROM Kpis
)
SELECT
  CustomerId,
  Month,
  TicketsProcessed,
  AvgProcessingMinutes,
  DataErrorRate,
  DenialRate,
  CASE WHEN PrevTickets IS NOT NULL AND TicketsProcessed < PrevTickets * 0.8 THEN 1 ELSE 0 END AS VolumeDropFlag,
  CASE WHEN PrevAvgMins IS NOT NULL AND AvgProcessingMinutes > PrevAvgMins * 1.25 THEN 1 ELSE 0 END AS EfficiencyFlag,
  CASE WHEN PrevErrorRate IS NOT NULL AND DataErrorRate > PrevErrorRate + 0.03 THEN 1 ELSE 0 END AS DataQualityFlag,
  CASE WHEN PrevDenialRate IS NOT NULL AND DenialRate > PrevDenialRate + 0.03 THEN 1 ELSE 0 END AS OutcomeQualityFlag,
  (
    (CASE WHEN PrevTickets IS NOT NULL AND TicketsProcessed < PrevTickets * 0.8 THEN 1 ELSE 0 END) +
    (CASE WHEN PrevAvgMins IS NOT NULL AND AvgProcessingMinutes > PrevAvgMins * 1.25 THEN 1 ELSE 0 END) +
    (CASE WHEN PrevErrorRate IS NOT NULL AND DataErrorRate > PrevErrorRate + 0.03 THEN 1 ELSE 0 END) +
    (CASE WHEN PrevDenialRate IS NOT NULL AND DenialRate > PrevDenialRate + 0.03 THEN 1 ELSE 0 END)
  ) AS RiskScore
FROM Trends
ORDER BY RiskScore DESC, Month DESC;
