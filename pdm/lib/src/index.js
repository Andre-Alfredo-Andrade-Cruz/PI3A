const compression = require('compression')
const express = require("express")
const bodyParser = require("body-parser")
const app = express()

const routes = require("./routes/dialogflow.route");

app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json())
app.use(compression())

const port = process.env.PORT || 3000;

app.listen(port, () => {
  console.log(`Server listening on port ${port}.`);
});

app.use("/api", routes);