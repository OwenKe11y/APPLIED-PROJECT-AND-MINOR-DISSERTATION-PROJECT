const db = require("../models");
const Tickets = db.tickets;

// Create and Store a new User
exports.create = (req, res) => {
  console.log("create function")
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
    location: req.body.location,
    image: req.body.image,
    date: req.body.date,
    owner: req.body.owner
    };

    // Save Ticket in the database
    Tickets.create(ticket)
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
  const id = req.params.id;
  Tickets.findAll({ where: {id: id}})
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
        message: "Error retrieving Ticker with id: " + id
      });
    });
};

// Update a Ticket by id
exports.update = (req, res) => {
  const id = req.body.id;
  Tickets.update(req.body, {
    where: { id: id }
  })
    .then(num => {
      console.log(num)
      if (num == 1) {
        res.send({
          message: "User was updated successfully."
        });
      } else {
        res.send({
          message: `Cannot update Ticket with id: ${id}. Maybe Ticket was not found or req.body is empty!`
        });
      }
    })
    .catch(err => {
      res.status(500).send({
        message: "Error updating Ticket with id: " + id + "\n" + err
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

