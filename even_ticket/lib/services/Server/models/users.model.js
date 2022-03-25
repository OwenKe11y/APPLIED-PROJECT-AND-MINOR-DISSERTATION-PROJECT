const bcrypt = require("bcrypt")

module.exports = (sequelize, Sequelize) => {
    const Users = sequelize.define("users", {
      name: Sequelize.STRING,     
      email: Sequelize.STRING,  
      password:  {
        type: Sequelize.STRING,
        set(value) {
          console.log(value)
          this.setDataValue('password', bcrypt.hashSync(value, 10))
        }
      },
      favourites: Sequelize.ARRAY(Sequelize.TEXT),
      isOrganiser: Sequelize.BOOLEAN,
      face: Sequelize.TEXT
    }, {
      timestamps: false
    });

    return Users;
  };