'use strict';

class UserModel {
    constructor(id, username) {
        this.id = id;
        this.username = username;
    }

    toJSON() {
        return {
            id: "" + this.id + "",
            username: this.username
        }
    }

    update(user) {
        if (user.username) {
            this.username = user.username;
        }            
    }
}

UserModel.fromJSON = function(id, data) {
    if (!('username' in data)) {
        return null;
    }

    const username = data['username'];
    return new UserModel(id, username);
}

module.exports = UserModel;