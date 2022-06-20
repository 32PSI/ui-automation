require('dotenv').config()
const express = require('express')
const {portValidator} = require('port-validator');
const app = express()

let port = 3000
const envPort= parseInt(process.env.NODE_PORT)

if (process.env.NODE_PORT && portValidator(envPort).validate()===true){
  port = envPort
}

app.get('/', (req, res) => {
  res.send('Hello World !')
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})