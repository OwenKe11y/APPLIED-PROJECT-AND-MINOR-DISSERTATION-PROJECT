module.exports = app => {
  const users = require("../controllers/users.controller");
  var router = require("express").Router();
  // Create a new User
  router.post("/", users.create);
  // Retrieve all User
  router.get("/", users.findAll);
  // Retrieve a single User with email
  router.post("/retrieve", users.findOne);
  // Update a User with email
  router.put("/", users.update);
  // Delete a User with email
  router.delete("/", users.delete);

  router.post("/login", users.login);

  app.use('/api/users', router);
};