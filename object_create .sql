

 CREATE TABLE "GATEPARTNER"."INBOX" 
   (	"ID" NUMBER(9,0), 
	"SENDER_NAME" VARCHAR2(120 BYTE), 
	"SENDER" VARCHAR2(255 BYTE), 
	"RECEIVER" VARCHAR2(250 BYTE), 
	"SUBJECT" VARCHAR2(255 BYTE),
	"MSG" VARCHAR2(2000 BYTE), 
	"SENTTIME" VARCHAR2(100 BYTE), 
	"RECEIVEDTIME" VARCHAR2(100 BYTE), 
	"OPERATOR" VARCHAR2(120 BYTE), 
	"MSGTYPE" VARCHAR2(50 BYTE), 
	"REFERENCE" VARCHAR2(100 BYTE), 
	"STATUS" VARCHAR2(50 BYTE), 
	"ERRORMSG" VARCHAR2(50 BYTE), 
	"ATTACH" VARCHAR2(250 BYTE),  
	CONSTRAINT "GATEPARTNER_REF_UK" UNIQUE ("REFERENCE"),
	CONSTRAINT "GATEPARTNER_IN_PK" PRIMARY KEY ("ID")
  );
 

 CREATE TABLE "GATEPARTNER"."CONFIG" 
   (	"CNF_NAME" VARCHAR2(50 BYTE), 
	"CNF_VALUE" VARCHAR2(4000 BYTE), 
	 CONSTRAINT "GATEPARTNER_CF_PK" PRIMARY KEY ("CNF_NAME")
   ); 


CREATE OR REPLACE TRIGGER "GATEPARTNER"."AUTONUM_INBOX" 
  before INSERT ON GATEPARTNER.INBOX 
  FOR EACH ROW
     WHEN (new.id IS NULL) BEGIN
  SELECT NVL(MAX(id),0) + 1
  INTO :NEW.id
  FROM GATEPARTNER.INBOX;
 END;
 /

 ALTER TRIGGER "GATEPARTNER"."AUTONUM_INBOX" ENABLE;
 

INSERT INTO "GATEPARTNER"."CONFIG" (cnf_name, cnf_value) 
VALUES ('sms-batch', 20);			
INSERT INTO "GATEPARTNER"."CONFIG" (cnf_name, cnf_value) 
VALUES ('email-batch', 5);	

