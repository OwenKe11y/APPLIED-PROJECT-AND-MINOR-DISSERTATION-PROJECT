const db = require("../models");
const fs = require('fs');
const { users } = require("../models");
const Tickets = db.tickets;
const Users = db.users;
var sequelize = require("sequelize");

// Create and Store a new Ticket
exports.create = (req, res) => {
    // Validate not Null
    if (!req.body) {
        res.status(400).send({
        message: "Content can not be empty!"
        });
        return;
    }

    // Create a Ticket
    const ticket = {
    event_name: req.body.event_name,
    owner: req.body.owner,
    organiserEmail: req.body.organiserEmail,
    };

    // Save Ticket in the database
    Tickets.create(ticket)
        .then(data => {
        res.send(data);
        })
        .catch(err => {
        res.status(500).send({
            message:
            err.message || "Some error occurred while creating the ticket."
        });
        });

};

// Find all Tickets
exports.findAll = (req, res) => {
    Tickets.findAll()
      .then(data => {
        res.send(data);
      })
      .catch(err => {
        res.status(500).send({
          message:
            err.message || "Some error occurred while retrieving tickets"
        });
      });
};

// Find a single Ticker by owner
exports.findOne = (req, res) => {
  const email = req.body.email;
  Tickets.findAll({ where: {owner: email}})
    .then(data => {
      if (data[0] != null) {
        res.send(data);
      } else {
        res.status(404).send({
          message: `Cannot find Ticket with id: ${id}.`
        });
      }
    })
    .catch(err => {
      res.status(500).send({
        message: "Error retrieving Ticket with id: " + id
      });
    });
};

// Verify face with ticket on db
exports.findAllFaces = (req, res) => {
  // Find all users names on tickets for selected
  Tickets.findAll({
    where: {
      owner: {
        [sequelize.Op.not]: req.body.organiserEmail
      },
      event_name: req.body.event_name
    },
    attributes: {
      exclude: ['id', 'event_name', 'organiserEmail']
    }
  })
    .then(data => {
      // For each name, find the user and grab the face and name
      data.forEach(ticket => {
        Users.findAll({
          where: {
            name: ticket.owner
          },
          attributes: {
            exclude: ['id', 'email', 'password', 'favourites']
          }
        }).then(user => {
        user.forEach(user => {
        // Write each blob to jpg file
        const base64 = user.face;
        const buffer = Buffer.from(base64, "base64");
        fs.writeFileSync('../../python/faces/' + user.name + ".jpg", buffer);
        });
        })         
      });

      // Run python recognition script
      const spawn = require("child_process").spawn;
      const pythonProcess = spawn('python',['../../python/facial_rec.py']);  

      pythonProcess.stdout.on('data', function(data) {
        res.send(Buffer.from(data).toString())
      });

      pythonProcess.stderr.on("data", (data) => {
        res.send(Buffer.from(data).toString())
      })     
    })
    .catch(err => {
      res.status(500).send({
        message:
          err.message || "Some error occurred while retrieving tickets"
      });
    });
};

// Update a Ticket by id
exports.update = (req, res) => {
  Tickets.findOne({
      where: { event_name: req.body.event_name, organiserEmail: req.body.organiserEmail }
    })
    .then(data => {
      data.update(req.body, {
        where: {event_name: req.body.event_name, organiserEmail: req.body.organiserEmail}
      })
      res.send(data)
    })
    .catch(err => {
      res.status(500).send({
        message: "Error updating Ticket with event_name: " + req.body.event_name + "\n" + err
      });
    });
};

// Delete a User by email
exports.delete = (req, res) => {
  const owner = req.body.owner;
  Tickets.destroy({
    where: { owner: owner }
  })
    .then(num => {
      if (num == 1) {
        res.send({
          message: "User was deleted successfully!"
        });
      } else {
        res.send({
          message: `Cannot delete Ticket with owner: ${owner}. Maybe Ticket was not found!`
        });
      }
    })
    .catch(err => {
      res.status(500).send({
        message: "Could not delete Ticket with owner: " + owner
      });
    });
};

