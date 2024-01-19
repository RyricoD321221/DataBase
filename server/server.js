const express = require("express")
const  app = express()
const port = 3000

const clienst = [
        {
            id: 1,
            fio: "Yangirov Denis Fidanovich",
            birthday: "14-10-2005",
            adress: "I dont know",
            wife: {
             id: 2,
             fio: "its not defined"
            }
        },
        {
            id: 2,
            fio: "Kicelev Artem",
            age: 15
        }
]

app.get('/', (req, res) => {

    res.json(JSON.stringify(clienst))
})

app.listen(port, () => {
        console.log(`Мы начали прослушивать, ${port} порт. `)
})
