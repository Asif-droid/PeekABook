const morgan = require("morgan");
const express = require("express");
//const oracle=require("oracledb");

const fs = require("fs");

const router = require("express-promise-router")();
var bodyParser = require("body-parser");

const cors = require("cors"); //for cross referencing

const logger = require("./funtions");
const { json } = require("express");

//oracle.outFormat = oracle.OBJECT;

///for hbs

router.get("/employee/all", async function (req, res, next) {
  console.log("started");
  var query = "select * from employees ";
  var params = [];
  let result = await logger.log(query, params);
  //console.log(result);

  //res.sendFile(__dirname+'/front/home.html',json(result));

  res.status(200).json(result);
  //logger.log("hello")
});
router.get("/employee", async function (req, res, next) {
  //console.log(__dirname)

  console.log("started");
  var query = " SELECT  FIRST_NAME  from EMPLOYEES ";
  var params = [];
  let result = await logger.log(query, params);
  //console.log(result);

  //res.sendFile(__dirname+'/front/home.html',json(result));
  //var jr=json(result);
  //console.log(result);

  //res.status(200).json(result);

  res.render("emp", {
    d: result,
    w: [{ a: "s" }, { a: "sm" }, { a: "sa" }, { a: "se" }],
  });
});
router.get("/test", async (req, res, next) => {
  //console.log(q);
  /*var q=req.query.uname;
    var o=req.query.name;
    var query="DECLARE  BEGIN insrt('"+q+"','"+o+"');end;";
    var params=[];
    let result=await logger.log(query,params);
    console.log(o+" "+q);*/
  var q = "SELECT * from ADDRESS_DETAIL";
  var p = [];
  let r = await logger.log(q, p);
  console.log(r[0]);
  res.render("t1");
});

router.get("/last_name/highst_sal", async function (req, res, next) {
  console.log("started");
  var query =
    "  select e.last_name, d.department_name,e.salary from EMPLOYEES e join (select department_id,max(salary) mxs from EMPLOYEES group by department_id) d1 on(e.department_id=d1.department_id) join DEPARTMENTS d on(e.department_id=d.department_id) where e.salary=d1.mxs order by d1.mxs";
  var params = [];
  let result = await logger.log(query, params);
  //console.log(result);

  res.status(200).json(result);
});
router.get("/", function (req, res, next) {
  //console.log(__dirname)

  res.sendFile(__dirname + "/front/index.html");
});
router.get("/peekabook", function (req, res, next) {
  //console.log(__dirname)

  res.render("home");
});

router.get("/books", async function (req, res, next) {
  //console.log(__dirname)
  //console.log("started");
  var sid = req.query.sid;
  var s = parseInt(sid);
  var query =
    "SELECT b1.BOOK_ID,b1.BOOK_NAME,b1.PRICE_PER_BOOK FROM BOOK b1,(SELECT DISTINCT BOOK_ID FROM BOOK_COPY WHERE SHOP_ID=" +
    s +
    ") b2 WHERE b1.BOOK_ID=b2.BOOK_ID";
  var params = [];
  let result = await logger.log(query, params);
  console.log(result);

  //res.sendFile(__dirname+'/front/home.html',json(result));

  res.status(200).json(result);

  //console.log(req);
  //res.sendFile(__dirname+'/front/home.html')
});
router.get("/shops", async function (req, res, next) {
  //console.log(__dirname)
  //console.log("started");
  var query = "SELECT SHOP_ID,SHOP_NAME from SHOP";
  var params = [];
  let result = await logger.log(query, params);
  //console.log(result);

  //res.sendFile(__dirname+'/front/home.html',json(result));

  res.status(200).json(result);

  //console.log(req);
  //res.sendFile(__dirname+'/front/home.html')
});

router.get("/authors", async function (req, res, next) {
  //console.log(__dirname)
  //console.log("started");
  var query = 'SELECT "name" from "Author"';
  var params = [];
  let result = await logger.log(query, params);
  //console.log(result);

  //res.sendFile(__dirname+'/front/home.html',json(result));

  res.status(200).json(result);

  //console.log(req);
  //res.sendFile(__dirname+'/front/home.html')
});

router.get("/login", function (req, res, next) {
  res.render("login", { d: { user: "12" } });
});

router.get("/selected", function (req, res, next) {
  //res.render('t1',{d:req.params});
  var q = req.query;

  //res.status(200).json(q.shop);
  res.render("shop", { s: q });
});

router.post("/selectedbook", async function (req, res, next) {
  //res.render('t1',{d:req.params});
  var q = req.body;
  console.log(q);

  bid = parseInt(q.bookid);
  sid = parseInt(q.sid);
  uid = parseInt(q.u_id);
  pr = parseInt(q.price);
  console.log(uid);
  console.log(sid);
  console.log(bid);
  var chq =
    "SELECT * from cart_details WHERE CUSTOMER_ID=" +
    uid +
    " and BOOK_ID=" +
    bid;
  var params = [];
  let ck_result = await logger.log(chq, params);
  if (ck_result[0] == null) {
    var query =
      "INSERT INTO CART_DETAILS VALUES(" +
      bid +
      "," +
      uid +
      "," +
      sid +
      "," +
      pr +
      ")";

    let result = await logger.log(query, params);
  }

  //res.status(200).json(q.shop);
  //console.log(re);
  res.render("custpro", { d: q.u_id });
});

router.post("/createorder", async (req, res, next) => {
  var info = req.body;
  console.log(info);

  var uid = parseInt(info.uid);
  var bid = parseInt(info.bid);
  var sid = parseInt(info.sid);
  var pr = parseInt(info.price);
  var q = parseInt(info.qntyty);
  var t = pr * q;
  var params = [];
  var qr =
    "SELECT COUNT(*) QUANTITY FROM BOOK_COPY WHERE SHOP_ID=" +
    sid +
    " AND BOOK_ID=" +
    bid;
  let result = await logger.log(qr, params);
  var chq = parseInt(result[0].QUANTITY);
  if (q > chq) {
    var qr2 = "SELECT SHOP_NAME FROM SHOP WHERE SHOP_ID=" + sid;
    let shop = await logger.log(qr2, params);

    res.render("exceed", { d: q, h: chq, s: shop[0] });
  } else {
    var qery2 =
      "DECLARE BEGIN ADD_ORDER(" +
      bid +
      ", " +
      uid +
      "," +
      sid +
      "," +
      q +
      "," +
      t +
      ", '" +
      info.trn_id +
      "', '" +
      info.street +
      "', '" +
      info.thana +
      "'," +
      info.pcode +
      ", '" +
      info.dist +
      "'); END;";
    let re = await logger.log(qery2, params);
    if (uid == 0) {
      res.render("home");
    } else {
      res.render("custpro", { d: info.uid });
    }
  }
});

router.post("/clearcart", async (req, res, next) => {
  var info = req.body;
  console.log(info);

  var uid = parseInt(info.uid);
  var bid = parseInt(info.bid);

  var params = [];
  var qr =
    "DELETE from cart_details WHERE CUSTOMER_ID=" + uid + " and BOOK_ID=" + bid;
  let result = await logger.log(qr, params);
  res.render("custpro", { d: info.uid });
});

router.get("/custhome", (req, res, next) => {
  var id = req.query.id;

  res.render("custpro", { d: id });
});
router.get("/cartinfo", async (req, res, next) => {
  var id = parseInt(req.query.uid);
  console.log(id);
  var params = [];
  var qery2 =
    "SELECT b1.BOOK_NAME,b1.PRICE_PER_BOOK,b2.BOOK_ID,b2.shop_id,b2.CUSTOMER_ID,s.SHOP_NAME FROM BOOK b1 join (SELECT  BOOK_ID,shop_id,customer_id FROM Cart_details WHERE customer_ID=" +
    id +
    ") b2 on( b1.BOOK_ID=b2.BOOK_ID) join (SELECT SHOP_ID,SHOP_NAME from SHOP) s on( b2.SHOP_ID=s.SHOP_ID )";
  let re = await logger.log(qery2, params);
  res.render("cart", { d: id, cd: re });
});
router.get("/home2", async (req, res, next) => {
  var id = req.query.id;
  var q =
    "SELECT CUSTOMER_ID,FIRST_NAME FROM CUSTOMER WHERE CUSTOMER_ID =" + id;
  var params = [];
  let re = await logger.log(q, params);
  res.render("home2", { d: re[0] });
});

router.get("/customerinfo", async (req, res, next) => {
  var cid = req.query.id;
  var tmp_q =
    "SELECT (FIRST_NAME||' '||LAST_NAME) NAME FROM CUSTOMER WHERE CUSTOMER_ID=" +
    cid;
  var params = [];
  let result = await logger.log(tmp_q, params);
  res.status(200).json(result);
});

router.post("/searchbyname", async function (req, res, next) {
  var info = req.body;
  console.log(info);
  var q =
    "select book_name,book_id,price_per_book from book where upper(book_name)=upper('" +
    info.bookname +
    "')";
  var pa = [];
  let result = await logger.log(q, pa);
  console.log(result[0].PRICE_PER_BOOK);
  res.render("searchres", { s: info, b: result[0] });
});

router.get("/searchresult", async (req, res, next) => {
  var bname = req.query.name;
  var tmp_q =
    "SELECT s.SHOP_NAME,s.SHOP_ID from SHOP s join (SELECT DISTINCT SHOP_ID FROM BOOK_COPY WHERE BOOK_ID=(SELECT BOOK_ID from BOOK WHERE UPPER(BOOK_NAME)=UPPER('" +
    bname +
    "'))) s2 ON(s.SHOP_ID = s2.SHOP_ID)";
  var params = [];
  let result = await logger.log(tmp_q, params);
  console.log(result);
  res.status(200).json(result);
});
router.get("/bookcat", async function (req, res, next) {
  //console.log(__dirname)
  var info = req.query;
  var q =
    "SELECT BOOK_NAME,PRICE_PER_BOOK,BOOK_GENRE FROM BOOK WHERE UPPER(BOOK_GENRE) LIKE '%" +
    info.gn +
    "%'";
  var pa = [];
  let result = await logger.log(q, pa);

  console.log(info);
  res.render("dummy", { s: info, d: result });
  // console.log(__dirname);
});

router.get("/shoporder", async (req, res, next) => {
  var id = req.query.id;
  var tmp_q =
    "SELECT o.CUSTOMER_ID,o.ADDRESS_ID,b.BOOK_NAME,o.TRANSACTION_ID,o.QUANTITY,o.ORDER_ID,o.SHOP_ID from (SELECT BOOK_ID, QUANTITY,ORDER_ID,SHOP_ID, CUSTOMER_ID, ADDRESS_ID, TRANSACTION_ID FROM ORDERS WHERE SHOP_ID=" +
    id +
    ") o join BOOK b ON(o.BOOK_ID=b.BOOK_ID)";
  var params = [];
  let result = await logger.log(tmp_q, params);
  console.log(result);
  res.render("shoporder", { d: result });
});
router.post("/deleteorder", async (req, res, next) => {
  var info = req.body;
  console.log(info);
  var tmp_q = "delete from orders where order_id=" + info.oid;
  var params = [];
  let result = await logger.log(tmp_q, params);

  res.render("shoppro", { d: info.sid });
});

router.get("/showbooksall", async (req, res, next) => {
  var sid = req.query.id;
  var q =
    "SELECT (SELECT BOOK_NAME FROM BOOK B1 WHERE B1.BOOK_ID= B2.BOOK_ID) BOOK_NAME, COUNT(*) QUANTITY FROM BOOK_COPY B2 WHERE SHOP_ID=" +
    sid +
    " GROUP BY BOOK_ID";
  var p = [];
  let result = await logger.log(q, p);
  //console.log(result);
  res.render("shopallbooks", { d: result });
});

router.get("/bookdetail", async function (req, res, next) {
  //console.log(__dirname)
  //console.log("started");
  var info = req.query;
  var id = req.query.bookid;
  //console.log(id);
  var query =
    "SELECT AUTHOR_NAME,BOOK_NAME,BOOK_GENRE,SUMMARY,PUBLISHER_NAME FROM AUTHOR a join (SELECT BOOK_NAME,BOOK_GENRE,SUMMARY,AUTHOR_ID,PUBLISHER_ID from BOOK where BOOK_ID=" +
    id +
    ") b ON(a.AUTHOR_ID = b.AUTHOR_ID) join PUBLISHER p on(b.PUBLISHER_ID= p.PUBLISHER_ID)";
  var params = [];
  let result = await logger.log(query, params);
  //console.log(result);

  //res.sendFile(__dirname+'/front/home.html',json(result));

  //res.status(200).json(result);

  if (info.u_id == "") {
    res.render("prdet2", { i: info, d: result[0] });
  } else {
    res.render("prdet", { i: info, d: result[0] });
  }

  //console.log(req);
  //res.sendFile(__dirname+'/front/home.html')*/
});

router.get("/csignup", (req, res, next) => {
  res.render("c_signup");
});
router.get("/ssignup", (req, res, next) => {
  res.render("s_signup");
});
router.post("/cregister", async (req, res, next) => {
  var info = req.body;
  //console.log(info);
  //console.log(info.username);
  var pass = info.password[0];

  if (pass != info.password[1]) {
    res.render("c_signup", { m: "pass and confirm pass does not match " });
  } else {
    var t_q = "SELECT * from CUSTOMER WHERE PASS='" + pass + "'";

    var params = [];
    let result1 = await logger.log(t_q, params);
    //console.log(result1);
    if (result1[0] == null) {
      console.log("insert");
      //console.log(info);
      var query;

      query =
        "DECLARE BEGIN add_customer('" +
        info.fname +
        "', '" +
        info.lname +
        "', '" +
        info.mail +
        "', '" +
        info.street +
        "', '" +
        info.thana +
        "', '" +
        info.pcode +
        "', '" +
        info.dist +
        "','" +
        info.username +
        "','" +
        pass +
        "'); END;";

      let result = await logger.log(query, params);

      res.render("login");
    } else {
      res.render("c_signup", { m: "username or pass already exists" });
    }
  }
});
router.post("/stempregister", async (req, res, next) => {
  var info = req.body;
  var pass = info.password[0];
  if (pass != info.password[1]) {
    res.render("s_signup", { m: "pass and confirm pass does not match " });
  } else {
    var t_q = "SELECT SHOP_ID from SHOP WHERE PASS='" + pass + "'";

    var params = [];
    let result1 = await logger.log(t_q, params);
    if (result1[0] == null) {
      console.log("insert");
      var q =
        "INSERT into Temp_Shop (shop_name,email,street,thana,pcode,dist,username,pass,contact_no,description,trn_id) VALUES ('" +
        info.name +
        "','" +
        info.mail +
        "','" +
        info.street +
        "','" +
        info.thana +
        "','" +
        info.pcode +
        "','" +
        info.dist +
        "','" +
        info.username +
        "','" +
        pass +
        "','" +
        info.contact +
        "','" +
        info.des +
        "','" +
        info.trn_id +
        "')";
      let result = await logger.log(q, params);
      res.render("wait"); ///thanku and wait massage
    } else {
      res.render("s_signup", { m: "username or pass already exists" });
    }
  }
});
router.post("/sregister", async (req, res, next) => {
  var info = req.body;
  //console.log(info);
  //console.log(info.username);
  var pass = info.pass;

  var query;
  var params = [];

  query =
    "DECLARE BEGIN add_shop('" +
    info.name +
    "','" +
    info.mail +
    "','" +
    info.street +
    "','" +
    info.thana +
    "','" +
    info.pcode +
    "','" +
    info.dist +
    "','" +
    info.username +
    "','" +
    pass +
    "','" +
    info.contact +
    "','" +
    info.des +
    "'); END;";

  let result = await logger.log(query, params);
  var sid = parseInt(info.shopid);
  var q2 = "DELETE FROM temp_shop where t_shop_id=" + sid;
  let result2 = await logger.log(q2, params);

  res.render("adminpro", { d: 100 });
});

router.post("/loginId", async (req, res, next) => {
  //console.log(rq.u);

  var user = req.body;

  var role = user.role;
  var query;
  if (role == "customer") {
    query =
      "SELECT CUSTOMER_ID,FIRST_NAME,USERNAME FROM CUSTOMER WHERE PASS='" +
      user.pass +
      "'";
    console.log(user.pass);
  } else if (role == "admin") {
    query =
      "SELECT ADMIN_ID,NAME,USERNAME FROM ADMIN WHERE PASS='" + user.pass + "'";
    console.log(user.pass);
  } else {
    query =
      "SELECT SHOP_ID,SHOP_NAME,USERNAME FROM SHOP WHERE PASS='" +
      user.pass +
      "'";
  }

  var params = [];
  let result = await logger.log(query, params);
  //var jr=await result.json()
  var v;
  var r;

  if (result == undefined) {
    v = false;
  } else {
    r = result[0];
    console.log(r);
  }
  //console.log(r.USERNAME);
  if (r === undefined) {
    v = false;
  } else if (user.user == r.USERNAME) {
    v = true;
  } else {
    v = false;
  }

  if (v) {
    if (role == "customer") {
      ///customer page
      res.render("home2", { d: r });
    } else if (role == "admin") {
      var id = parseInt(r.ADMIN_ID);

      res.render("adminpro", { d: id });
    } else {
      ///shop page

      var shopid = parseInt(r.SHOP_ID);

      res.render("shoppro", { d: shopid });
    }
  } else {
    res.render("fail");
  }
  //res.status(200).json(req.body.user);
});

router.get("/adminshops", async (req, res, next) => {
  var tmp_q = "SELECT SHOP_ID, SHOP_NAME,TOTAL_EARNING from SHOP ";
  var params = [];
  let tm_result = await logger.log(tmp_q, params);
  console.log(tm_result);

  res.render("adminshop", { d: tm_result });
});
router.post("/admindel", async (req, res, next) => {
  var info = req.body;
  var sid = parseInt(info.shopid);
  var params = [];
  var q2 = "DELETE from shop where shop_id=" + sid;
  let result2 = await logger.log(q2, params);

  res.render("adminpro", { d: 100 });
});
router.get("/adminappro", async (req, res, next) => {
  var tmp_q = "SELECT * from temp_shop";
  var params = [];
  let tm_result = await logger.log(tmp_q, params);

  res.render("admin", { d: tm_result });
});
router.get("/shopinfo", async (req, res, next) => {
  var sid = req.query.id;
  var tmp_q = "SELECT * from SHOP where SHOP_ID=" + sid;
  var params = [];
  let result = await logger.log(tmp_q, params);
  res.status(200).json(result);
});
router.get("/admininfo", async (req, res, next) => {
  var sid = req.query.id;
  var tmp_q = "SELECT *FROM ADMIN WHERE ADMIN_ID=" + sid;
  var params = [];
  let result = await logger.log(tmp_q, params);
  res.status(200).json(result);
});
router.get("/bookform", (req, res, next) => {
  var id = req.query.id;
  res.render("bookadd", { sid: id });
});
router.post("/bookadd", async (req, res, next) => {
  var info = req.body;
  var sid = parseInt(info.sid);
  var price = parseInt(info.price);
  var qn = parseInt(info.quan);
  var pages = parseInt(info.pages);
  console.log(info);
  console.log("insert");
  var params = [];
  var q =
    "DECLARE BEGIN add_book(" +
    sid +
    ", '" +
    info.name +
    "','" +
    info.genre +
    "','" +
    info.author +
    "','" +
    info.publisher +
    "','" +
    info.lan +
    "','" +
    info.des +
    "','" +
    info.isbn +
    "'," +
    pages +
    "," +
    qn +
    ",'" +
    info.edition +
    "'," +
    price +
    "); END;";
  let result = await logger.log(q, params);

  res.render("shoppro", { d: info.sid });
});
router.get("/address", async (req, res, next) => {
  var q = parseInt(req.query.aid);
  var query =
    "SELECT a.STREET, a.THANA, a.POSTAL_CODE, d.DISTRICT_NAME from ADDRESS_DETAIL a join DISTRICT d on(a.DISTRICT_ID = d.DISTRICT_ID) WHERE a.ADDRESS_ID=" +
    q;
  var params = [];
  let result = await logger.log(query, params);
  //console.log(result);
  res.status(200).json(result);
});
router.get("/author", (req, res, next) => {
  res.render("addauthor", { d: req.query.id });
});
router.post("/authoradd", async (req, res, next) => {
  var info = req.body;
  console.log(info);
  var q =
    "DECLARE BEGIN add_author('" +
    info.name +
    "', '" +
    info.summ +
    "', '" +
    info.street +
    "', '" +
    info.thana +
    "'," +
    info.pcode +
    ", '" +
    info.dist +
    "'); END;";
  var p = [];
  let result = await logger.log(q, p);
  res.render("adminpro", { d: info.id });
});

router.get("/publisher", (req, res, next) => {
  res.render("publisheradd", { d: req.query.id });
});
router.post("/publisheradd", async (req, res, next) => {
  var info = req.body;
  console.log(info);
  var q =
    "DECLARE BEGIN add_publisher('" +
    info.name +
    "', '" +
    info.summ +
    "', '" +
    info.street +
    "', '" +
    info.thana +
    "'," +
    info.pcode +
    ", '" +
    info.dist +
    "'); END;";

  var p = [];
  let result = await logger.log(q, p);
  res.render("adminpro", { d: info.id });
});
router.get("/authorshow", async (req, res, next) => {
  var tmp_q = "SELECT * from AUTHOR";
  var params = [];
  let tm_result = await logger.log(tmp_q, params);

  res.render("authorshow", { d: tm_result });
});
router.get("/publishershow", async (req, res, next) => {
  var tmp_q = "SELECT * from PUBLISHER";
  var params = [];
  let tm_result = await logger.log(tmp_q, params);

  res.render("pubshow", { d: tm_result });
});

const verify = async (user) => {
  var query =
    " SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES WHERE EMPLOYEE_ID =" +
    user.pass;
  var params = [];
  let result = await logger.log(query, params);
  //var jr=await result.json()

  console.log(result[0].FIRST_NAME);
  if (user.user == result[0].FIRST_NAME) {
    return true;
  } else {
    return false;
  }
};

const app = express();
app.use(cors()); //cross reference
app.options("*", cors()); //cross reference

//static
app.use(express.static("front"));
app.use("./css", express.static(__dirname + "front/css"));
app.use("./js", express.static(__dirname + "front/js"));
//app.use('./css',express.static(__dirname+''))F:\databaseProject\node_project\front\css

//for hbs

app.set("view engine", "hbs");

app.use(bodyParser.urlencoded({ extended: true }));

app.use(express.json());
app.use(morgan("dev"));
app.use(router);
app.listen(8080, () => {
  console.log("listening");
});
