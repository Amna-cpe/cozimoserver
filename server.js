const mysql = require("mysql");
const express = require("express");
const bodyParser = require("body-parser");
const bcrypt = require("bcrypt");
const cors = require("cors");
const db = mysql.createPool({
  host: "localhost",
  user: "root",
  password: "root",
  database: "cozimo",
});
var app = express();
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cors());
app.use(express.json());

app.get("/", (req, res) => {
  //send to the fronnt end
  //req when try to get something from the front end
  db.query(
    "insert into test (id,name_test) values (123,'aaaa')",
    (err, ress) => {
      res.send({ table: "amamna" });
    }
  );
});

app.get("/books", (req, res) => {
  const userID = req.body.userID;

  db.query("select * from books", (err, ress) => {
    if (err) {
      console.log(err);
    } else {
      res.send(ress);
    }
  });
});

app.post("/cartbooks", (req, res) => {
  const userID = req.body.userID;

  db.query(
    `select books.Book_img , books.BookAuthor, books.BookID ,books.BookName ,
   books.Description ,books.price , books.Rating 
   from  cart inner join cart_books on cart.cartID = cart_books.cartID 
   inner join books on books.BookID = cart_books.BookID
   where cart_books.cartID=${userID}`,
    (err, ress) => {
      if (err) {
        console.log(err);
      } else {
        res.send(ress);
      }
    }
  );
});

app.post("/wlbooks", (req, res) => {
  const userID = req.body.userID;

  db.query(
    `select books.Book_img , books.BookAuthor, books.BookID ,books.BookName ,
   books.Description ,books.price , books.Rating 
   from  wishlist inner join wl_books on wishlist.wishlistID = wl_books.wishlistID 
   inner join books on books.BookID = wl_books.BookID
   where wl_books.wishlistID=${userID}`,
    (err, ress) => {
      if (err) {
        console.log(err);
      } else {
        res.send(ress);
      }
    }
  );
});

app.get("/science", (req, res) => {
  const catID = res.req.catID;
  const some = `select * from books where CategoryID=25`;
  db.query(some, (err, ress) => {
    console.log(ress);
    res.send(ress);
  });
});

app.post("/category", (req, res) => {
  const category = req.body.category;
  console.log(category);
  const some = `select * from category right join books on books.CategoryID= category.categoryID
   where categoryName='${category}'`;
  db.query(some, (err, ress) => {
    res.send(ress);
  });
});

app.post("/search", (req, res) => {
  console.log(req.body.search);
  const search = req.body.search;
  const some = `select * from books where BookName='${search}'`;
  db.query(some, (err, ress) => {
    console.log(ress);
    res.send(ress);
  });
});

app.post("/api/add", (req, res) => {
  const id = req.body.id;
  const name = req.body.name;
  console.log("id", id);
  console.log("in boddtt", req.body);
  db.query(
    "insert into test (id,name_test) values (?,?)",
    [id, name],
    (err, ress) => {
      console.log(ress);
      res.send("mmm");
    }
  );
});

app.post("/signup", (req, res) => {
  const newUser = {
    email: req.body.email,
    password: req.body.password,
    confirmPassword: req.body.confirmPassword,
    firstName: req.body.firstName,
    lastName: req.body.lastName,
  };
  let hashPassword = bcrypt.hashSync(newUser.password, 10);
  const queryE = `insert into wishlist  values()`;
  db.query(queryE);
  const queryCart = `insert into cart  values()`;
  db.query(queryCart);

  const queryEE = `insert into customer (fname,lname,email,password) 
  values('${newUser.firstName}','${newUser.lastName}',
  '${newUser.email}','${hashPassword}')`;
  db.query(queryEE, (err, ress) => {
    res.send({ fname: newUser.firstName, lname: newUser.lastName });
  });
});

//LOGIN
app.post("/login", (req, res) => {
  const user = {
    email: req.body.email,
    password: req.body.password,
  };

  const queryEE = `select password from customer where email='${user.email}'`;
  let hashPassword;
  db.query(queryEE, (err, ress) => {
    if (err) console.log(err);
    console.log("supposed to " + ress[0].password);
    hashPassword = ress[0].password;
    if (bcrypt.compareSync(user.password, hashPassword)) {
      const q = `select fname,lname,cid from customer where email='${user.email}'`;
      db.query(q, (err2, ress2) => {
        res.send(ress2);
      });
    } else {
      // Passwords don't match
      res.send(false);
    }
  });
});

//ADD TO CART
app.post("/addTocart", (req, res) => {
  let bookID = req.body.bookID;
  let userID = req.body.userID;
  console.log("boks " + bookID, userID);
  const queryEE = `select cartID from customer_info where cid='${userID}'`;

  db.query(queryEE, (err, ress) => {
    if (err) console.log(err);
    console.log("supposed to " + ress[0].cartID);
    let cartID = ress[0].cartID;
    const queryINCart = `insert into cart_books(cartID,BookID) values('${cartID}','${bookID}')`;
    db.query(queryINCart, (err2, ress2) => {
      if (err2) console.log(err2);

      const qc = `SELECT totalprice from  cart where cartID= '${cartID}'`;
      db.query(qc, (err3, ress3) => {
        res.send(ress3);
      });
    });
  });
});

//ADD TO WL
app.post("/addTowl", (req, res) => {
  let bookID = req.body.bookID;
  let userID = req.body.userID;
  console.log("boks " + bookID, userID);
  const queryEE = `select wishlistID from customer_info where cid='${userID}'`;

  db.query(queryEE, (err, ress) => {
    if (err) console.log(err);
    console.log("supposed to " + ress[0].wishlistID);
    let wishlistID = ress[0].wishlistID;
    const queryINCart = `insert into wl_books(wishlistID,BookID) values('${wishlistID}','${bookID}')`;
    db.query(queryINCart, (err2, ress2) => {
      if (err2) console.log(err2);
      res.send("ok");
    });
  });
});

//delet from CART
app.post("/deleteFromcart", (req, res) => {
  let bookID = req.body.bookID;
  let userID = req.body.userID;
  console.log("vokks", bookID, userID);

  const queryINCart = `delete from cart_books where cartID='${userID}' and BookID='${bookID}'`;
  db.query(queryINCart, (err2, ress2) => {
    if (err2) console.log(err2);
    res.send("ok");
  });
});

//delet from wl
app.post("/deleteFromWl", (req, res) => {
  let bookID = req.body.bookID;
  let userID = req.body.userID;
  console.log("vokks", bookID, userID);

  const queryINCart = `delete from wl_books where wishlistID='${userID}' and BookID='${bookID}'`;
  db.query(queryINCart, (err2, ress2) => {
    if (err2) console.log(err2);
    res.send("ok");
  });
});

//totprice
app.post("/gettotal", (req, res) => {
  const cartID = req.body.userID;
  const qc = `SELECT totalprice from  cart where cartID= '${cartID}'`;
  db.query(qc, (err3, ress3) => {
    res.send(ress3);
  });
});

//ADD CUSTOMER INFO

app.post("/addInfo", (req, res) => {
  const newUser = {
    city: req.body.city,
    country: req.body.country,
    PhoneNum: req.body.PhoneNum,
    address: req.body.address,
    postalCode: req.body.postalCode,
    cid: req.body.cid,
  };

  console.log(newUser.cid);
  const queryEE = `update customer_info set city='${newUser.city}',address='${newUser.address}'
  ,phnum='${newUser.PhoneNum}',country='${newUser.country}',postalcoode='${newUser.postalCode}'
  where cid = '${newUser.cid}'
  `;
  db.query(queryEE, (err, ress) => {
    res.send("od");
  });
});

//ADD BILLING INFO
app.post("/addBillingInfo", (req, res) => {
  const newUser = {
    ccexp: req.body.ccexp,
    ccnum: req.body.ccnum,
    cid: req.body.cid,
  };
  //SELECT CURDATE();

  const queryEE = `insert into billinginfo (Bdate,ccexp,ccnum,ccid,cid) 
  values(( SELECT CURDATE() ),( STR_TO_DATE('${newUser.ccexp}','%d,%m,%Y')),
  '${newUser.ccnum}','${newUser.cid}','${newUser.cid}')
  `;
  db.query(queryEE, (err, ress) => {
    res.send("od");
  });
});

//ADD ORDER
app.post("/order", (req, res) => {
  const newUser = {
    ccexp: req.body.ccexp,
    cid: req.body.cid,
  };
  console.log(newUser.cid);
  const queryEE = `select bid from billinginfo where cid='${newUser.cid}'`;
  db.query(queryEE, (err, ress) => {
    console.log(ress[0].bid);

    const queryE = `insert into orders (odate,ccexp,cid,Bid) 
      values(( SELECT CURDATE() ),( STR_TO_DATE('${newUser.ccexp}','%d,%m,%Y') ),
      '${newUser.cid}','${ress[0].bid}')`;
    if (err) {
      console.log("err1", err);
    }
    db.query(queryE, (err3, res3) => {
      if (err3) {
        console.log(err3);
      }
      res.send("okay");
    });
  });
});

//ADD ORDER_Books
app.post("/orderBooks", (req, res) => {
  cid = req.body.cid;

  const queryEE = `select oid from orders where cid='${cid}'`;
  db.query(queryEE, (err, ress) => {
    const queryE = `insert into orders_books(BookID,oid) 
                  select BookID,oid from cart_books where cartID=${cid}`;

    res.send("okk");
  });
});

app.listen(3001, () => {
  console.log("running o nport 3001");
});
