--
-- Type: USER; Name: TM_CZ
--
CREATE USER "TM_CZ" IDENTIFIED BY VALUES 'S:7CF819E5E74C69B537161C5510D71E8D846ED2BE36F9239616BB112D5BF2;5DFF82A621539D10'
   DEFAULT TABLESPACE "TRANSMART"
   TEMPORARY TABLESPACE "TEMP";

--
-- Type: SYSTEM_GRANT; Name: TM_CZ
--
GRANT CREATE PROCEDURE TO "TM_CZ";

GRANT DROP ANY INDEX TO "TM_CZ";

GRANT CREATE ANY INDEX TO "TM_CZ";

GRANT DROP ANY TABLE TO "TM_CZ";

GRANT CREATE ANY TABLE TO "TM_CZ";

--
-- Type: TABLESPACE_QUOTA; Name: TM_CZ
--
  DECLARE 
  TEMP_COUNT NUMBER; 
  SQLSTR VARCHAR2(200); 
BEGIN 
  SQLSTR := 'ALTER USER "TM_CZ" QUOTA UNLIMITED ON "INDX"';
  EXECUTE IMMEDIATE SQLSTR;
EXCEPTION 
  WHEN OTHERS THEN
    IF SQLCODE = -30041 THEN 
      SQLSTR := 'SELECT COUNT(*) FROM USER_TABLESPACES 
              WHERE TABLESPACE_NAME = ''INDX'' AND CONTENTS = ''TEMPORARY''';
      EXECUTE IMMEDIATE SQLSTR INTO TEMP_COUNT;
      IF TEMP_COUNT = 1 THEN RETURN; 
      ELSE RAISE; 
      END IF;
    ELSE
      RAISE;
    END IF;
END;
/
 
  DECLARE 
  TEMP_COUNT NUMBER; 
  SQLSTR VARCHAR2(200); 
BEGIN 
  SQLSTR := 'ALTER USER "TM_CZ" QUOTA UNLIMITED ON "TRANSMART"';
  EXECUTE IMMEDIATE SQLSTR;
EXCEPTION 
  WHEN OTHERS THEN
    IF SQLCODE = -30041 THEN 
      SQLSTR := 'SELECT COUNT(*) FROM USER_TABLESPACES 
              WHERE TABLESPACE_NAME = ''TRANSMART'' AND CONTENTS = ''TEMPORARY''';
      EXECUTE IMMEDIATE SQLSTR INTO TEMP_COUNT;
      IF TEMP_COUNT = 1 THEN RETURN; 
      ELSE RAISE; 
      END IF;
    ELSE
      RAISE;
    END IF;
END;
/
 
  DECLARE 
  TEMP_COUNT NUMBER; 
  SQLSTR VARCHAR2(200); 
BEGIN 
  SQLSTR := 'ALTER USER "TM_CZ" QUOTA UNLIMITED ON "I2B2_DATA"';
  EXECUTE IMMEDIATE SQLSTR;
EXCEPTION 
  WHEN OTHERS THEN
    IF SQLCODE = -30041 THEN 
      SQLSTR := 'SELECT COUNT(*) FROM USER_TABLESPACES 
              WHERE TABLESPACE_NAME = ''I2B2_DATA'' AND CONTENTS = ''TEMPORARY''';
      EXECUTE IMMEDIATE SQLSTR INTO TEMP_COUNT;
      IF TEMP_COUNT = 1 THEN RETURN; 
      ELSE RAISE; 
      END IF;
    ELSE
      RAISE;
    END IF;
END;
/
 
--
-- Type: ROLE_GRANT; Name: TM_CZ
--
GRANT "CONNECT" TO "TM_CZ";

GRANT "EXP_FULL_DATABASE" TO "TM_CZ";
