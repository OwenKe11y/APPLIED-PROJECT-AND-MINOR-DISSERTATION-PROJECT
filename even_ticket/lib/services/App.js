const express = require('express');
const app = express();
const cors = require('cors');
const db = require('./Queries');

app.use(cors());
app.use(express.urlencoded({extended: true})); 
app.use(express.json());

// app.get('/users', db.getAllUsers)
// app.post('/users', db.createUser)
// app.put('/users', db.updateUser)
// app.delete('/users', db.deleteUser)
// app.get('/organisers', db.getAllOrganisers)
// app.post('/organisers', db.createOrganisers)
// app.put('/organisers', db.updateOrganisers)
// app.delete('/organisers', db.deleteOrganisers)
app.get('/login', db.getAllLogins)
app.post('/login', db.createLogin)
app.put('/login', db.updateLogin)
app.delete('/login', db.deleteLogin)
// Port
const port = process.env.PORT || 3000;

app.listen(port, () => {
    console.log(`App running on port ${port}.`)
});
