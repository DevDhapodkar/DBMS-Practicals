CREATE TABLE route_header (
    route_id NUMBER(5),
    origin VARCHAR2(20),
    destination VARCHAR2(20),
    fare NUMBER(7,2),
    distance NUMBER(3),
    capacity NUMBER(3)
);

INSERT INTO route_header VALUES (102, 'trichy', 'madurai', 33, 450, 56);
INSERT INTO route_header VALUES (103, 'madurai', 'madras', 35, 250, 50);
INSERT INTO route_header VALUES (104, 'madurai', 'madras', 35, 250, 50);
INSERT INTO route_header VALUES (105, 'madurai', 'madras', 35, 250, 50);

CREATE OR REPLACE PROCEDURE router_header_proc1 (routeid route_header.route_id%type) AS
  a NUMBER(7,2);
  b NUMBER(4);
BEGIN
  SELECT fare, distance INTO a, b FROM route_header WHERE route_id = routeid;
 IF b < 500 THEN
    UPDATE route_header SET fare = 190.98 WHERE route_id = routeid;
  ELSIF b BETWEEN 501 AND 1000 THEN
    UPDATE route_header SET fare = 800.00 WHERE route_id = routeid;
  ELSIF b > 1000 THEN
    DBMS_OUTPUT.put_line('Sorry, distance is too large!');
  END IF;
END;
/
