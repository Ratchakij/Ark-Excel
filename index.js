const express = require("express");
const mysql = require("mysql");
const crypto = require("crypto");
const cookieSession = require("cookie-session");
const multer = require("multer");
const path = require("path");
const fs = require("fs");
const upload = multer({ dest: 'temp/' });

const password_salt = "secret";
const app = express();
// ================================================================
// console.log("__dirname: " + __dirname + "\n");
// console.log("typeof: " + typeof multer);
// console.log(multer.toString());
// console.log(upload);
// console.log(Object.keys(upload));
// console.log(Object.values(upload));

// for (const [keys, values] of Object.entries(upload)) {
//   console.log(keys, values);
// }

// for (const key in upload) {
//     const value = upload[key];
//     const item = upload[value];
//     console.log("key: "+key);
//     console.log("value: ");
//     console.log(value);
//     console.log("item: "+item);
//     console.log(key, value);
//     console.log("key: " + key+", ", "value: " + value+", ", "item:" + item);
// }
// ================================================================
app.set("view engine", "ejs");
app.set("views", "views");

app.use("/css", express.static(__dirname + "/css"));
app.use("/js", express.static(__dirname + "/js"));
app.use("/property", express.static(__dirname + "/property"));

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.use(
    cookieSession({
        name: "session",
        keys: ["key1", "key2"],
        maxAge: 24 * 60 * 60 * 1000,
    })
);

function connection() {
    let conn = mysql.createConnection({
        host: "localhost",
        port: 3307,
        user: "root",
        password: "",
        database: "property",
    });
    return conn;
}

function showMessage(msg) {
    return `
    <h1>${msg}</h1>
    <button class="btn btn-success" onclick="window.history.back();">Back</button>
    `;
}

app.get("/", (req, res) => {
    res.render("property_view", { items: [] });
});

app.get("/search", (req, res) => {
    let conn = connection();
    let keyword = req.query.keyword || "";
    let sql = ` SELECT * FROM w701_test_properties 
                WHERE real_estate_name LIKE ?
                OR LOCATION LIKE ?  `;

    conn.connect((err) => {
        if (err) throw err;

        conn.query(sql, [`%${keyword}%`, `%${keyword}%`], (err, result, fields) => {
            if (err) throw err;

            // forEach()
            result.forEach((el) => {
                console.log(el.real_estate_name);
            });

            // Process the result
            res.status(200);
            res.render("property_view", { items: result });

            // Close the database connection
            conn.end((err) => { if (err) throw err; });
        });
    });
});

app.get("/property_detail/:id", (req, res) => {
    let conn = connection();

    let id = req.params.id || 0;

    conn.connect((err) => {
        if (err) throw err;

        let sql = `SELECT * FROM w701_test_properties WHERE id = ?`;
        conn.query(sql, [id], (err, result, fields) => {
            if (err) throw err;

            // for of
            for (const [index, item] of result.entries()) {
                console.log(item);
            }

            // Process the result
            res.status(200);
            res.render("property_detail", { item: result[0] });

            // Close the database connection
            conn.end((err) => { if (err) throw err; });
        });
    });
});

app.get("/login", (req, res) => {
    let password_wrong = req.query.password;
    if (password_wrong) {
        password_wrong = true;
    } else password_wrong = false;

    res.render("login", { password_wrong: password_wrong });
});
app.post("/login", (req, res) => {
    let conn = connection();

    let user = req.body.email || "";
    let password = req.body.password || "";

    conn.connect((err) => {
        if (err) throw err;
        const hash = crypto
            .createHash("sha256")
            .update(password + password_salt)
            .digest("base64");
        console.log(hash);

        let sql = `SELECT * FROM users WHERE email = ? AND password = ?`;
        conn.query(sql, [user, hash], (err, result, fields) => {
            if (err) throw err;
            if (result.length > 0) {
                req.session.userName = result[0].name;
                req.session.userRole = result[0].role;
                req.session.userEmail = result[0].email;
                res.redirect("/dashboard");
            } else {
                res.redirect("/login?password=wrong");
            }

            // Close the database connection
            conn.end((err) => { if (err) throw err; });
        });
    });
});

app.get("/logout", (req, res) => {
    req.session = null;
    res.redirect("/");
});

app.get("/register", (req, res) => {
    let email_wrong = req.query.email;
    if (email_wrong) {
        email_wrong = true;
    } else email_wrong = false;

    res.render("register", { email_wrong: email_wrong });
});

app.post("/register", (req, res) => {
    let conn = connection();

    let email = req.body.email;
    let password = req.body.password;
    let name = req.body.name;
    let phone = req.body.phone;

    conn.connect((err) => {
        if (err) throw err;
        let sqlCheck = `SELECT count(*) AS count FROM users WHERE email = ?`;
        conn.query(sqlCheck, [email], (err, result, fields) => {
            if (err) throw err;
            console.log(result);
            if (result[0].count > 0) {
                res.redirect("/register?email=wrong");
                return;
            }
            let sql = `INSERT INTO users (email, password, name, phone,  role) VALUES (?, ?, ?, ?, 'user')`;

            const hash = crypto
                .createHash("sha256")
                .update(password + password_salt)
                .digest("base64");
            console.log(hash);
            conn.query(sql, [email, hash, name, phone], (err, result, fields) => {
                if (err) throw err;

                //   for (const [keys, values] of Object.entries(result)) {
                //     console.log(keys, values);
                //   }

                //   for (const key in req) {
                //     const value = req[key];
                //     console.log(key, value);
                //   }

                // Process the result
                res.status(200).send(`
                    <h1>Register Success</h1>
                    <a href='/login'>Login</a>
                `);

                // Close the database connection
                conn.end((err) => { if (err) throw err; });
            });
        });
    });
});

app.get("/dashboard", (req, res) => {
    if (req.session.userName != undefined) {
        res.render("dashboard/index", {
            name: req.session.userName,
            role: req.session.userRole,
        });
    } else res.redirect("/login");
});

app.get("/dashboard/user", (req, res) => {
    if (req.session.userName != undefined) {
        let conn = connection();
        conn.connect((err) => {
            if (err) throw err;
            let email = req.session.userEmail;
            let sql = "";
            if (req.session.userRole == "admin") {
                sql = `SELECT * FROM users ORDER BY id`;
            } else {
                sql = `SELECT * FROM users WHERE email = ? ORDER BY id`;
            }
            conn.query(sql, [email], (err, result, fields) => {
                if (err) throw err;

                console.log(JSON.stringify(result, null, 2));
                res.status(200);
                res.render("dashboard/user_manager", {
                    users: result,
                });
                conn.end((err) => { if (err) throw err; });
            });
        });
    } else res.redirect("/login");
});

app.post("/dashboard/edit", (req, res) => {
    if (req.session.userName != undefined) {
        let conn = connection();
        conn.connect((err) => {
            if (err) throw err;
            let newRole = req.body.newRole || "";
            let id = req.body.id || "";

            let sql = "UPDATE users SET role = ? WHERE id = ?";
            conn.query(sql, [newRole, id], (err, result, fields) => {
                if (err) throw err;

                res.status(200).send(showMessage("Edit Success"));
                conn.end((err) => { if (err) throw err; });
            });
        });
    } else res.redirect("/login");
});

app.get("/dashboard/property", (req, res) => {
    if (req.session.userName != undefined) {
        let conn = connection();
        conn.connect((err) => {
            if (err) throw err;
            let sql = `SELECT * FROM w701_test_properties ORDER BY id`;
            conn.query(sql, [], (err, result, fields) => {
                if (err) throw err;
                // console.log(JSON.stringify(result, null, 2));
                res.render("dashboard/property_manage", {
                    properties: result,
                });

                conn.end((err) => { if (err) throw err; });
            });
        });
    } else res.redirect("/login");
});

app.get("/dashboard/property/edit", (req, res) => {
    if (req.session.userName != undefined) {
        let conn = connection();
        conn.connect((err) => {
            if (err) throw err;
            let id = req.query.id || "";
            // console.log("id: " + id);
            let sql = `SELECT * FROM w701_test_properties WHERE id = ? ORDER BY id`;
            conn.query(sql, [id], (err, result, fields) => {
                if (err) throw err;
                // console.log(JSON.stringify(result, null, 2));
                
                res.render("dashboard/property_manage_edit", {
                    item: result[0],
                });

                conn.end((err) => { if (err) throw err; });
            });
        });
    } else res.redirect("/login");
});

let fileNameToUpload = [{ name: 'image', maxCount: 5 }];
app.post("/dashboard/property/edit", upload.fields(fileNameToUpload), (req, res) => {
    if (req.session.userName != undefined) {

        let canUseImg = [true, true, true, true, true];
        for (let i = 0; i < req.files.image.length; i++) {
            const tempPath = req.files.image[i].path;
            const targetPath = path.join(__dirname, "./property/" + req.files.image[i].originalname);

            if (path.extname(req.files.image[i].originalname).toLowerCase() === ".png" ||
                path.extname(req.files.image[i].originalname).toLowerCase() === ".jpg" ||
                path.extname(req.files.image[i].originalname).toLowerCase() === ".jpeg") {

                fs.rename(req.files.image[i].path, targetPath, err => {
                    if (err) return handleError(err, res);

                    // res
                    //     .status(200)
                    //     .contentType("text/plain")
                    //     .end("File uploaded!");
                });
            } else {
                fs.unlink(tempPath, err => {
                    if (err) return handleError(err, res);
                    canUseImg[i] = false;

                    // res
                    //     .status(403)
                    //     .contentType("text/plain")
                    //     .end("For .png, .jpg, .jpeg files are allowed!");
                });
            }
        }

        if (!canUseImg[0]) req.files.image[0].originalname == "";
        if (!canUseImg[1]) req.files.image[0].originalname == "";
        if (!canUseImg[2]) req.files.image[0].originalname == "";
        if (!canUseImg[3]) req.files.image[0].originalname == "";
        if (!canUseImg[4]) req.files.image[0].originalname == "";
        
        let values = [
            req.body.real_estate_name,
            req.body.lat,
            req.body.lon,
            req.body.LOCATION,
            req.body.property_type,
            req.body.TRANSACTION,
            req.body.SALE_TERMS,
            req.body.SALE_PRICE,
            req.body.RENT_PRICE,
            req.body.COMMON_CHARGES,
            req.body.DECORATION_STYLE,
            req.body.BEDROOMS,
            req.body.BATHROOMS,
            req.body.DIRECTION_OF_ROOM,
            req.body.UNIT_SIZE,
            req.body.LAND_AREA,
            req.body.INROOM_FACILITIES,
            req.body.PUBLIC_FACILITIES,
            req.files.image[0].originalname,
            req.files.image[1].originalname,
            req.files.image[2].originalname,
            req.files.image[3].originalname,
            req.files.image[4].originalname,
            req.body.id
        ];

        console.log("values:");
        console.log(values);

        let conn = connection();
        conn.connect((err) => {
            if (err) throw err;

            let sql = `
            UPDATE w701_test_properties SET 
            real_estate_name = ?,
            lat = ?,
            lon = ?,
            LOCATION = ?,
            property_type = ?,
            TRANSACTION = ?,
            SALE_TERMS = ?,
            SALE_PRICE = ?,
            RENT_PRICE = ?,
            COMMON_CHARGES = ?,
            DECORATION_STYLE = ?,
            BEDROOMS = ?,
            BATHROOMS = ?,
            DIRECTION_OF_ROOM = ?,
            UNIT_SIZE = ?,
            LAND_AREA = ?,
            INROOM_FACILITIES = ?,
            PUBLIC_FACILITIES = ?,
            image_01 = ?,
            image_02 = ?,
            image_03 = ?,
            image_04 = ?,
            image_05 = ? WHERE id = ?
            `;
            conn.query(sql, values, (err, result, fields) => {
                if (err) throw err;
                res.redirect("/dashboard/property");
                conn.end((err) => { if (err) throw err; });
            });
        });
    } else res.redirect("/login");
});

app.listen(3000, () => console.log("app listening on port 3000..."));
