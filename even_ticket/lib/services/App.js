const Joi = require('joi');
const express = require('express');
const app = express();

app.use(express.json());

const tests = [
    {id: 1, name: 'test 1'},
    {id: 2, name: 'test 2'},
    {id: 3, name: 'test 3'},
];

app.get('/', (req, res) => {
    res.send('Hello World!!');
});

app.get('/api/tests', (req, res) => {
    res.send(courses);
});

app.get('/api/test/:id', (req, res) => {
    const test = courses.find(c => c.id === parseInt(req.params.id));
    if(!test) res.status(404).send('Not found!')
    res.send(test);
});

app.post('/api/test', (req, res) => {
    const schema = Joi.object({
        name: Joi.string().min(3).required()
    });

    const result = schema.validate(req.body);
    
    if(result.error) {
        // 400 Bad Request
        res.status(400).send(result.error.details[0].message);
        return;
    }
    
    const test = {
        id: courses.length + 1, 
        name: req.body.name
    };
    courses.push(course);
    res.send(course);
});

// Port
const port = process.env.PORT || 3000;
app.listen(port, () => console.log('Listening on port ${port}...'));
