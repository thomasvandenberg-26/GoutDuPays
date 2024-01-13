CREATE TABLE "User" (
  id integer PRIMARY KEY,
  lastName varchar(255),
  firstName varchar(255),
  mail varchar(255)
);

CREATE TABLE Category (
  id integer PRIMARY KEY,
  name varchar(255)
);

CREATE TABLE "ArticleBasket" (
  id integer PRIMARY KEY,
  numberBasket integer
);
CREATE TABLE Article (
  id integer PRIMARY KEY,
  idArticle_Category integer,
  idArticle_User integer,
  idArticle_ArticleBasket integer,
  name varchar(100),
  description varchar(200),
  price decimal,
  quantity integer,
  FOREIGN KEY(idArticle_Category) REFERENCES Category(id),
  FOREIGN KEY(idArticle_User) REFERENCES User(id),
  FOREIGN KEY(idArticle_ArticleBasket) REFERENCES ArticleBasket(id)

);

CREATE TABLE Order (
  id integer PRIMARY KEY,
  numberOrder integer
);
CREATE TABLE Basket (
  id integer PRIMARY KEY,
  quantityArticle integer,
  idBasket_Order integer,
  FOREIGN KEY(idBasket_Order) REFERENCES Order(id)
);



CREATE TABLE "Article_ArticleBasket" (
  "Article_id" integer,
  "ArticleBasket_id" integer,
  PRIMARY KEY ("Article_id", "ArticleBasket_id")
);

ALTER TABLE "Article_ArticleBasket" ADD FOREIGN KEY ("Article_id") REFERENCES "Article" ("id");

ALTER TABLE "Article_ArticleBasket" ADD FOREIGN KEY ("ArticleBasket_id") REFERENCES "ArticleBasket" ("id");


CREATE TABLE "ArticleBasket_Basket" (
  "ArticleBasket_id" integer,
  "Basket_id" integer,
  PRIMARY KEY ("ArticleBasket_id", "Basket_id")
);

ALTER TABLE "ArticleBasket_Basket" ADD FOREIGN KEY ("ArticleBasket_id") REFERENCES "ArticleBasket" ("id");

ALTER TABLE "ArticleBasket_Basket" ADD FOREIGN KEY ("Basket_id") REFERENCES "Basket" ("id");
