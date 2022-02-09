const db = require("../models");
const Events = db.events;

// Create and Store a new Event
exports.create = (req, res) => {
    // Validate not Null
    if (!req.body) {
        res.status(400).send({
        message: "Content can not be empty!"
        });
        return;
    }
    
    // Create a Event
    const event = {
    event_name: req.body.event_name,
    image: req.body.image,
    description: req.body.description,
    location: req.body.location,    
    category: req.body.category,
    organiser: req.body.organiser,
    date: req.body.date,
    galleryImages: req.body.galleryImages,
    };

    // Save Event in the database
    Events.create(event)
        .then(data => {
        res.send(data);
        })
        .catch(err => {
        res.status(500).send({
            message:
            err.message || "Some error occurred while creating the Event."
        });
        });

};

// Find all Events
exports.findAll = (req, res) => {
    Events.findAll()
      .then(data => {
        res.send(data);
      })
      .catch(err => {
        res.status(500).send({
          message:
            err.message || "Some error occurred while retrieving events"
        });
      });
};

// Find a single Event by event_name
exports.findOne = (req, res) => {
  const event_name = req.params.event_name;
  Events.findAll({ where: {event_name: event_name}})
    .then(data => {
      if (data[0] != null) {
        res.send(data);
      } else {
        res.status(404).send({
          message: `Cannot find Event with event_name: ${event_name}.`
        });
      }
    })
    .catch(err => {
      res.status(500).send({
        message: "Error retrieving Event with event_name: " + event_name
      });
    });
};

// Update a Event by name
exports.update = (req, res) => {
  const event_name = req.body.event_name;
  Events.update(req.body, {
    where: { event_name: event_name }
  })
    .then(num => {
      console.log(num)
      if (num == 1) {
        res.send({
          message: "User was updated successfully."
        });
      } else {
        res.send({
          message: `Cannot update Event with event_name: ${event_name}. Maybe Event was not found or req.body is empty!`
        });
      }
    })
    .catch(err => {
      res.status(500).send({
        message: "Error updating Event with event_name: " + event_name + "\n" + err
      });
    });
};

// Delete a Event by event_name
exports.delete = (req, res) => {
  const event_name = req.body.event_name;
  Events.destroy({
    where: { event_name: event_name }
  })
    .then(num => {
      if (num == 1) {
        res.send({
          message: "Event was deleted successfully!"
        });
      } else {
        res.send({
          message: `Cannot delete Event with event_name: ${event_name}. Maybe Event was not found!`
        });
      }
    })
    .catch(err => {
      res.status(500).send({
        message: "Could not delete Event with event_name: " + event_name + " " + err
      });
    });
};



