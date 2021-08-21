CREATE OR REPLACE FUNCTION GOODSMAXCOST (pr INTEGER)
RETURN varchar2
AS
CURSOR c_cur (pr_ integer) IS 
SELECT m.mfr FROM MANUFACTURERS m
INNER JOIN Products p
  on m.MFR_ID = p.MFR_ID
 WHERE p.price > pr_;
 result varchar2(500);
BEGIN
    for i in c_cur (pr) loop
        result := result || i.mfr || ', ';
    end loop;
    return result;
END;
