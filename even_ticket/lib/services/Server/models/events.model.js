module.exports = (sequelize, Sequelize) => {
    const Events = sequelize.define("events", {
      title: Sequelize.STRING,    
      description: Sequelize.STRING,  
      location: Sequelize.STRING,
      duration: Sequelize.STRING, 
      punchline1: Sequelize.STRING,
      punchline2: Sequelize.STRING,
      categoryIds: Sequelize.ARRAY(Sequelize.INTEGER),
      galleryImages: Sequelize.ARRAY(Sequelize.TEXT),
      displayImage: Sequelize.TEXT
    }, {
      timestamps: false
    });

    return Events;
  };