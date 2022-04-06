const bcrypt = require("bcrypt")

module.exports = (sequelize, Sequelize) => {
    const Tickets = sequelize.define("tickets", {
      event_name: Sequelize.STRING,       
      owner: Sequelize.STRING,
      organiserEmail: Sequelize.STRING
    }, {
      timestamps: false
    });

    return Tickets;
  };