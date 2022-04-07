const express = require("express");
const cors = require("cors");
const app = express();
const { networkInterfaces } = require('os');


// Get Local ip
const nets = networkInterfaces();
const results = Object.create(null);
for (const name of Object.keys(nets)) {
  for (const net of nets[name]) {
      // Skip over non-IPv4 and internal (i.e. 127.0.0.1) addresses
      if (net.family === 'IPv4' && !net.internal) {
          if (!results[name]) {
              results[name] = [];
          }
          results[name].push(net.address);
      }
  }
}

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
const PORT = process.env.PORT || 3000;

app.listen(3000, "192.168.1.5", () => {
  console.log(`Server is running on port ${PORT}.`);
});

const Stripe = require('stripe')
const stripe = Stripe('sk_test_51KRLjFLq7ImpQvpEnokWPnmMaIXW4f67cr4N4iHoh3YG6vOb631jj22yNVLZawyrUzzRpxg1tMTZFbmZk5xbDLQu00qDS2N4TR')



// stripe.charges.create({
//   amount: 5000,
//   currency: "eur",
//   source: "tok_visa", // obtained with Stripe.js
//   description: "My First Test Charge (created for API docs)"
  
// },  function(err, charge) {
//   console.log(err)
//   console.log("this is an error")
//   console.log(charge)
// });

