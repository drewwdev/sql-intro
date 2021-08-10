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