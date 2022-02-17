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
    title: req.body.title,
    description: req.body.description,
    location: req.body.location,    
    duration: req.body.duration,
    punchline1: req.body.punchline1,
    punchline2: req.body.punchline2,
    categoryIds: req.body.categoryIds,
    galleryImages: req.body.galleryImages,
    displayImage: req.body.displayImage
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

// Find a single Event by title
exports.findOne = (req, res) => {
  const title = req.params.title;
  Events.findAll({ where: {title: title}})
    .then(data => {
      if (data[0] != null) {
        res.send(data);
      } else {
        res.status(404).send({
          message: `Cannot find Event with title: ${title}.`
        });
      }
    })
    .catch(err => {
      res.status(500).send({
        message: "Error retrieving Event with title: " + title
      });
    });
};

// Update a Event by name
exports.update = (req, res) => {
  const title = req.body.title;
  Events.update(req.body, {
    where: { title: title }
  })
    .then(num => {
      console.log(num)
      if (num == 1) {
        res.send({
          message: "User was updated successfully."
        });
      } else {
        res.send({
          message: `Cannot update Event with title: ${title}. Maybe Event was not found or req.body is empty!`
        });
      }
    })
    .catch(err => {
      res.status(500).send({
        message: "Error updating Event with title: " + title + "\n" + err
      });
    });
};

// Delete a Event by title
exports.delete = (req, res) => {
  const title = req.body.title;
  Events.destroy({
    where: { title: title }
  })
    .then(num => {
      if (num == 1) {
        res.send({
          message: "Event was deleted successfully!"
        });
      } else {
        res.send({
          message: `Cannot delete Event with title: ${title}. Maybe Event was not found!`
        });
      }
    })
    .catch(err => {
      res.status(500).send({
        message: "Could not delete Event with title: " + title + " " + err
      });
    });
};



