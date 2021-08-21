-- first solution
CREATE OR REPLACE PROCEDURE PROD_DESCRIP (MFR integer, PRICEs integer)
AS 
cursor cur (id integer) is
select PRODUCT_NAME, MFR_ID,PRICE,DESCRIPTION
 from Products p
WHERE p.MFR_ID = id;
v_products cur%rowtype;
BEGIN
open cur (MFR);
fetch cur into v_products;
WHILE cur%FOUND LOOP
        update Products p
        set description = 'Дорогой товар'
        where p.MFR_ID = mfr and p.PRICE > PRICEs;
        update Products p
        set description = 'дешевый товар'
        where p.MFR_ID = mfr and p.PRICE < PRICEs;
  fetch cur into v_products;
end loop;
close cur;
END;
-- second solution
CREATE OR REPLACE PROCEDURE PROD_DESCRIP (MFR integer, PRICEs integer)
AS 
cursor cur is
select PRODUCT_NAME, MFR_ID,PRICE,DESCRIPTION
 from Products p;
BEGIN
for i in cur LOOP
        update Products p
        set description = 'Дорогой товар'
        where p.MFR_ID = mfr and p.PRICE > PRICEs;
        update Products p
        set description = 'дешевый товар'
        where p.MFR_ID = mfr and p.PRICE < PRICEs;
end loop;
END;