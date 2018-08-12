'use strict';

const express = require('express');
const v1 = require('./1/index.js');

const router = express.Router();

router.use('/1', v1);

module.exports = router; 