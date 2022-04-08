const express = require("express");
const cors = require("cors");
const app = express();
const db = require("./models");
const swaggerUI = require("swagger-ui-express")
const swaggerJsDoc = require("swagger-jsdoc")

const options = {
  definition: {
    openapi: "3.0.0",
    info: {
      title: "EvenTicket API",
      version: "1.0.0",
      description: "API for eventicket flutter application"
    },
    servers: [
      {
        url: "http://eventicketapi.herokuapp.com"
      }
    ]
  },
  apis: ["./routes/*.js"]
}

const specs = swaggerJsDoc(options)

app.use("/api-docs", swaggerUI.serve, swaggerUI.setup(specs))

app.use(cors());
app.use(express.json({limit: '50mb'}));
app.use(express.urlencoded({extended: true }));

// Sync with db
db.sequelize.sync()

// Get Routes
require("./routes/users.routes")(app);
require("./routes/tickets.routes")(app);
require("./routes/events.routes")(app);

// set port, listen for requests
const PORT = process.env.PORT || 3000;

app.listen(3000, "192.168.0.129", () => {
  console.log(`Server is running on port ${PORT}.`);
});