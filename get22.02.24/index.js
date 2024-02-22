const mysql = require("mysql2")
const express = require('express')
const app = express()
const port = 3000


const pool = mysql.createPool({
    connectionLimit: 5,
    host: "localhost",
    user: "root",
    database: "itcursi",
    password: ""
});


app.get('/Students', function (req, res) {
    pool.query("SELECT * FROM  Students" + req.params.id, (err, data) => {
        if(err) return  console.log(err);
        res.json( {
            Students: data
        });
    });
  });

  app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
  })