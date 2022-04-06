module.exports = app => {
  const tickets = require("../controllers/tickets.controller");
  var router = require("express").Router();
  // Create a new Ticket
  router.post("/create", tickets.create);
  // Retrieve all Ticket
  router.get("/", tickets.findAll);
  // Retrieve a single Ticket with id
  router.get("/:id", tickets.findOne);
  // Retrieve all ticket faces
  router.get("/faces/all", tickets.findAllFaces);
  // Update a Ticket with email
  router.put("/", tickets.update);
  // Delete a Ticket with id
  router.delete("/", tickets.delete);


  app.use('/api/tickets', router);
};