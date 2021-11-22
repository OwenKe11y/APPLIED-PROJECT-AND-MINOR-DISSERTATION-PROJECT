const express = require('express');
const app = express();
const { pool } = require("./dbConfig");
const bcrypt = require('bcrypt');
const session = require('express-session');
const flash = require('express-flash');
const passport = require('passport');
const { func } = require('joi');

app.use(express.json());

// // Users
// const getAllUsers = (req, res) => {
//   pool.query('SELECT * FROM users'), (error, result) => {
//       if(error) {
//           console.log(error);
//       }
//   }
// }

// const createUser = (req, res) => {
//   pool.query('INSERT INTO users (firstname, lastname) VALUES ($1, $2)', [req.body.firstname, req.body.lastname], (error, res) => {
//     if (error) {
//       throw error
//     }
//   })
// }

// const updateUser = (req, res) => {
//   pool.query('UPDATE users SET firstname = ($1) WHERE lastname = ($2)', [req.body.firstname, req.body.lastname], (error, res) => {
//     if (error) {
//       throw error
//     }
//   })
// }

// const deleteUser = (req, res) => {
//   pool.query('DELETE FROM users WHERE firstname = ($1)', [req.body.firstname], (error, res) => {
//     if (error) {
//       throw error
//     }
//   })
// }

// // Organiser
// const getAllOrganisers = (req, res) => {
//   pool.query('SELECT * FROM users'), (error, result) => {
//       if(error) {
//           console.log(error);
//       }
//   }
// }

// const createOrganiser = (req, res) => {
//   pool.query('INSERT INTO organisers (firstname, lastname) VALUES ($1, $2)', [req.body.firstname, req.body.lastname], (error, res) => {
//     if (error) {
//       throw error
//     }
//   })
// }

// const updateOrganiser = (req, res) => {
//   pool.query('UPDATE organisers SET firstname = ($1) WHERE lastname = ($2)', [req.body.firstname, req.body.lastname], (error, res) => {
//     if (error) {
//       throw error
//     }
//   })
// }

// const deleteOrganiser = (req, res) => {
//   pool.query('DELETE FROM organisers WHERE firstname = ($1)', [req.body.firstname], (error, res) => {
//     if (error) {
//       throw error
//     }
//   })
// }

// Login
const getAllLogins = (req, res) => {
  pool.query('SELECT * FROM logins'), (error, result) => {
      if(error) {
          console.log(error);
      }
  }
}

const createLogin = (req, res) => {
  pool.query('INSERT INTO logins (username, password) VALUES ($1, $2)', [req.body.username, req.body.password], (error, res) => {
    if (error) {
      throw error
    }
  })
}

const updateLogin = (req, res) => {
  pool.query('UPDATE logins SET password = ($1) WHERE username = ($2)', [req.body.password, req.body.username], (error, res) => {
    if (error) {
      throw error
    }
  })
}

const deleteLogin = (req, res) => {
  pool.query('DELETE FROM logins WHERE username = ($1)', [req.body.username], (error, res) => {
    if (error) {
      throw error
    }
  })
}

const registerUser = async (req, res) => {
  let { name, email, password, password2} = req.body;
  
  console.log({
    name,
    email,
    password,
    password2
  });

  let errors = [];

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

  // Checks form validation
  if (errors.length > 0) {
    // res.render('register', { errors });
    console.log(errors);
} else {
    // Form validation has passed

    // Using bycrpt to encrypt password
    let hashedPassword = await bcrypt.hash(password, 10);
    console.log(hashedPassword);

    // Check to see if user already exists
    pool.query(
        `SELECT * FROM users
        WHERE email = $1`, [email], (err, results) => {
        if (err) {
            throw err
        }
        console.log(results.rows);

        if (results.rows.length > 0) {
            errors.push({ message: "Email already registered" });
            // Sent to frontend
            //res.render('register', { errors });
        } else {
            // If user does not exist insert data to DB
            pool.query(
                `INSERT INTO users (name, email, password)
                    VALUES ($1, $2, $3)
                    RETURNING id, password`, [name, email, hashedPassword], (err, results) => {
                if (err) {
                    throw err
                }
                console.log(results.rows[0].id);
                //req.flash('success_msg', "You are now registered. Please log in");
                //res.redirect('/users/login');

            }
            )
        }
    }
    );
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
    // getAllUsers,
    // createUser,
    // updateUser,
    // deleteUser,
    // getAllOrganisers,
    // createOrganiser,
    // deleteOrganiser,
    // updateOrganiser,
    getAllLogins,
    createLogin,
    updateLogin,
    deleteLogin,
    registerUser,
    checkAuthenticated,
    checkNotAuthenticated
}
