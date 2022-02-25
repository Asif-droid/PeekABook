/*
 Navicat Premium Data Transfer

 Source Server         : Sanju
 Source Server Type    : Oracle
 Source Server Version : 190000
 Source Schema         : C##SANJU

 Target Server Type    : Oracle
 Target Server Version : 190000
 File Encoding         : 65001

 Date: 22/02/2022 20:49:05
*/


-- ----------------------------
-- Table structure for AUTHOR
-- ----------------------------
DROP TABLE "C##SANJU"."AUTHOR";
CREATE TABLE "C##SANJU"."AUTHOR" (
  "AUTHOR_ID" NUMBER VISIBLE DEFAULT "C##SANJU"."ISEQ$$_78305".nextval NOT NULL,
  "AUTHOR_NAME" VARCHAR2(512 BYTE) VISIBLE NOT NULL,
  "AUTHOR_SUMMARY" VARCHAR2(3000 BYTE) VISIBLE,
  "ADDRESS_ID" NUMBER VISIBLE
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
-- Records of AUTHOR
-- ----------------------------
INSERT INTO "C##SANJU"."AUTHOR" VALUES ('1000001', 'Humayun Ahmed', 'Great novel writer', '1122');
INSERT INTO "C##SANJU"."AUTHOR" VALUES ('1000003', 'Rabindranath Tagore', ' Was a Bengali polymath—poet, writer, playwright, composer, philosopher, social reformer and painter.', '1002');
INSERT INTO "C##SANJU"."AUTHOR" VALUES ('1000004', 'Dan Brown', 'Daniel Gerhard Brown is an American author best known for his thriller novels, including the Robert Langdon novels Angels & Demons, The Da Vinci Code, The Lost Symbol, Inferno, and Origin.', '1025');
INSERT INTO "C##SANJU"."AUTHOR" VALUES ('1000005', 'Sarat Chandra Chattopadhyay', NULL, '1003');
INSERT INTO "C##SANJU"."AUTHOR" VALUES ('1000006', 'Taradas Bandyopadhyay', 'was an Indian poet, writer, novelist and essayist in the Bengali language.', '1004');
INSERT INTO "C##SANJU"."AUTHOR" VALUES ('1000007', 'Anisul Haque', NULL, '1005');
INSERT INTO "C##SANJU"."AUTHOR" VALUES ('1000008', 'Satyajit Ray', 'Satyajit Ray was an Indian filmmaker, screenwriter, documentary filmmaker, author, essayist, lyricist, magazine editor, illustrator, calligrapher, and music composer.', '1010');
INSERT INTO "C##SANJU"."AUTHOR" VALUES ('1000009', 'Paulo Coelho', 'Paulo Coelho de Souza is a Brazilian lyricist and novelist. He is a member of the Brazilian Academy of Letters.', '1020');
INSERT INTO "C##SANJU"."AUTHOR" VALUES ('1000010', 'Jahanara Imam', NULL, '1015');
INSERT INTO "C##SANJU"."AUTHOR" VALUES ('1000002', 'Md. Jafar Iqbal', NULL, '1001');

-- ----------------------------
-- Primary Key structure for table AUTHOR
-- ----------------------------
ALTER TABLE "C##SANJU"."AUTHOR" ADD CONSTRAINT "AUTHOR_PK" PRIMARY KEY ("AUTHOR_ID");

-- ----------------------------
-- Checks structure for table AUTHOR
-- ----------------------------
ALTER TABLE "C##SANJU"."AUTHOR" ADD CONSTRAINT "SYS_C008114" CHECK ("AUTHOR_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##SANJU"."AUTHOR" ADD CONSTRAINT "SYS_C008115" CHECK ("AUTHOR_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table AUTHOR
-- ----------------------------
ALTER TABLE "C##SANJU"."AUTHOR" ADD CONSTRAINT "AUTHOR_ADREESS_FK" FOREIGN KEY ("ADDRESS_ID") REFERENCES "C##SANJU"."ADDRESS_DETAIL" ("ADDRESS_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
