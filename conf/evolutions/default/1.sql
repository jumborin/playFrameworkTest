# --- !Ups

CREATE TABLE disppatern (
  id INT not null PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(9),
  normalFlg BOOLEAN,
  numberFlg BOOLEAN,
  colorFlg BOOLEAN
);

INSERT INTO disppatern (id,name,normalFlg,numberFlg,colorFlg) VALUES (1,'normalFlg',true,false,false);
INSERT INTO disppatern (id,name,normalFlg,numberFlg,colorFlg) VALUES (2,'numberFlg',false,true,false);
INSERT INTO disppatern (id,name,normalFlg,numberFlg,colorFlg) VALUES (3,'colorFlg',false,false,true);

# --- !Downs

DROP TABLE disppatern;