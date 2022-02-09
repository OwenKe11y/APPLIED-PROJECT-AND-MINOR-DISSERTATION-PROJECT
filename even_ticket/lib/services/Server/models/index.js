const dbConfig = require("../config/db.config");
const Sequelize = require("sequelize");
const sequelize = new Sequelize(dbConfig.DB, dbConfig.USER, dbConfig.PASSWORD, {
  host: dbConfig.HOST,
  port: 5432,
  dialect: dbConfig.dialect,
  logging: false
});

const db = {};
db.Sequelize = Sequelize;
db.sequelize = sequelize;
db.users = require("./users.model")(sequelize, Sequelize)
db.tickets = require("./tickets.model")(sequelize, Sequelize)
db.events = require("./events.model")(sequelize, Sequelize)
module.exports = db;