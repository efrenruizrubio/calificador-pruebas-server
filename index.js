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

/* app.get('/api/results/:id', async (request, response) => {
  const id = Number(request.params.id)
  const [result] = await pool.query('SELECT * FROM Resultado WHERE id = ?', id)
  if (result.length) {
    response.status(200).json(result[0])
  } else {
    response.status(404).json({ error: `El registro con el id '${id}' no existe en la base de datos` })
  }
}) */

/*
app.delete('/api/results/:id', (request, response) => {
  const id = Number(request.params.id)
  await pool.query('DELETE FROM Paciente WHERE Email = ?', email)
  response.status(204).end()
}) */

app.use('/api/results', resultsRouter)

app.use((request, response) => {
  response.status(404).json({ error: 'Not found' })
})

app.listen(process.env.PORT, () => {
  console.log(`Server running on port ${process.env.PORT}`)
})
