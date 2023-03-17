const express = require('express')
const logger = require('./loggerMiddleware')
const cors = require('cors')

const app = express()

app.use(cors())
app.use(express.json())
app.use(logger)

let results = [{
  id: 1,
  name: 'Efrén Ruíz Rubio',
  age: '23',
  score: 21,
  testResults: [
    {
      option: 'Tristeza',
      value: 1,
      index: 1
    },
    {
      option: 'Pesimismo',
      value: 1,
      index: 2
    },
    {
      option: 'Fracaso',
      value: 1,
      index: 3
    },
    {
      option: 'Pérdida de Placer',
      value: 1,
      index: 4
    },
    {
      option: 'Sentimientos de Culpa',
      value: 1,
      index: 5
    },
    {
      option: 'Sentimientos de Castigo',
      value: 1,
      index: 6
    },
    {
      option: 'Disconformidad con uno mismo',
      value: 1,
      index: 7
    },
    {
      option: 'Autocrítica',
      value: 1,
      index: 8
    },
    {
      option: 'Pensamientos o Deseos Suicidas',
      value: 1,
      index: 9
    },
    {
      option: 'Llanto',
      value: 1,
      index: 10
    },
    {
      option: 'Agitación',
      value: 1,
      index: 11
    },
    {
      option: 'Pérdida de Interés',
      value: 1,
      index: 12
    },
    {
      option: 'Indecisión',
      value: 1,
      index: 13
    },
    {
      option: 'Desvalorización',
      value: 1,
      index: 14
    },
    {
      option: 'Pérdida de Energía',
      value: 1,
      index: 15
    },
    {
      option: 'Cambios en los Hábitos de Sueño',
      value: 1,
      index: 16
    },
    {
      option: 'Irritabilidad',
      value: 1,
      index: 17
    },
    {
      option: 'Cambios en el Apetito',
      value: 1,
      index: 18
    },
    {
      option: 'Dificultad de Concentración',
      value: 1,
      index: 19
    },
    {
      option: 'Cansancio o Fatiga',
      value: 1,
      index: 20
    },
    {
      option: 'Pérdida de Interés en el Sexo',
      value: 1,
      index: 21
    }
  ]
}]

app.get('/', (request, response) => {
  response.send('<h1>Hello World</h1>')
})

app.get('/api/results', (request, response) => {
  response.json(results)
})

app.get('/api/results/:id', (request, response) => {
  const id = Number(request.params.id)
  const result = results.find((result) => result.id === id)
  if (result) {
    response.send(result)
  } else {
    response.status(404).end()
  }
})

app.delete('/api/results/:id', (request, response) => {
  const id = Number(request.params.id)
  results = results.filter((result) => result.id !== id)
  response.status(204).end()
})

app.post('/api/results', (request, response) => {
  console.log(request.body)
  const { name, age, score, testResults } = request.body
  if (!name) {
    return response.status(400).json({
      error: 'The name of the patient is missing'
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
  const id = Math.max(...results.map((result) => result.id)) + 1
  const newResult = {
    id,
    name,
    age,
    score,
    testResults
  }

  results = [...results, newResult]

  response.status(201).json(newResult)
})

app.use((request, response) => {
  response.status(404).json({ error: 'Not found' })
})

const PORT = 3001
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`)
})
