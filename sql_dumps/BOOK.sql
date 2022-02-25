/*
 Navicat Premium Data Transfer

 Source Server         : Sanju
 Source Server Type    : Oracle
 Source Server Version : 190000
 Source Schema         : C##SANJU

 Target Server Type    : Oracle
 Target Server Version : 190000
 File Encoding         : 65001

 Date: 22/02/2022 20:48:34
*/


-- ----------------------------
-- Table structure for BOOK
-- ----------------------------
DROP TABLE "C##SANJU"."BOOK";
CREATE TABLE "C##SANJU"."BOOK" (
  "BOOK_ID" NUMBER VISIBLE DEFAULT "C##SANJU"."ISEQ$$_78311".nextval NOT NULL,
  "BOOK_NAME" VARCHAR2(512 BYTE) VISIBLE NOT NULL,
  "BOOK_GENRE" VARCHAR2(512 BYTE) VISIBLE,
  "AUTHOR_ID" NUMBER VISIBLE NOT NULL,
  "PUBLISHER_ID" NUMBER VISIBLE NOT NULL,
  "LANGUAGE" VARCHAR2(128 BYTE) VISIBLE,
  "SUMMARY" VARCHAR2(3000 BYTE) VISIBLE,
  "ISBN" VARCHAR2(100 BYTE) VISIBLE DEFAULT '0',
  "PAGES" NUMBER VISIBLE,
  "QUANTITY" NUMBER VISIBLE DEFAULT 1,
  "EDITION" VARCHAR2(512 BYTE) VISIBLE,
  "PRICE_PER_BOOK" NUMBER VISIBLE NOT NULL,
  "RATINGS" NUMBER(3,2) VISIBLE DEFAULT 0,
  "NO_OF_RATINGS" NUMBER VISIBLE DEFAULT 0
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of BOOK
-- ----------------------------
INSERT INTO "C##SANJU"."BOOK" VALUES ('10001038', 'Amar Ache Jol', 'Novel', '1000001', '100010', 'Bangla', NULL, '1111112456', '110', '34', '2nd edition', '150', '0', '0');
INSERT INTO "C##SANJU"."BOOK" VALUES ('10001039', 'Ami Topu', 'kids, Novel', '1000002', '100010', 'Bangla', NULL, '1111112345', '120', '12', '3rd edition', '220', '0', '0');
INSERT INTO "C##SANJU"."BOOK" VALUES ('10001040', 'Pother Dabi', 'literature, Novel', '1000005', '100004', 'Bangla', 'The book is about a secret society named Pather Dabi whose goal is to free India from British rule.And Sarat Chandra chattopadhyay played a great role for making a Revolutionary mind in young Indians,which gives an effort to the Indians to free from this Torture by British.Sharat Chandra chattopadhyay helped to create an independent consciousness among the Indians.And he also mentioned that independence is the only way to save Indians and also mentioned that proper relationship is not only family relations but also a relation with anyone who is struggling to save India from the British rule, through the words of his novel.', '1111148745', '200', '30', '3rd edition', '250', '0', '0');
INSERT INTO "C##SANJU"."BOOK" VALUES ('10001041', 'Ghore-Baire', 'literature, Novel', '1000003', '100006', 'Bangla', NULL, '1114148745', '100', '60', '2nd edition', '150', '0', '0');
INSERT INTO "C##SANJU"."BOOK" VALUES ('10001042', 'Angels & Demons', 'fiction, Novel', '1000004', '100003', 'English', NULL, '1114148885', '350', '30', '2nd edition', '550', '0', '0');
INSERT INTO "C##SANJU"."BOOK" VALUES ('10001043', 'Kopotronic Shukh Dukkho', 'Science fiction', '1000002', '100005', 'Bangla', NULL, '1114828885', '150', '30', '4th edition', '250', '0', '0');
INSERT INTO "C##SANJU"."BOOK" VALUES ('10001044', 'Feluda Somogro', 'Adventure, fiction', '1000008', '100007', 'Bangla', NULL, '1114828895', '450', '42', '3rd edition', '500', '0', '0');
INSERT INTO "C##SANJU"."BOOK" VALUES ('10001045', 'Eleven Minutes', 'Novel, fiction', '1000009', '100005', 'English', 'Eleven Minutes is the story of Maria, a young girl from a Brazilian village, whose first innocent brushes with love leave her heartbroken. At a tender age, she becomes convinced that she will never find true love, instead believing that “love is a terrible thing that will make you suffer. . . .” A chance meeting in Rio takes her to Geneva, where she dreams of finding fame and fortune.', '1114827800', '130', '20', '3rd edition', '200', '0', '0');
INSERT INTO "C##SANJU"."BOOK" VALUES ('10001046', 'Taranath Tantrik', 'Horror', '1000006', '100001', 'Bangla', 'Taradas Bandyopadhyay is a worthy son of Bibhutibhushan Bandyopadhyay. Taranath Tantrik is a story about Horror and the supernatural, Bibhutibhushan writing two stories of Taranath Tantrik and he said goodbye to the world. After his death, his son began writing these stories again', '1113327800', '220', '25', '3rd edition', '250', '0', '0');
INSERT INTO "C##SANJU"."BOOK" VALUES ('10001047', 'Maa', 'Historical, war novel', '1000007', '100002', 'Bangla', NULL, '1113327801', '250', '30', '3rd edition', '300', '0', '0');
INSERT INTO "C##SANJU"."BOOK" VALUES ('10001048', 'Seventy-one days', 'Literature, fiction', '1000010', '100000', 'Bangla', 'Ekattorer Dingulee is an autobiography by martyr-mother Jahanara Imam based on her experiences of the liberation war of Bangladesh in 1971.', '1113329901', '250', '24', '8th edition', '250', '0', '0');

-- ----------------------------
-- Primary Key structure for table BOOK
-- ----------------------------
ALTER TABLE "C##SANJU"."BOOK" ADD CONSTRAINT "BOOK_PK" PRIMARY KEY ("BOOK_ID");

-- ----------------------------
-- Checks structure for table BOOK
-- ----------------------------
ALTER TABLE "C##SANJU"."BOOK" ADD CONSTRAINT "SYS_C008122" CHECK ("BOOK_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##SANJU"."BOOK" ADD CONSTRAINT "SYS_C008123" CHECK ("BOOK_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##SANJU"."BOOK" ADD CONSTRAINT "SYS_C008124" CHECK ("AUTHOR_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##SANJU"."BOOK" ADD CONSTRAINT "SYS_C008125" CHECK ("PUBLISHER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##SANJU"."BOOK" ADD CONSTRAINT "SYS_C008126" CHECK ("PRICE_PER_BOOK" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table BOOK
-- ----------------------------
ALTER TABLE "C##SANJU"."BOOK" ADD CONSTRAINT "BOOK_AUTHOR_FK" FOREIGN KEY ("AUTHOR_ID") REFERENCES "C##SANJU"."AUTHOR" ("AUTHOR_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##SANJU"."BOOK" ADD CONSTRAINT "BOOK_PUBLISHER_FK" FOREIGN KEY ("PUBLISHER_ID") REFERENCES "C##SANJU"."PUBLISHER" ("PUBLISHER_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
