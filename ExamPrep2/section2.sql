INSERT INTO property_transactions (property_id, buyer_id, transaction_date, bank_name,iban, is_successful)
SELECT po.agent_id + DAY(po.offer_datetime),
       po.agent_id + MONTH(po.offer_datetime),
       DATE(po.offer_datetime),
       CONCAT('Bank',' ',po.agent_id),
	  CONCAT('BG',po.price,po.agent_id),
      true
FROM property_offers AS po
WHERE po.agent_id<=2;

SELECT*FROM property_transactions;


UPDATE properties
SET price = price-50000
WHERE price>=800000;

SET SQL_SAFE_UPDATES=0;


DELETE FROM property_transactions
WHERE is_successful=0;