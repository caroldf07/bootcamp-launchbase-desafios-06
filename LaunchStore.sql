CREATE TABLE "customers" (
  "id" SERIAL PRIMARY KEY,
  "name" text,
  "last_name" text,
  "cpf" int UNIQUE NOT NULL,
  "birth" date,
  "address_country" text,
  "address_uf" text,
  "address_city" text,
  "address_district" text,
  "address_zipcode" int,
  "address_street" text,
  "address_number" text,
  "created_at" timestamp DEFAULT 'now'
);

CREATE TABLE "agencies" (
  "id" SERIAL PRIMARY KEY,
  "name" text UNIQUE,
  "address_country" text,
  "address_uf" text,
  "address_city" text,
  "address_district" text,
  "address_zipcode" int,
  "address_street" text,
  "address_number" text,
  "created_at" timestamp DEFAULT 'now'
);

CREATE TABLE "addresses" (
  "id" SERIAL PRIMARY KEY,
  "country" text(100) UNIQUE,
  "uf" text,
  "city" text,
  "district" text,
  "zip_code" int
);

CREATE TABLE "cars" (
  "id" SERIAL PRIMARY KEY,
  "model_id" int UNIQUE,
  "color" text,
  "license_plate" text,
  "price_rent" int,
  "kilometer" int
);

CREATE TABLE "models" (
  "id" SERIAL PRIMARY KEY,
  "name" text,
  "model_year" date,
  "made_by" text,
  "producer" text UNIQUE
);

CREATE TABLE "orders" (
  "id" int,
  "order_date" timestamp,
  "customer" int UNIQUE,
  "car_id" int,
  "model_id" int,
  "agency_id" int,
  "price_total" int
);

ALTER TABLE "cars" ADD FOREIGN KEY ("model_id") REFERENCES "models" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("customer") REFERENCES "customers" ("cpf");

ALTER TABLE "orders" ADD FOREIGN KEY ("agency_id") REFERENCES "agencies" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("car_id") REFERENCES "cars" ("id");

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

ALTER TABLE "orders" ADD FOREIGN KEY ("id") REFERENCES "customers" ("cpf");
