DELETE FROM input_data_1
WHERE EXISTS (
  SELECT 1 FROM input_data_1 i1 
  WHERE input_data_1.masked_acct = i1.masked_acct
  AND input_data_1.rowid > i1.rowid
);

SELECT * from input_data_1;

DELETE FROM input_data_2
WHERE EXISTS (
  SELECT 1 FROM input_data_2 i2 
  WHERE input_data_2.masked_acct = i2.masked_acct
  AND input_data_2.rowid > i2.rowid
);

SELECT * from input_data_2;

DELETE FROM input_data_3
WHERE EXISTS (
  SELECT 1 FROM input_data_3 i3 
  WHERE input_data_3.masked_acct = i3.masked_acct
  AND input_data_3.rowid > i3.rowid
);

SELECT * from input_data_3;

INSERT INTO input_data_1 SELECT * FROM input_data_2;
INSERT INTO input_data_1 SELECT * FROM input_data_3;

INSERT INTO input_data_4 SELECT * FROM input_data_5;
INSERT INTO input_data_4 SELECT * FROM input_data_6;

INSERT INTO input_data_7 SELECT * FROM input_data_8;
INSERT INTO input_data_7 SELECT * FROM input_data_9;

SELECT * from input_data_4;
SELECT * from input_data_7;

select * from target;

create TABLE recovery
as
SELECT masked_acct,score_ind, RecoveryPctBalanceAtDefaultRatioMACO12 from (select masked_acct,score_ind,RecoveryPctBalanceAtDefaultRatioMACO12,row_number()
OVER(PARTITION by masked_acct ORDER by score_ind DESC) R from target ) WHERE R =2
union
select masked_acct, min(score_ind) as score, RecoveryPctBalanceAtDefaultRatioMACO12 FROM target group by masked_acct;

select * from recovery;

create table recovery_rate
as SELECT masked_acct,avg(RecoveryPctBalanceAtDefaultRatioMACO12) as rate_recovery from recovery group by masked_acct; 

select * FROM recovery_rate;

CREATE table final_table
AS 
Select * FROM input_data_1
JOIN recovery_rate 
on recovery_rate.masked_acct=input_data_1.masked_acct
JOIN input_data_4
ON input_data_1.key_1 = input_data_4.key_1
JOIN input_data_7
ON input_data_7.key_2= input_data_4.key_2
;

