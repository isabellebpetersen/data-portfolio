WITH LatestMonth AS (
  SELECT MAX(Month) AS Month FROM CustomerHealthKpis
),
Current AS (
  SELECT *
  FROM CustomerHealthKpis
  WHERE Month = (SELECT Month FROM LatestMonth)
),
Ranked AS (
  SELECT
    CustomerId,
    CustomerName,
    Segment,
    TicketsProcessed,
    AvgProcessingMinutes,
    DataErrorRate,
    DenialRate,
    NTILE(4) OVER (ORDER BY TicketsProcessed DESC) AS VolumeQuartile,
    NTILE(4) OVER (ORDER BY DenialRate ASC) AS QualityQuartile
  FROM Current
)
SELECT *
FROM Ranked
ORDER BY DenialRate DESC, AvgProcessingMinutes DESC;
