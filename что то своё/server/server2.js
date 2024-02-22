const express = require("express")
const app = express()
const port = 3000



var connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database: "sdfsdfsd"
  });
  



app.get('/clients', (req, res) => {

    connection.connect();

    connection.query('SELECT 1 + 1 AS solution', function(err, rows, fields) {
      if (err) throw err;
      console.log('The solution is: ', rows[0].solution);
    });
    
    connection.end();
    

    res.json(clients)
})

app.post('/', (req, res) => {
    res.send('hello post')  
})    
app.listen(port, () => {
    console.log(`Мы начали прослушивать ${port} порт.`)
});