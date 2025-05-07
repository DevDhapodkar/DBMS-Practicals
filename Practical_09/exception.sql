CREATE OR REPLACE PROCEDURE exception_procedure(e emp.empno%TYPE) AS
    low_range_exception EXCEPTION;
    more_range_exception EXCEPTION;
    employeename emp.ename%TYPE;
BEGIN
    IF e <= 0 THEN
        RAISE low_range_exception;
    ELSIF e >= 8000 THEN
        RAISE more_range_exception;
    ELSE
        SELECT ename INTO employeename FROM emp WHERE empno = e;
        DBMS_OUTPUT.PUT_LINE(employeename);
    END IF;
    
    EXCEPTION
        WHEN no_data_found THEN
            DBMS_OUTPUT.PUT_LINE('No such item available');
        WHEN low_range_exception THEN
            DBMS_OUTPUT.PUT_LINE('Employee ID is too small!');
        WHEN more_range_exception THEN
            DBMS_OUTPUT.PUT_LINE('Employee ID is too big!');
END;
/
