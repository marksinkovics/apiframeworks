'use strict';

const express = require('express');
const basicAuth = require('express-basic-auth');

const router = express.Router();
router.use(basicAuth({users: { 'user': 'pass' }}));

router.get('/', (req, res) => (res.send("Welcome to admin page!")));

module.exports = router; 