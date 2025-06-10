CREATE TABLE User
(Id CHAR(5) PRIMARY KEY,
 Name VARCHAR(20) NOT NULL,
 Gender CHAR(1),
 CHECK (Gender NOT LIKE '%[^MF]%')
 );
CREATE TABLE Friends
(Id1 CHAR(5),
 Id2 CHAR(5),
 StartDate DATE,
 FOREIGN KEY (Id1) REFERENCES User(Id),
 FOREIGN KEY (Id2) REFERENCES User(Id),
 PRIMARY KEY (Id1, Id2)
 );
CREATE TABLE Comments
 (CommentId INT PRIMARY KEY,
 Poster CHAR(5),
 Recipient CHAR(5),
 Text VARCHAR(255) NOT NULL,
 PostDate DATE,
 FOREIGN KEY (Poster) REFERENCES User(Id),
 FOREIGN KEY (Recipient) REFERENCES User(Id)
 );
 
INSERT INTO User VALUES
 ('12345','Dyllan','M');
INSERT INTO User VALUES
 ('54321','James','M');
INSERT INTO User VALUES
 ('98765','Anne','F');
INSERT INTO User VALUES
 ('56789','Kate','F');
INSERT INTO User VALUES
 ('11111','Ellen','F');
 
INSERT INTO Friends VALUES
 ('12345','54321','2000-05-08');  /* Dyllan to James*/
INSERT INTO Friends VALUES 		  
 ('54321','12345','2000-05-08');  /*James to Dyllan*/
INSERT INTO Friends VALUES 		  
 ('98765','12345','2000-05-08');  /*Anne to Dyllan*/
INSERT INTO Friends VALUES 		  
 ('12345','98765','2000-05-08');  /*Dyllan to Anne*/
INSERT INTO Friends VALUES 		  
 ('11111','54321','1980-10-10');  /*Ellen to James*/
INSERT INTO Friends VALUES 		  
 ('54321','11111','1980-10-10');  /*James to Ellen*/
INSERT INTO Friends VALUES 		  
 ('54321','98765','1980-10-10');  /*James to Anne*/
INSERT INTO Friends VALUES 		  
 ('98765','54321','1980-10-10');  /*Anne to James*/
INSERT INTO Friends VALUES 		  
 ('54321','56789','2020-08-26');  /*James to Kate*/
INSERT INTO Friends VALUES 		  
 ('56789','54321','2020-08-26');  /*Kate to James*/
 
INSERT INTO Comments VALUES
 ('1','12345','98765','Hello There lol','2061-08-12');
INSERT INTO Comments VALUES
 ('2','11111','54321','Bad day lol','2020-02-24');
INSERT INTO Comments VALUES
 ('3','56789','54321','What is that?','2020-09-29');
INSERT INTO Comments VALUES
 ('4','12345','54321','that looks cool','2001-04-11');
INSERT INTO Comments VALUES
 ('5','54321','11111','I dont think we have met','2005-01-06');
INSERT INTO Comments VALUES
 ('6','98765','12345','Where are you lol','1995-04-29');
INSERT INTO Comments VALUES
 ('7','56789','12345','Is that you Kate?','2015-07-17');
INSERT INTO Comments VALUES
 ('8','54321','11111','Its been a while','2020-04-14');
INSERT INTO Comments VALUES
 ('9','12345','98765','What day is the test','2007-05-13');
INSERT INTO Comments VALUES
 ('10','56789','98765','I dont know','2019-09-25');