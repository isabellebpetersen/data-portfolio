-- Customer dimension
CREATE TABLE Customers (
  CustomerId        VARCHAR PRIMARY KEY,
  CustomerName      VARCHAR,
  Segment           VARCHAR,
  StartDate         DATE,
  CsmOwner          VARCHAR
);

-- Monthly subscription + contract info
CREATE TABLE CustomerContracts (
  CustomerId        VARCHAR,
  Month             DATE,
  SubscriptionFee   NUMERIC,
  PRIMARY KEY (CustomerId, Month)
);

-- Operational events from product/DB
CREATE TABLE WorkflowEvents (
  EventId           VARCHAR PRIMARY KEY,
  CustomerId        VARCHAR,
  CreatedAt         TIMESTAMP,
  Stage             VARCHAR,          -- e.g., Received/Validated/Processed/Completed
  Outcome           VARCHAR,          -- e.g., Completed/Rejected/Escalated
  ProcessingSeconds INTEGER,
  HasDataError      BOOLEAN
);

-- “Denials-like” outcomes table (RCM analog but generic)
CREATE TABLE OutcomeEvents (
  OutcomeId         VARCHAR PRIMARY KEY,
  CustomerId        VARCHAR,
  OccurredAt        TIMESTAMP,
  OutcomeType       VARCHAR,          -- e.g., Success/Denied
  DenialReason      VARCHAR           -- optional
);
