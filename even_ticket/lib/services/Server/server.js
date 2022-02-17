const express = require("express");
const cors = require("cors");
const app = express();

app.use(cors());
app.use(express.json({limit: '50mb'}));
app.use(express.urlencoded({extended: true }));

const db = require("./models");
db.sequelize.sync()

app.get("/", (req, res) => {
  res.json({ message: "Server Online" });
});

// Get Routes
require("./routes/users.routes")(app);
require("./routes/tickets.routes")(app);
require("./routes/events.routes")(app);

// set port, listen for requests
const PORT = process.env.PORT || 3000 ;

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}.`);
});