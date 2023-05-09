const express = require('express')
const mongoose = require('mongoose')
const path = require('path')
const routes = require('./routes/note.routes')
const cors = require('cors')

const app = express()
const port = process.env.PORT ?? 5000

app.use(cors())
app.use(express.json({ extended: true }))
app.use('/api/note', routes)

async function start() {
  const {
    ME_CONFIG_MONGODB_URL: uri
  } = process.env

  try {
    await mongoose.connect(`${uri}/notes?authSource=admin`, {
      useNewUrlParser: true,
      useUnifiedTopology: true
    })
    app.listen(
      port,
      console.log.bind(console, `Server has been started on port ${port}`)
    )
  } catch (e) {
    console.log(e)
  }
}

start()




