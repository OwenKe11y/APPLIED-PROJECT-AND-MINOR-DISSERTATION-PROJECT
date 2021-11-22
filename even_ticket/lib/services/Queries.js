const express = require('express');
const app = express();
const Pool = require('pg').Pool

app.use(express.json());

const pool = new Pool({
    user: 'etadmin',
    host: 'eventicket.cbrwauajlwxb.eu-west-1.rds.amazonaws.com',
    database: 'eventicketdb',
    password: 'databasepw',
    port: 5432,
  })

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
    deleteLogin
}
