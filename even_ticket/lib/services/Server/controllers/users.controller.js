const db = require("../models");
const Users = db.users;
const bcrypt = require('bcrypt')
const fs = require('fs');
var Sequelize = require("sequelize");

// Create and Store a new User
exports.create = (req, res) => {
    // Validate not Null
    if (!req.body.name && !req.body.email && !req.body.password) {
        res.status(400).send({
        message: "Content can not be empty!"
        });
        return;
    }

    // Create a User
    const user = {
    name: req.body.name,
    email: req.body.email,
    password: req.body.password,
    favourites: req.body.favourites,
    isOrganiser: req.body.isOrganiser,
    face: req.body.face,
    };

    // Save User in the database
    Users.create(user)
        .then(data => {
        res.send(data);
        })
        .catch(err => {
        res.status(500).send({
            message:
            err.message || "Some error occurred while creating the user."
        });
        });

};

exports.login = (req, res) => {
  const email = req.body.email;
  Users.findAll({ where: {email: email}})
    .then(data => {
      if (data[0] != null) {
        console.log(req.body.password)
        console.log(data[0].dataValues.password)
        return bcrypt.compare(req.body.password, data[0].dataValues.password).then((res) =>{
          return res;
        });    
      } 
    })
    .then((authenticated) => {
      console.log(authenticated)
      if (authenticated) {
        res.send("PASS")
      } else {
        res.send("FAIL")
      }
    })
    .catch(err => {
      res.status(500).send({
        message: "Error retrieving User with email: " + email + err
      });
    });
}

// Find all Users
exports.findAll = (req, res) => {
    Users.findAll()
      .then(data => {
        res.send(data);
      })
      .catch(err => {
        res.status(500).send({
          message:
            err.message || "Some error occurred while retrieving users"
        });
      });
};

// Find a single User by email
exports.findOne = (req, res) => {
  const email = req.body.email;
  Users.findAll({ where: {email: email}})
    .then(data => {
      if (data[0] != null) {
        res.send(data);
      } else {
        res.status(404).send({
          message: `Cannot find User with email: ${email}`
        });
      }
    })
    .catch(err => {
      res.status(500).send({
        message: "Error retrieving User with email: " + email
      });
    });
};

// Find a single User by email
exports.verify = (req, res) => {
  // Write each blob to jpg file
  try {
    const base64 = req.body.face;
    const buffer = Buffer.from(base64, "base64");
    fs.writeFileSync("../../python/face.jpg", buffer);
    res.send("OK");
  } catch (error) {
    res.send(error);
  }
  
};

// Update a Users name by Email
exports.update = (req, res) => {
  const email = req.body.email;
  Users.update(req.body, {
    where: { email: email }
  })
    .then(data => {
      res.send(data)
    })
    .catch(err => {
      res.status(500).send({
        message: "Error updating User with email: " + email + "\n" + err
      });
    });
};

// Update a Users name by Email
exports.updateFavouritesAdd = (req, res) => {
  const email = req.body.email;
  Users.update(
    {favourites: Sequelize.fn('array_append', Sequelize.col('favourites'), req.body.event_name)},
    {where: { email: email }}
  )
    .then(data => {
      res.send(data)
    })
    .catch(err => {
      res.status(500).send({
        message: "Error updating User with email: " + email + "\n" + err
      });
    });
};

// Update a Users name by Email
exports.updateFavouritesRemove = (req, res) => {
  const email = req.body.email;
  Users.update(
    {favourites: Sequelize.fn('array_remove', Sequelize.col('favourites'), req.body.event_name)},
    {where: { email: email }}
  )
    .then(data => {
      if (data == 1) {
        res.send("OK");
      }
      else {
        res.send(data);
      }
      
    })
    .catch(err => {
      res.status(500).send({
        message: "Error updating User with email: " + email + "\n" + err
      });
    });
};

// Delete a User by email
exports.delete = (req, res) => {
  const email = req.body.email;
  Users.destroy({
    where: { email: email }
  })
    .then(num => {
      if (num == 1) {
        res.send({
          message: "User was deleted successfully!"
        });
      } else {
        res.send({
          message: `Cannot delete User with email: ${email}. Maybe User was not found!`
        });
      }
    })
    .catch(err => {
      res.status(500).send({
        message: "Could not delete User with email: " + email
      });
    });
};

