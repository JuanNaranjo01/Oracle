CREATE TABLE "User" (
    id VARCHAR2(50) PRIMARY KEY,
    updated_at DATE,
    created_at DATE,
    email VARCHAR2(100),
    password VARCHAR2(100),
    first_name VARCHAR2(100),
    last_name VARCHAR2(100)
);

CREATE TABLE "State" (
    "id" VARCHAR2(50) PRIMARY KEY,
    "updated_at" DATE,
    "created_at" DATE,
    "name" VARCHAR2(100)
);

CREATE TABLE "City" (
    "id" VARCHAR2(50) PRIMARY KEY,
    "updated_at" DATE,
    "created_at" DATE,
    "state_id" VARCHAR2(50),
    "name" VARCHAR2(100)
);

CREATE TABLE "Amenity" (
    "id" VARCHAR2(50) PRIMARY KEY,
    "updated_at" DATE,
    "created_at" DATE,
    "name" VARCHAR2(100)
);

CREATE TABLE "Place" (
    "id" VARCHAR2(50) PRIMARY KEY,
    "updated_at" DATE,
    "created_at" DATE,
    "user_id" VARCHAR2(50),
    "name" VARCHAR2(100),
    "city_id" VARCHAR2(50),
    "description" VARCHAR2(255),
    "number_rooms" INTEGER DEFAULT 0,
    "number_bathrooms" INTEGER DEFAULT 0,
    "max_guest" INTEGER DEFAULT 0,
    "price_by_night" INTEGER DEFAULT 0,
    "latitude" FLOAT,
    "longitude" FLOAT
);

CREATE TABLE "Review" (
    "id" VARCHAR2(50) PRIMARY KEY,
    "updated_at" DATE,
    "created_at" DATE,
    "user_id" VARCHAR2(50),
    "place_id" VARCHAR2(50),
    "text" VARCHAR2(255)
);

CREATE TABLE "PlaceAmenity" (
    "place_id" VARCHAR2(50),
    "amenity_id" VARCHAR2(50)
);

ALTER TABLE "City" 
ADD CONSTRAINT "fk_city_state" 
FOREIGN KEY ("state_id") 
REFERENCES "State"("id");

ALTER TABLE "Place" 
ADD CONSTRAINT "fk_place_user" 
FOREIGN KEY ("user_id") 
REFERENCES "User"("id");

ALTER TABLE "Place" 
ADD CONSTRAINT "fk_place_city" 
FOREIGN KEY ("city_id") 
REFERENCES "City"("id");

ALTER TABLE "Review" 
ADD CONSTRAINT "fk_review_user" 
FOREIGN KEY ("user_id") 
REFERENCES "User"("id");

ALTER TABLE "Review" 
ADD CONSTRAINT "fk_review_place" 
FOREIGN KEY ("place_id") 
REFERENCES "Place"("id");

ALTER TABLE "PlaceAmenity" 
ADD CONSTRAINT "fk_placeamenity_place" 
FOREIGN KEY ("place_id") 
REFERENCES "Place"("id");

ALTER TABLE "PlaceAmenity" 
ADD CONSTRAINT "fk_placeamenity_amenity" 
FOREIGN KEY ("amenity_id") 
REFERENCES "Amenity"("id");