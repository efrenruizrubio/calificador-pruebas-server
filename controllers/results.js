const resultsRouter = require('express').Router()
const pool = require('../database')

resultsRouter.get('/', async (request, response) => {
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
      appliedTest: r.TestAplicado
    }
  })

  response.status(200).json(results)
})

module.exports = resultsRouter
