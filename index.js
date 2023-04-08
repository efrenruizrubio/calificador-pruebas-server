const express = require('express')
const cors = require('cors')
const resultsRouter = require('./controllers/results')

require('dotenv').config()

const app = express()

app.use(cors())
app.use(express.json())

app.get('/', (request, response) => {
  response.send('<h1>Hello World</h1>')
})

app.use('/api/results', resultsRouter)

app.use((request, response) => {
  response.status(404).json({ error: 'Not found' })
})

app.listen(process.env.PORT, () => {
  console.log(`Server running on port ${process.env.PORT}`)
})
