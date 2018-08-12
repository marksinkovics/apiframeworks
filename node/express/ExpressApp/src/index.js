'use strict';

const express = require('express');
const bodyParser = require('body-parser');
const api = require('./api/index.js');
const admin = require('./admin/index.js');

const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

app.get('/', (req, res) => (res.send("Hello World!")));
app.use('/api', api);
app.use('/admin', admin);

const port = 8080
var server = app.listen(port, () => console.log("Server is listening on port " + port));