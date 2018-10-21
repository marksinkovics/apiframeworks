'use strict';

const express = require('express');
const router = express.Router();
const database = require('../../database/database.js')
const UserModel = require('../../model/user.js')

router.get('/', function(req, res) {
    res.json(database.users())
});

router.get('/:id', function(req, res){
    const user = database.userById(req.params.id);
    if (!user) {
        res.sendStatus(404)
    } else {
        res.json(user);
    }
});

router.put('/:id', function(req, res) {
    const user = database.userById(req.params.id);
    if (!user) {
        res.sendStatus(404)
    } else {
        const updatedUser = new UserModel.fromJSON('', req.body);
        user.update(updatedUser)
        res.json(user);
    }
});

router.post('', function(req, res){
    const id = database.counter();
    const user = new UserModel.fromJSON(id, req.body);
    database.addUser(user);
    res.json(user)
});

router.delete('/:id', function(req, res){
    const user = database.userById(req.params.id);
    if (!user) {
        res.sendStatus(404)
    } else {
        database.removeUser(req.params.id)
        res.sendStatus(200);
    }
});

module.exports = router;
