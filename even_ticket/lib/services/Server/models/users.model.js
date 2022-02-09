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
      }
    }, {
      timestamps: false
    });

    return Users;
  };