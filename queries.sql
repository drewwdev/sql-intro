createdb CompanyDatabase

CREATE TABLE "Employees" ("FullName" TEXT, "Salary" INT, "JobPosition" TEXT, "PhoneExtension" INT, "IsPartTime" BOOLEAN);

INSERT INTO "Employees" ("FullName",  "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Drew Wilson', '100000', 'The Boss', '100', false);

INSERT INTO "Employees" ("FullName",  "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Joe Blow', '20000', 'Customer Service', '2', true);

INSERT INTO "Employees" ("FullName",  "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Shawn Soltesz', '500000', 'CEO', '1', true);

INSERT INTO "Employees" ("FullName",  "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Dom Mitchell', '30000', 'Hacker', '2', true);

INSERT INTO "Employees" ("FullName",  "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Johnny Two-by-four', '100000', 'Janitor', '5', false);

INSERT INTO "Employees" ("FullName",  "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Magic Mike', '77000', 'Cook', '7', true);

INSERT INTO "Employees" ("FullName",  "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Sally May', '50000', 'Secretary', '99', true);

INSERT INTO "Employees" ("FullName",  "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Tom Ford', '30000', 'Production Line', '55', false);

INSERT INTO "Employees" ("FullName",  "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Dick Dickinson', '40000', 'Production Manager', '66', true);

INSERT INTO "Employees" ("FullName",  "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Harry Haywood', '60000', 'Senior Analyst', '88', true);

SELECT * FROM "Employees";

SELECT "FullName", "PhoneExtension" FROM "Employees" WHERE "IsPartTime" = false;

INSERT INTO "Employees" ("FullName",  "Salary", "JobPosition", "PhoneExtension", "IsPartTime")
VALUES ('Lazy Larry', '450', 'Software Developer', '900', true);

UPDATE "Employees" SET "Salary" = '500' WHERE "JobPosition" = 'Cook';

ALTER TABLE "Employees" ADD COLUMN "ParkingSpot" VARCHAR(10);

Adventure mode:

ALTER TABLE "Employees" ALTER COLUMN "FullName" SET NOT NULL;

ALTER TABLE "Employees" ALTER COLUMN "Salary" SET NOT NULL;

ALTER TABLE "Employees" ALTER COLUMN "JobPosition" SET NOT NULL;

ALTER TABLE "Employees" ALTER COLUMN "IsPartTime" SET NOT NULL;

ALTER TABLE "Employees" ADD COLUMN "Id" SERIAL PRIMARY KEY;

Epic Mode:

CREATE TABLE "Departments" ("Name"  TEXT, "BuildingNumber"  INT);

ALTER TABLE "Employees" ADD COLUMN "DepartmentId" INTEGER NULL REFERENCES "Departments" ("Id");

04-03 - Foreign Keys - The SQL

Explorer Mode:

DROP TABLE "Departments";

CREATE TABLE "Departments" (  "Id" SERIAL PRIMARY KEY,  "DepartmentName"  TEXT, "Building" TEXT);

ALTER TABLE "Employees" ADD COLUMN "DepartmentId" INT NULL REFERENCES "Departments";

CREATE TABLE "Products" ("Id" SERIAL PRIMARY KEY, "Price" NUMERIC, "Name" TEXT, "Description" TEXT, "QuantityInStock" INT);

CREATE TABLE "Orders" ("Id" SERIAL PRIMARY KEY, "OrderNumber" TEXT, "DatePlaced" TIMESTAMP, "Email" TEXT);

CREATE TABLE "ProductOrders" ("Product" INT REFERENCES "Products" ("Id"), "Order" INT REFERENCES "Orders" ("Id"), "OrderQuantity" INT);

SELECT "ProductOrders"."OrderQuantity" FROM "ProductOrders";

SELECT "ProductOrders"."OrderQuantity" FROM "ProductOrders" JOIN "Orders" ON "ProductOrders"."Order" = "Orders"."Id" 
JOIN "Products" ON "ProductOrders"."Product" = "Products"."Id";

INSERT INTO "Departments" ("DepartmentName", "Building")
VALUES ('Development', 'Main');

INSERT INTO "Departments" ("DepartmentName", "Building")
VALUES ('Marketing', 'North');

INSERT INTO "Employees" ("FullName",  "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "DepartmentId")
VALUES ('Tim Smith', '40000', 'Programmer', '123', false, '1');

INSERT INTO "Employees" ("FullName",  "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "DepartmentId")
VALUES ('Barbara Ramsey', '80000', 'Manager', '234', false, '1');

INSERT INTO "Employees" ("FullName",  "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "DepartmentId")
VALUES ('Tom Jones', '32000', 'Admin', '456', true, '2');

INSERT INTO "Products" ("Price", "Name", "Description", "QuantityInStock")
VALUES ('12.45', 'Widget', 'The Original Widget', '100');

INSERT INTO "Products" ("Price", "Name", "Description", "QuantityInStock")
VALUES ('99.99', 'Flowbee', 'Perfect for haircuts', '3');

INSERT INTO "Orders" ("OrderNumber", "DatePlaced", "Email")
VALUES ('X529', '2020-01-01 04:55:00', 'person@example.com');

INSERT INTO "ProductOrders" ("Product", "OrderQuantity", "Order")
VALUES ('1', '3', '1');

INSERT INTO "ProductOrders" ("Product", "OrderQuantity", "Order")
VALUES ('2', '2', '1');

SELECT "Departments"."Building", "Departments"."DepartmentName", "Employees"."FullName" FROM "Employees"
JOIN "Departments" ON "Employees"."DepartmentId" = "Departments"."Id"
WHERE "Departments"."Building" = 'North Side';

SELECT "Departments"."Building", "Departments"."DepartmentName", "Employees"."FullName" FROM "Employees"
JOIN "Departments" ON "Employees"."DepartmentId" = "Departments"."Id"
WHERE "Departments"."Building" = 'Ease Side';

SELECT "Departments"."Building", "Departments"."DepartmentName", "Employees"."FullName" FROM "Employees"
JOIN "Departments" ON "Employees"."DepartmentId" = "Departments"."Id"
WHERE "Departments"."Building" = 'North';

SELECT "Products"."Id", "Orders"."OrderNumber", "ProductOrders"."OrderQuantity"
FROM "Orders" JOIN "ProductOrders" ON "Orders"."Id" = "ProductOrders"."Order"
JOIN "Products" ON "ProductOrders"."Product" = "Products"."Id" WHERE "ProductOrders"."Product" = 2;

SELECT "ProductOrders"."OrderQuantity", "Orders"."OrderNumber", "Products"."Name"
FROM "Orders" JOIN "ProductOrders" ON "Orders"."Id" = "ProductOrders"."Order"
JOIN "Products" ON "ProductOrders"."Product" = "Products"."Id"
WHERE ("Orders"."OrderNumber" = 'X529' AND "Products"."Name" = 'Flowbee');