CREATE OR REPLACE TRIGGER trig_upt_student
BEFORE UPDATE ON student
BEGIN
    DBMS_OUTPUT.PUT_LINE('This is a statement-level trigger that got fired');
END;
/

CREATE OR REPLACE TRIGGER trig_upt_student
BEFORE UPDATE ON student FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Row-level trigger got fired');
END;
/
