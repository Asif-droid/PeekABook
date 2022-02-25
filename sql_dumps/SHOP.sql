/*
 Navicat Premium Data Transfer

 Source Server         : Sanju
 Source Server Type    : Oracle
 Source Server Version : 190000
 Source Schema         : C##SANJU

 Target Server Type    : Oracle
 Target Server Version : 190000
 File Encoding         : 65001

 Date: 22/02/2022 20:50:06
*/


-- ----------------------------
-- Table structure for SHOP
-- ----------------------------
DROP TABLE "C##SANJU"."SHOP";
CREATE TABLE "C##SANJU"."SHOP" (
  "SHOP_ID" NUMBER VISIBLE DEFAULT "C##SANJU"."ISEQ$$_78314".nextval NOT NULL,
  "SHOP_NAME" VARCHAR2(512 BYTE) VISIBLE NOT NULL,
  "ADDRESS_ID" NUMBER VISIBLE,
  "CONTACT_NO" VARCHAR2(30 BYTE) VISIBLE NOT NULL,
  "EMAIL" VARCHAR2(100 BYTE) VISIBLE NOT NULL,
  "DESCRIPTION" VARCHAR2(3000 BYTE) VISIBLE,
  "TOTAL_EARNING" NUMBER VISIBLE DEFAULT 0,
  "USERNAME" VARCHAR2(200 BYTE) VISIBLE NOT NULL,
  "PASS" VARCHAR2(512 BYTE) VISIBLE NOT NULL
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
-- Records of SHOP
-- ----------------------------
INSERT INTO "C##SANJU"."SHOP" VALUES ('10000', 'Bengal Boi', '1120', '01774577852', 'bengal21@gmail.com', NULL, '1400', 'bban', '4568');
INSERT INTO "C##SANJU"."SHOP" VALUES ('10001', 'Prothoma', '1121', '01774557652', 'prothoma21@gmail.com', 'Huge and original collection of books', '200', 'psdbs', '77sd');
INSERT INTO "C##SANJU"."SHOP" VALUES ('10002', 'Green Library', '1015', '01445458452', 'green@yahoo.com', NULL, '0', 'green', 'sd54');
INSERT INTO "C##SANJU"."SHOP" VALUES ('10010', 'Batighor', '1001', '01845489542', 'bati@gmail.com', 'Asthetic place to read and buy books', '0', 'bati', 'efe478');
INSERT INTO "C##SANJU"."SHOP" VALUES ('10003', 'Pathok Somabesh', '1002', '01874454654', 'pathok@gmail.com', NULL, '100', 'pathok', '7445sd');
INSERT INTO "C##SANJU"."SHOP" VALUES ('10004', 'Zeenat Book Supplies', '1003', '01544554445', 'zeenat@email.com', 'One of the oldest, this quaint little bookstore in New Market', '0', 'zeenat', '55545');
INSERT INTO "C##SANJU"."SHOP" VALUES ('10005', 'Gyankosh', '1005', '01784548452', 'gyankosh@gmail.com', NULL, '1000', 'gyan', '78442');
INSERT INTO "C##SANJU"."SHOP" VALUES ('10006', 'Bookworm', '1006', '01844754546', 'bookworm@gmail.com', 'A sought after store by the young people, Bookworm is typically identified as the store ''Next to the Mig-21 before reaching Jahangir Gate.'' Armed with much adored ''Young Adult'' titles, best in self-help and inspirational books, and with a varied classic English selection - Bookworm is here to take care of all reading needs.', '0', 'book', '7841s');

-- ----------------------------
-- Primary Key structure for table SHOP
-- ----------------------------
ALTER TABLE "C##SANJU"."SHOP" ADD CONSTRAINT "SHOP_PK" PRIMARY KEY ("SHOP_ID");

-- ----------------------------
-- Checks structure for table SHOP
-- ----------------------------
ALTER TABLE "C##SANJU"."SHOP" ADD CONSTRAINT "SYS_C008130" CHECK ("SHOP_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##SANJU"."SHOP" ADD CONSTRAINT "SYS_C008131" CHECK ("SHOP_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##SANJU"."SHOP" ADD CONSTRAINT "SYS_C008132" CHECK ("CONTACT_NO" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##SANJU"."SHOP" ADD CONSTRAINT "SYS_C008133" CHECK ("EMAIL" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##SANJU"."SHOP" ADD CONSTRAINT "SYS_C008219" CHECK ("USERNAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##SANJU"."SHOP" ADD CONSTRAINT "SYS_C008220" CHECK ("PASS" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table SHOP
-- ----------------------------
ALTER TABLE "C##SANJU"."SHOP" ADD CONSTRAINT "SHOP_ADREESS_FK" FOREIGN KEY ("ADDRESS_ID") REFERENCES "C##SANJU"."ADDRESS_DETAIL" ("ADDRESS_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
