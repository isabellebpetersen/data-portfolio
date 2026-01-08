WITH HealthKpis AS (
  -- assume the output of 01_customer_health_kpis.sql is a view called CustomerHealthKpis
  SELECT * FROM CustomerHealthKpis
),
Contract AS (
  SELECT CustomerId, Month, SubscriptionFee
  FROM CustomerContracts
),
ValueModel AS (
  SELECT
    hk.CustomerId,
    hk.Month,
    hk.TicketsProcessed,
    hk.AvgProcessingMinutes,
    hk.DataErrorRate,
    hk.DenialRate,
    -- Simple value model:
    -- value = throughput benefit + quality benefit (toy example, but believable)
    (hk.TicketsProcessed * 2.50)                                       AS ThroughputValue,
    ((1 - hk.DataErrorRate) * hk.TicketsProcessed * 0.75)              AS QualityValue,
    ((1 - hk.DenialRate) * hk.TicketsProcessed * 1.25)                 AS OutcomeValue
  FROM HealthKpis hk
)
SELECT
  v.CustomerId,
  v.Month,
  c.SubscriptionFee,
  (v.ThroughputValue + v.QualityValue + v.OutcomeValue) AS EstimatedValue,
  ((v.ThroughputValue + v.QualityValue + v.OutcomeValue) - c.SubscriptionFee) AS NetValue,
  CASE WHEN c.SubscriptionFee = 0 THEN NULL
       ELSE (v.ThroughputValue + v.QualityValue + v.OutcomeValue) / c.SubscriptionFee
  END AS ValueToCostRatio
FROM ValueModel v
JOIN Contract c
  ON v.CustomerId = c.CustomerId AND v.Month = c.Month
ORDER BY ValueToCostRatio DESC;
