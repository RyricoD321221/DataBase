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


app.delete('/Students', function (req, res) {
    pool.query("DELETE * FROM `Students` where `gender`= 'Man' ", (err, data) => {
        if(err) return  console.log(err);
        res.json( {
            Students: data
        });
    });
  });

  app.get('/Teacher', function (req, res) {
    pool.query("SELECT * FROM Teacher", (err, data) => {
        if(err) return  console.log(err);
        res.json( {
            Teacher: data
        });
    });
  });

  app.get('/Format', function (req, res) {
    pool.query("SELECT * FROM Format", (err, data) => {
        if(err) return  console.log(err);
        res.json( {
            Format: data
        });
    });
  });

  app.get('/Groups', function (req, res) {
    pool.query("SELECT * FROM Groups", (err, data) => {
        if(err) return  console.log(err);
        res.json( {
          Groups: data
        });
    });
  });

  app.post("/Students", )



  app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
  })