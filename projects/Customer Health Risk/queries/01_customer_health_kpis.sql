WITH MonthlyOps AS (
  SELECT
    CustomerId,
    DATE_TRUNC('month', CreatedAt)::date AS Month,
    COUNT(*) AS TicketsProcessed,
    AVG(ProcessingSeconds) / 60.0 AS AvgProcessingMinutes,
    AVG(CASE WHEN HasDataError THEN 1 ELSE 0 END) AS DataErrorRate,
    AVG(CASE WHEN Outcome = 'Escalated' THEN 1 ELSE 0 END) AS EscalationRate
  FROM WorkflowEvents
  GROUP BY 1,2
),
MonthlyOutcomes AS (
  SELECT
    CustomerId,
    DATE_TRUNC('month', OccurredAt)::date AS Month,
    AVG(CASE WHEN OutcomeType = 'Denied' THEN 1 ELSE 0 END) AS DenialRate
  FROM OutcomeEvents
  GROUP BY 1,2
)
SELECT
  c.CustomerId,
  c.CustomerName,
  c.Segment,
  mo.Month,
  mo.TicketsProcessed,
  mo.AvgProcessingMinutes,
  mo.DataErrorRate,
  mo.EscalationRate,
  COALESCE(ot.DenialRate, 0) AS DenialRate
FROM Customers c
JOIN MonthlyOps mo ON c.CustomerId = mo.CustomerId
LEFT JOIN MonthlyOutcomes ot
  ON mo.CustomerId = ot.CustomerId AND mo.Month = ot.Month;
