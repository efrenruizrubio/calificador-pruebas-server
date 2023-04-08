const resultsRouter = require('express').Router()
const pool = require('../database')

resultsRouter.get('/getCount', async (request, response) => {
  const [result] = await pool.query('SELECT COUNT(Id) FROM Resultado')

  response.status(200).json(result[0])
})

resultsRouter.post('/getAll', async (request, response) => {
  const [result] = await pool.query('SELECT * FROM Resultado')
  const [patient] = await pool.query('SELECT * FROM Paciente')

  const results = result.map((r) => {
    const p = patient.find((pf) => pf.Id === r.PacienteId)
    const obj = { id: p.Id, name: p.Name, email: p.Email, psicologoId: p.PsicologoId, age: p.Age }
    return {
      id: r.Id,
      patient: obj,
      score: r.Puntaje,
      testResults: JSON.parse(r.Respuesta),
      appliedTest: r.TestAplicado,
      status: r.Estado
    }
  })
  response.status(200).json(results).end()
})

resultsRouter.post('/newResult', async (request, response) => {
  const { name, email, age, score, testResults, appliedTest, status } = request.body
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
  if (score === undefined) {
    return response.status(400).json({
      error: 'The score of the test is missing'
    })
  }
  if (!testResults.length) {
    return response.status(400).json({
      error: 'The results of the test are missing'
    })
  }

  const [patient] = await pool.query('SELECT * FROM Paciente WHERE Email = ?', email)
  let patientId
  if (!patient[0]) {
    const [result] = await pool.query(`
    INSERT INTO Paciente (Name, Email, Age, PsicologoId) VALUES (?, ?, ?, ?)
    `, [name, email, age, 1])
    patientId = result.insertId
  } else {
    patientId = patient[0].Id
  }

  await pool.query(`
  INSERT INTO Resultado (Respuesta, PsicologoId, PacienteId, Puntaje, TestAplicado, Estado) VALUES (?, ?, ?, ?, ?, ?)
  `, [JSON.stringify(testResults), 1, patientId, score, Number(appliedTest), status])
  response.status(204).end()
})

module.exports = resultsRouter
