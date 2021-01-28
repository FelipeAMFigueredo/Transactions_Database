CREATE TRIGGER Purchasing.LowCredit ON Purchasing.PurchaseOrderHeader  
AFTER INSERT  
AS  
IF (ROWCOUNT_BIG() = 0)
RETURN;

DECLARE TradeId AS CHAR;

SET TradeId = SELECT T.Id FROM Trade T 
		JOIN ListOfCategories L ON IdTrade = Id 
		WHERE T.Value < 1000.000 AND T.ClientSector = 'Public' AND L.IdCategory = NULL
UPDATE ListOfCategories SET IdCategory = 1 WHERE IdTrade = TradeId

SET TradeId = SELECT T.Id FROM Trade T 
		JOIN ListOfCategories L ON IdTrade = Id 
		WHERE T.Value > 1000.000 AND T.ClientSector = 'Public' AND L.IdCategory = NULL
UPDATE ListOfCategories SET IdCategory = 2 WHERE IdTrade = TradeId

SET TradeId = SELECT T.Id FROM Trade T 
		JOIN ListOfCategories L ON IdTrade = Id 
		WHERE T.Value > 1000.000 AND T.ClientSector = 'Private' AND L.IdCategory = NULL
UPDATE ListOfCategories SET IdCategory = 3 WHERE IdTrade = TradeId
GO  