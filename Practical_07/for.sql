CREATE OR REPLACE PROCEDURE SumFirst10EvenNumbers_ForLoop AS
    sum1 NUMBER := 0;
BEGIN
    FOR i IN 1..10 LOOP
        sum1 := sum1 + (2 * i);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Sum of first 10 even numbers using FOR loop: ' || sum1);
END;
/

 BEGIN
        SumFirst10EvenNumbers_ForLoop;
  END;
    /
