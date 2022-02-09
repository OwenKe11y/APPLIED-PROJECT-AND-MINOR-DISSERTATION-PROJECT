const bcrypt = require("bcrypt")

module.exports = (sequelize, Sequelize) => {
    const Tickets = sequelize.define("tickets", {
      event_name: Sequelize.STRING,     
      location: Sequelize.STRING,  
      image:  Sequelize.STRING,
      date:   Sequelize.DATEONLY,
      owner: Sequelize.STRING
    }, {
      timestamps: false
    });

    return Tickets;
  };