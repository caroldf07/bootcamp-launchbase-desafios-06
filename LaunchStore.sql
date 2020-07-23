CREATE TABLE "customers" (
  "customers_id" SERIAL PRIMARY KEY,
  "name" text NOT NULL,
  "last_name" text NOT NULL,
  "cpf" int NOT NULL,
  "birth" date NOT NULL,
  "address_country" text NOT NULL,
  "address_uf" text NOT NULL,
  "address_city" text NOT NULL,
  "address_district" text NOT NULL,
  "address_zipcode" int NOT NULL,
  "address_street" text NOT NULL,
  "address_number" text,
  "created_at" timestamp DEFAULT 'now'
);

CREATE TABLE "agencies" (
  "agency_id" SERIAL PRIMARY KEY,
  "name" text UNIQUE,
  "address_country" text NOT NULL,
  "address_uf" text NOT NULL,
  "address_city" text NOT NULL,
  "address_district" text NOT NULL,
  "address_zipcode" int NOT NULL,
  "address_street" text NOT NULL,
  "address_number" text,
  "created_at" timestamp DEFAULT 'now'
);

CREATE TABLE "addresses" (
  "address_numberid" SERIAL PRIMARY KEY,
  "country" text UNIQUE,
  "uf" text UNIQUE,
  "city" text UNIQUE,
  "district" text UNIQUE,
  "zip_code" int UNIQUE
);

CREATE TABLE "cars" (
  "cars_id" SERIAL PRIMARY KEY,
  "model_id" int UNIQUE,
  "color" text,
  "license_plate" text UNIQUE NOT NULL,
  "price_rent" int NOT NULL,
  "kilometer" int NOT NULL
);

CREATE TABLE "models" (
  "model_id" SERIAL PRIMARY KEY,
  "name" text,
  "model_year" date,
  "made_in" text,
  "producer" text UNIQUE
);

CREATE TABLE "orders" (
  "order_id" int,
  "order_date" timestamp,
  "customer" int UNIQUE,
  "car_id" int,
  "model_id" int,
  "agency_id" int,
  "price_total" int
);

ALTER TABLE "cars" ADD FOREIGN KEY ("model_id") REFERENCES "models" ("model_id");

ALTER TABLE "orders" ADD FOREIGN KEY ("customer") REFERENCES "customers" ("cpf");

ALTER TABLE "orders" ADD FOREIGN KEY ("agency_id") REFERENCES "agencies" ("agency_id");

ALTER TABLE "orders" ADD FOREIGN KEY ("car_id") REFERENCES "cars" ("cars_id");

ALTER TABLE "orders" ADD FOREIGN KEY ("model_id") REFERENCES "cars" ("model_id");

ALTER TABLE "customers" ADD FOREIGN KEY ("address_country") REFERENCES "addresses" ("country");

ALTER TABLE "agencies" ADD FOREIGN KEY ("address_country") REFERENCES "addresses" ("country");

ALTER TABLE "customers" ADD FOREIGN KEY ("address_uf") REFERENCES "addresses" ("uf");

ALTER TABLE "customers" ADD FOREIGN KEY ("address_city") REFERENCES "addresses" ("city");

ALTER TABLE "customers" ADD FOREIGN KEY ("address_district") REFERENCES "addresses" ("district");

ALTER TABLE "customers" ADD FOREIGN KEY ("address_zipcode") REFERENCES "addresses" ("zip_code");

ALTER TABLE "agencies" ADD FOREIGN KEY ("address_uf") REFERENCES "addresses" ("uf");

ALTER TABLE "agencies" ADD FOREIGN KEY ("address_city") REFERENCES "addresses" ("city");

ALTER TABLE "agencies" ADD FOREIGN KEY ("address_district") REFERENCES "addresses" ("district");

ALTER TABLE "agencies" ADD FOREIGN KEY ("address_zipcode") REFERENCES "addresses" ("zip_code");

ALTER TABLE "orders" ADD FOREIGN KEY ("order_id") REFERENCES "customers" ("cpf");
