const express = require("express")
const path = require("path")
const mustacheExpress = require("mustache-express")
const os = require("os")

const app = express()
app.engine("html", mustacheExpress())
app.set("view engine", "html")
app.set("views", path.join(__dirname, "views"))
app.use("/static", express.static("static"))

app.get("/", (req, res) => {
  res.render(`${process.argv[2]}.html`, {
    hostname: os.hostname(),
    os: process.env.OS_NAME,
    version: process.version,
  })
})

const PORT = 8080
app.listen(PORT, () => {
  console.log(`The server is running on port ${PORT}`)
})
