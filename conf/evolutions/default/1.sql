# --- !Ups

CREATE TABLE disppatern (
  id INT not null PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(7),
  nomlFlg BOOLEAN,
  numlFlg BOOLEAN,
  tablFlg BOOLEAN
);

INSERT INTO disppatern (id,name,nomlFlg,numlFlg,tablFlg) VALUES (1,'nomlFlg',true,false,false);
INSERT INTO disppatern (id,name,nomlFlg,numlFlg,tablFlg) VALUES (2,'numlFlg',false,true,false);
INSERT INTO disppatern (id,name,nomlFlg,numlFlg,tablFlg) VALUES (3,'tablFlg',false,false,true);

# --- !Downs

DROP TABLE disppatern;