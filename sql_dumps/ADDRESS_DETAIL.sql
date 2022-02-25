/*
 Navicat Premium Data Transfer

 Source Server         : Sanju
 Source Server Type    : Oracle
 Source Server Version : 190000
 Source Schema         : C##SANJU

 Target Server Type    : Oracle
 Target Server Version : 190000
 File Encoding         : 65001

 Date: 22/02/2022 20:48:55
*/


-- ----------------------------
-- Table structure for ADDRESS_DETAIL
-- ----------------------------
DROP TABLE "C##SANJU"."ADDRESS_DETAIL";
CREATE TABLE "C##SANJU"."ADDRESS_DETAIL" (
  "ADDRESS_ID" NUMBER VISIBLE DEFAULT "C##SANJU"."ISEQ$$_78295".nextval NOT NULL,
  "STREET" VARCHAR2(512 BYTE) VISIBLE,
  "THANA" VARCHAR2(512 BYTE) VISIBLE,
  "POSTAL_CODE" VARCHAR2(30 BYTE) VISIBLE,
  "DISTRICT_ID" NUMBER VISIBLE
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
-- Records of ADDRESS_DETAIL
-- ----------------------------
INSERT INTO "C##SANJU"."ADDRESS_DETAIL" VALUES ('1100', 'nowayhome', 'spiderman', '2022', '117');
INSERT INTO "C##SANJU"."ADDRESS_DETAIL" VALUES ('1101', 'sb', 'borguna', '1223', '1006');
INSERT INTO "C##SANJU"."ADDRESS_DETAIL" VALUES ('1102', 'kalidash len', 'koilash', '5422', '1009');
INSERT INTO "C##SANJU"."ADDRESS_DETAIL" VALUES ('1120', 'Neelkhet', 'New Market', '1332', '117');
INSERT INTO "C##SANJU"."ADDRESS_DETAIL" VALUES ('1121', 'Shahbag', 'New Market', '1345', '117');
INSERT INTO "C##SANJU"."ADDRESS_DETAIL" VALUES ('1140', 'Nobinagar', 'Hoogly', '1245', '1120');
INSERT INTO "C##SANJU"."ADDRESS_DETAIL" VALUES ('1160', 'Borogurgola', 'Dinajpur', '741157', '152');
INSERT INTO "C##SANJU"."ADDRESS_DETAIL" VALUES ('1122', 'dhanmondi-32', 'dhanmondi', '4577', '117');
INSERT INTO "C##SANJU"."ADDRESS_DETAIL" VALUES ('1025', 'exeter', 'new hamp', '4551', '100');
INSERT INTO "C##SANJU"."ADDRESS_DETAIL" VALUES ('1000', 'elephant road', 'Dhamrai', '1206', '117');
INSERT INTO "C##SANJU"."ADDRESS_DETAIL" VALUES ('1001', 'road #1, plot #5, dhanmondi r/a', 'Dhanmondi', '1351', '117');
INSERT INTO "C##SANJU"."ADDRESS_DETAIL" VALUES ('1002', 'rankin street', 'Gulshan', '1209', '117');
INSERT INTO "C##SANJU"."ADDRESS_DETAIL" VALUES ('1003', 'aziz co-oerative housing society', 'Lalbag', '1212', '117');
INSERT INTO "C##SANJU"."ADDRESS_DETAIL" VALUES ('1004', 'lake circus kalabagan, mirpur road', 'Mirpur', '1232', '117');
INSERT INTO "C##SANJU"."ADDRESS_DETAIL" VALUES ('1005', '511/c', 'Khilgaon', '1242', '117');
INSERT INTO "C##SANJU"."ADDRESS_DETAIL" VALUES ('1006', ' 2 new eskaton road', 'Khilkhet', '1217', '117');
INSERT INTO "C##SANJU"."ADDRESS_DETAIL" VALUES ('1007', 'shazer maya 1/7b, shahjahan road', 'Mohammadpur', '1312', '117');
INSERT INTO "C##SANJU"."ADDRESS_DETAIL" VALUES ('1008', 'arambag', 'Motijheel', '1350', '117');
INSERT INTO "C##SANJU"."ADDRESS_DETAIL" VALUES ('1009', 'sheltech, 11', 'Nawabganj', '1236', '117');
INSERT INTO "C##SANJU"."ADDRESS_DETAIL" VALUES ('1010', 'addin women''s medical college, 2', 'Dohar', '1331', '117');
INSERT INTO "C##SANJU"."ADDRESS_DETAIL" VALUES ('1011', 'doctor''s hostel', 'Palton', '1236', '117');
INSERT INTO "C##SANJU"."ADDRESS_DETAIL" VALUES ('1012', 'maradia koborastan road', 'Savar', '1245', '117');
INSERT INTO "C##SANJU"."ADDRESS_DETAIL" VALUES ('1013', 'road # 28, sector # 7', 'Uttara', '1478', '117');
INSERT INTO "C##SANJU"."ADDRESS_DETAIL" VALUES ('1014', 'maternal & child health training institute', 'Bhanga', '1310', '117');
INSERT INTO "C##SANJU"."ADDRESS_DETAIL" VALUES ('1015', 'munshipara', 'Kotwali', '2454', '152');
INSERT INTO "C##SANJU"."ADDRESS_DETAIL" VALUES ('1016', 'borogurgola', 'Kotwali', '4511', '152');
INSERT INTO "C##SANJU"."ADDRESS_DETAIL" VALUES ('1017', 'rangpur medical college', 'sadar', '5400', '158');
INSERT INTO "C##SANJU"."ADDRESS_DETAIL" VALUES ('1018', 'station road', 'satkania', '1245', '109');
INSERT INTO "C##SANJU"."ADDRESS_DETAIL" VALUES ('1019', 'majar road', 'saturia', '3254', '109');
INSERT INTO "C##SANJU"."ADDRESS_DETAIL" VALUES ('1020', 'park street', 'mirsorai', '7522', '109');
INSERT INTO "C##SANJU"."ADDRESS_DETAIL" VALUES ('1021', 'patenga', 'kotwali', '2155', '109');
INSERT INTO "C##SANJU"."ADDRESS_DETAIL" VALUES ('1022', 'dosh mile', 'chadgonj', '7855', '152');
INSERT INTO "C##SANJU"."ADDRESS_DETAIL" VALUES ('1023', 'terminal road', 'ranigonj', '4125', '152');
INSERT INTO "C##SANJU"."ADDRESS_DETAIL" VALUES ('1024', '3/4/b-a agasadek road', 'ranipur', '1254', '152');
INSERT INTO "C##SANJU"."ADDRESS_DETAIL" VALUES ('1123', 'shahbag', 'zero point', '1422', '117');

-- ----------------------------
-- Primary Key structure for table ADDRESS_DETAIL
-- ----------------------------
ALTER TABLE "C##SANJU"."ADDRESS_DETAIL" ADD CONSTRAINT "ADDRESS_DETAIL_PK" PRIMARY KEY ("ADDRESS_ID");

-- ----------------------------
-- Checks structure for table ADDRESS_DETAIL
-- ----------------------------
ALTER TABLE "C##SANJU"."ADDRESS_DETAIL" ADD CONSTRAINT "SYS_C008099" CHECK ("ADDRESS_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table ADDRESS_DETAIL
-- ----------------------------
ALTER TABLE "C##SANJU"."ADDRESS_DETAIL" ADD CONSTRAINT "ADDRESS_DETAIL_DISTRICT_FK" FOREIGN KEY ("DISTRICT_ID") REFERENCES "C##SANJU"."DISTRICT" ("DISTRICT_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
