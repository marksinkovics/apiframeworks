'use strict';

const _ = require('underscore');
const UserModel = require('../model/user.js')

class Database {
    constructor() {
        this._counter = 3;
        this._users = [
            new UserModel('id1', 'user1'),
            new UserModel('id2', 'user2')
        ]       
    }

    counter() {
        return this._counter;
    }

    users() {
        return this._users;
    }

    userById(id) {
        return _.find(this._users, function(user) {
            return user.id == id;
        });
    }

    addUser(user) {
        if (user) {
            this._counter += 1;
            this._users.push(user);
            console.log(this._users);
        }
    }

    removeUser(id) {
        this._users = _.reject(this._users, function(user){ 
            return user.id == id; 
        });
    }
}

module.exports = new Database();