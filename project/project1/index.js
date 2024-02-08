const mysql = require("mysql2")
const express = require('express')
const app = express()
const port = 3000


const pool = mysql.createPool({
    connectionLimit: 5,
    host: "localhost",
    user: "root",
    database: "sdfsdfsd",
    password: ""
});


app.get('/students', function (req, res) {
    pool.query("SELECT * FROM students", (err, data) => {
        if(err) return  console.log(err);
        res.json( {
            students: data
        });
    });
  });

  app.post('/students', function (req, res) {
    pool.query("INSERT into students values" (err, data) => {
        if(err) return  console.log(err);
        res.json("Студент Добавлен")
    });
  });

  app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
  })