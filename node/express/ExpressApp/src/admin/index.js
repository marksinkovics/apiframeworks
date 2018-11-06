'use strict';

const express = require('express');
const basicAuth = require('express-basic-auth');
const UserModel = require('../model/user.js')
const database = require('../database/database.js')

const router = express.Router();

router.use(
    basicAuth({
        authorizer: myAuthorizer
    })
);

function myAuthorizer(username, password) {
    const user = database.userByName(username)
    if (user) {
        return user.password == password;
    }
    return false;
}

router.get('/', (req, res) => (res.send("Admin page")));

module.exports = router;