module.exports = {
    HOST: "eventicket.cbrwauajlwxb.eu-west-1.rds.amazonaws.com",
    USER: "etadmin",
    PASSWORD: "databasepw",
    DB: "eventicketdb",
    PORT: 5432,
    dialect: "postgres",
    pool: {
        max: 5,
        min: 0,
        acquire: 30000,
        idle: 10000
    }
  };