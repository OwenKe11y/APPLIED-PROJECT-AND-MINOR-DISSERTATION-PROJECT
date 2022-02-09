module.exports = (sequelize, Sequelize) => {
    const Events = sequelize.define("events", {
      event_name: Sequelize.STRING,
      image: Sequelize.STRING,     
      description: Sequelize.STRING,  
      location: Sequelize.STRING,
      category: Sequelize.STRING,
      organiser: Sequelize.STRING,
      date: Sequelize.DATEONLY,
      galleryImages: Sequelize.STRING
    }, {
      timestamps: false
    });

    return Events;
  };