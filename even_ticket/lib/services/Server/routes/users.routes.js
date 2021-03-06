module.exports = app => {
  const users = require("../controllers/users.controller");
  var router = require("express").Router();
  // Create a new User
  router.post("/", users.create);
  // Retrieve all User
  router.get("/", users.findAll);
  // Retrieve a single User with email
  router.post("/retrieve", users.findOne);
  // Retrieve a single User with email
  router.post("/verify", users.verify);
  // Update a User with email
  router.put("/", users.update);
  // Update Users favourites
  router.put("/favourites/add", users.updateFavouritesAdd);
  // Update Users favourites
  router.put("/favourites/remove", users.updateFavouritesRemove);
  // Delete a User with email
  router.delete("/", users.delete);

  router.post("/login", users.login);

  app.use('/api/users', router);
};