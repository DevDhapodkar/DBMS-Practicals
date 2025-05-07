CREATE OR REPLACE PROCEDURE FindLargest (
    num1 IN NUMBER,
    num2 IN NUMBER,
    num3 IN NUMBER,
    largest OUT NUMBER
) AS
BEGIN
    IF num1 >= num2 AND num1 >= num3 THEN
        largest := num1;
    ELSIF num2 >= num1 AND num2 >= num3 THEN
        largest := num2;
    ELSE
        largest := num3;
    END IF;
END;
/

DECLARE
    x NUMBER := 15;
    y NUMBER := 25;
    z NUMBER := 10;
    maxVal NUMBER;
BEGIN
    FindLargest(x, y, z, maxVal);
    DBMS_OUTPUT.PUT_LINE('Largest Value: ' || maxVal);
END;
/
