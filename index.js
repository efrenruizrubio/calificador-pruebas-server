const express = require('express')
const cors = require('cors')
const mysql = require('mysql2')

require('dotenv').config()

const app = express()

app.use(cors())
app.use(express.json())

const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USERNAME,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_DATABASE
}).promise()

app.get('/', (request, response) => {
  response.send('<h1>Hello World</h1>')
})

app.get('/api/results', async (request, response) => {
  const [result] = await pool.query('SELECT * FROM Resultado')
  const [patient] = await pool.query('SELECT * FROM Paciente')

  const results = result.map((r) => {
    const p = patient.find((pf) => pf.Id === r.PacienteId)
    return {
      id: r.Id,
      patient: p,
      score: r.Puntaje,
      testResults: JSON.parse(r.Respuesta)
    }
  })

  response.status(200).json(results)
})

app.get('/api/results/:id', async (request, response) => {
  const id = Number(request.params.id)
  const [result] = await pool.query('SELECT * FROM Resultado WHERE id = ?', id)
  if (result.length) {
    response.status(200).json(result[0])
  } else {
    response.status(404).json({ error: `El registro con el id '${id}' no existe en la base de datos` })
  }
})
/*
app.delete('/api/results/:id', (request, response) => {
  const id = Number(request.params.id)
  await pool.query('DELETE FROM Paciente WHERE Email = ?', email)
  response.status(204).end()
}) */

app.post('/api/results', async (request, response) => {
  const { name, email, age, score, testResults } = request.body
  if (!name) {
    return response.status(400).json({
      error: 'The name of the patient is missing'
    })
  }
  if (!email) {
    return response.status(400).json({
      error: 'The email of the patient is missing'
    })
  }
  if (!age) {
    return response.status(400).json({
      error: 'The age of the patient is missing'
    })
  }
  if (!score) {
    return response.status(400).json({
      error: 'The score of the test is missing'
    })
  }
  if (!testResults.length) {
    return response.status(400).json({
      error: 'The results of the test is missing'
    })
  }

  const [patient] = await pool.query('SELECT * FROM Paciente WHERE Email = ?', email)
  let patientId
  if (!patient[0]) {
    console.log("doesn't exist")
    const [result] = await pool.query(`
    INSERT INTO Paciente (Name, Email, Age, PsicologoId) VALUES (?, ?, ?, ?)
    `, [name, email, age, 1])
    console.log(result)
    patientId = result.insertId
  } else {
    patientId = patient[0].Id
  }

  await pool.query(`
  INSERT INTO Resultado (Respuesta, PsicologoId, PacienteId, Puntaje) VALUES (?, ?, ?, ?)
  `, [JSON.stringify(testResults), 1, patientId, score])
  response.status(204).end()
})

app.use((request, response) => {
  response.status(404).json({ error: 'Not found' })
})

const PORT = 3001
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`)
})
