/*
 Navicat Premium Data Transfer

 Source Server         : Sanju
 Source Server Type    : Oracle
 Source Server Version : 190000
 Source Schema         : C##SANJU

 Target Server Type    : Oracle
 Target Server Version : 190000
 File Encoding         : 65001

 Date: 25/02/2022 23:33:17
*/


-- ----------------------------
-- Table structure for ADMIN
-- ----------------------------
DROP TABLE "C##SANJU"."ADMIN";
CREATE TABLE "C##SANJU"."ADMIN" (
  "ADMIN_ID" NUMBER VISIBLE DEFAULT "C##SANJU"."ISEQ$$_79490".nextval NOT NULL,
  "NAME" VARCHAR2(100 BYTE) VISIBLE NOT NULL,
  "USERNAME" VARCHAR2(100 BYTE) VISIBLE,
  "PASS" VARCHAR2(100 BYTE) VISIBLE
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
-- Records of ADMIN
-- ----------------------------
INSERT INTO "C##SANJU"."ADMIN" VALUES ('1', 'Sushmoy', 'alkilite', '456');

-- ----------------------------
-- Primary Key structure for table ADMIN
-- ----------------------------
ALTER TABLE "C##SANJU"."ADMIN" ADD CONSTRAINT "ADMIN_PK" PRIMARY KEY ("ADMIN_ID");

-- ----------------------------
-- Checks structure for table ADMIN
-- ----------------------------
ALTER TABLE "C##SANJU"."ADMIN" ADD CONSTRAINT "SYS_C008308" CHECK ("ADMIN_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "C##SANJU"."ADMIN" ADD CONSTRAINT "SYS_C008309" CHECK ("NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
