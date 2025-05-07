CREATE OR REPLACE PROCEDURE CalculateArea (
   radius IN NUMBER,
    area OUT NUMBER
) AS
BEGIN
    area := 3.14159 * radius * radius;
END;
/

DECLARE
    r NUMBER := 5;
    areaCircle NUMBER;
BEGIN
    CalculateArea(r, areaCircle);
    DBMS_OUTPUT.PUT_LINE('Area of Circle: ' || areaCircle);
END;
/
