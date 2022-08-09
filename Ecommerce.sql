CREATE TABLE "users" (
  "id" serial PRIMARY KEY,
  "name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "phone" varchar UNIQUE NOT NULL,
  "address" varchar NOT NULL
);

CREATE TABLE "products" (
  "id" serial PRIMARY KEY,
  "name" varchar NOT NULL,
  "price" varchar NOT NULL,
  "category" varchar NOT NULL,
  "image_url" varchar NOT NULL
);

CREATE TABLE "categories" (
  "id" serial PRIMARY KEY,
  "name" varchar NOT NULL,
  "description" text
);

CREATE TABLE "cart" (
  "id" serial PRIMARY KEY,
  "product_id" int NOT NULL,
  "user_id" int NOT NULL
);

CREATE TABLE "orders" (
  "id" serial PRIMARY KEY,
  "cart_id" int NOT NULL,
  "date" timestamp DEFAULT 'Now()'
);

CREATE TABLE "product_cart" (
  "id" serial PRIMARY KEY,
  "product_id" int NOT NULL,
  "cart_id" int NOT NULL
);

CREATE TABLE "product_categories" (
  "id" serial PRIMARY KEY,
  "product_id" int NOT NULL,
  "categories_id" int NOT NULL
);

ALTER TABLE "product_categories" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("cart_id") REFERENCES "cart" ("id");

ALTER TABLE "cart" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "product_cart" ADD FOREIGN KEY ("cart_id") REFERENCES "cart" ("id");

ALTER TABLE "product_cart" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("id");

ALTER TABLE "product_categories" ADD FOREIGN KEY ("categories_id") REFERENCES "categories" ("id");
