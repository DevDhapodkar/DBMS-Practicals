CREATE OR REPLACE PROCEDURE SwapNumbers (
    num1 IN OUT NUMBER,
    num2 IN OUT NUMBER
) AS
BEGIN
    num1 := num1 + num2;
    num2 := num1 - num2;
    num1 := num1 - num2;
END;
/

DECLARE
    a NUMBER := 10;
    b NUMBER := 20;
BEGIN
    SwapNumbers(a, b);
    DBMS_OUTPUT.PUT_LINE('After Swap: a = ' || a || ', b = ' || b);
END;
/

SET SERVEROUTPUT ON
EXEC SwapNumbers(10, 20);
