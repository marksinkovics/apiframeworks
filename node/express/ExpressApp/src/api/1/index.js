'use strict';

const express = require('express');
const user = require('./user.js');

const router = express.Router();

router.use('/user', user);

module.exports = router;