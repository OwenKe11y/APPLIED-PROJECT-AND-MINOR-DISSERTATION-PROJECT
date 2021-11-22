const express = require('express');
const app = express();
const cors = require('cors');
const db = require('./Queries');
const session = require('express-session');
const flash = require('express-flash');
const passport = require('passport');

const initializePassport = require('./passportConfig');

initializePassport(passport);

app.use(cors());
app.use(express.urlencoded({extended: true})); 
app.use(express.json());

app.use(session({
    secret: 'secret',

    resave: false,

    saveUninitialized: false
})
);
app.use(passport.initialize());
app.use(passport.session());

// app.get('/users', db.getAllUsers)
// app.post('/users', db.createUser)
// app.put('/users', db.updateUser)
// app.delete('/users', db.deleteUser)
// app.get('/organisers', db.getAllOrganisers)
// app.post('/organisers', db.createOrganisers)
// app.put('/organisers', db.updateOrganisers)
// app.delete('/organisers', db.deleteOrganisers)
app.get('/login', db.getAllLogins)
app.post('/logins', db.createLogin)
app.put('/login', db.updateLogin)
app.delete('/login', db.deleteLogin)
app.post('/register', db.registerUser)
app.get('/register', db.checkAuthenticated)
app.get('/register', db.checkNotAuthenticated)
app.post('/users/login',
    passport.authenticate('local', {
        // successRedirect: '/users/dashboard', // Successfully logged in
        // failureRedirect: '/users/login', // If failed redirect to login page
        // failureFlash: true // Displays flash messages 
    })
);
// Port
const port = process.env.PORT || 3000;

app.listen(port, () => {
    console.log(`App running on port ${port}.`)
});
