const express = require("express")
const app = express()
const port = 3000

const client = [
    {
        id: 1,
        fullName: "Козлов Пётр Степанович",
        gender: "м",
        phoneNumber: "89937689802",
        OrderID: 1,
    },
    {
        id: 2,
        fullName: "Орехов Арсений Матвеевич",
        gender: "м",
        phoneNumber: "89986529838",
        OrderID: 2,
    },
    {
        id: 3,
        fullName: "Богомолова Ангелина Петровна",
        gender: "ж",
        phoneNumber: "89507836621",
        OrderID: 3,
    }
]

app.get('/', (req, res) => {
    res.set({
        "Content-Type": "application/json",
    })
    res.json(JSON.stringify(client))
})

app.listen(port, () => {
    console.log(`Мы начали прослушивать ${port} порт.`)
})