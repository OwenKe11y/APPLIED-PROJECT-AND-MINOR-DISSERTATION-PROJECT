module.exports = app => {
  const events = require("../controllers/events.controller");
  var router = require("express").Router();
  // Create a new Events
  router.post("/", events.create);
  // Retrieve all Events
  router.get("/", events.findAll);
  // Retrieve a single Event with event_name
  router.get("/:event_name", events.findOne);
  // Update a Event with event_name
  router.put("/", events.update);
  // Delete a Event with id
  router.delete("/", events.delete);

  app.use('/api/events', router);
};