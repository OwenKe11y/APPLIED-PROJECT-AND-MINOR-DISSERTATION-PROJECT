const express = require('express');
const app = express();

const bcrypt = require('bcrypt');
const session = require('express-session');
const passport = require('passport');
const { pool } = require("./dbConfig");

app.use(express.json());

// Login
async function getAllLogins() {
  try {
    const res = await pool.query('SELECT * FROM users');
    return res.rows;
  } catch (err) {
    console.log(err.stack)
  }
}

async function registerUsers(req) {
  let { name, email, password, password2} = req.body;
  
  console.log({
    name,
    email,
    password,
    password2
  });

  // Validation checks
  if (!name || !email || !password || !password2) {
    errors.push({ message: "Please enter all fields" });
  }

  if (password.length < 6) {
      errors.push({ message: "Password should be at least 6 characters" });
  }

  if (password != password2) {
      errors.push({ message: "Passwords do not match" });
  }

  // Using bycrpt to encrypt password
  let hashedPassword = await bcrypt.hash(password, 10);
  console.log(hashedPassword);

  try {
    // Check to see if user already exists
    const res = await pool.query(`SELECT * FROM users WHERE email = $1`, [email], (err, results) => {
      if (err) {
          throw err
      }

      if (results.rows.length > 0) {
          errors.push({ message: "Email already registered" });

      } else {
          // If user does not exist insert data to DB
          return pool.query(`INSERT INTO users (name, email, password) VALUES ($1, $2, $3)
              RETURNING id, password`, [name, email, hashedPassword], (err, results) => {
              if (err) {
                throw err
              }
          }
          )
      }
  }
  );
    return res;
  } catch (err) {
    console.log(err.stack)
  }

}

function checkAuthenticated (req, res, next) {
  if (req.isAuthenticated()) {
  }
  next();
}

function checkNotAuthenticated (req, res, next) {
  if (req.isAuthenticated()) {
      return next()
  }
}

module.exports = {

    getAllLogins,
    registerUsers,
    checkAuthenticated,
    checkNotAuthenticated
}