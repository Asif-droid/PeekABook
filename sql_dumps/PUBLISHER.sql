/*
 Navicat Premium Data Transfer

 Source Server         : Sanju
 Source Server Type    : Oracle
 Source Server Version : 190000
 Source Schema         : C##SANJU

 Target Server Type    : Oracle
 Target Server Version : 190000
 File Encoding         : 65001

 Date: 22/02/2022 20:49:51
*/


-- ----------------------------
-- Table structure for PUBLISHER
-- ----------------------------
DROP TABLE "C##SANJU"."PUBLISHER";
CREATE TABLE "C##SANJU"."PUBLISHER" (
  "PUBLISHER_ID" NUMBER VISIBLE DEFAULT "C##SANJU"."ISEQ$$_78308".nextval NOT NULL,
  "PUBLISHER_NAME" VARCHAR2(512 BYTE) VISIBLE NOT NULL,
  "PUBLISHER_SUMMARY" VARCHAR2(3000 BYTE) VISIBLE,
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
-- Records of PUBLISHER
-- ----------------------------
INSERT INTO "C##SANJU"."PUBLISHER" VALUES ('100000', 'Adarsha', NULL, '1005');
INSERT INTO "C##SANJU"."PUBLISHER" VALUES ('100001', 'Dimik Prokashoni', NULL, '1007');
INSERT INTO "C##SANJU"."PUBLISHER" VALUES ('100002', 'Jonaki Prokashoni', NULL, '1008');
INSERT INTO "C##SANJU"."PUBLISHER" VALUES ('100003', 'Sheba Prokashoni', NULL, '1010');
INSERT INTO "C##SANJU"."PUBLISHER" VALUES ('100004', 'Nandonic', NULL, '1009');
INSERT INTO "C##SANJU"."PUBLISHER" VALUES ('100005', 'Magnum Opas', NULL, '1015');
INSERT INTO "C##SANJU"."PUBLISHER" VALUES ('100006', 'Anannya', NULL, '1020');
INSERT INTO "C##SANJU"."PUBLISHER" VALUES ('100007', 'Shishu Kontho', NULL, '1005');
INSERT INTO "C##SANJU"."PUBLISHER" VALUES ('100008', 'Prothoma', 'Huge connection of books', '1123');
INSERT INTO "C##SANJU"."PUBLISHER" VALUES ('100010', 'OnnoProkash', NULL, '1004');

-- ----------------------------
-- Primary Key structure for table PUBLISHER
-- ----------------------------
ALTER TABLE "C##SANJU"."PUBLISHER" ADD CONSTRAINT "PUBLISHER_PK" PRIMARY KEY ("PUBLISHER_ID");

-- ----------------------------
-- Checks structure for table PUBLISHER
-- ----------------------------
ALTER TABLE "C##SANJU"."PUBLISHER" ADD CONSTRAINT "SYS_C008118" CHECK ("PUBLISHER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##SANJU"."PUBLISHER" ADD CONSTRAINT "SYS_C008119" CHECK ("PUBLISHER_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table PUBLISHER
-- ----------------------------
ALTER TABLE "C##SANJU"."PUBLISHER" ADD CONSTRAINT "PUBLISHER_ADREESS_FK" FOREIGN KEY ("ADDRESS_ID") REFERENCES "C##SANJU"."ADDRESS_DETAIL" ("ADDRESS_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
