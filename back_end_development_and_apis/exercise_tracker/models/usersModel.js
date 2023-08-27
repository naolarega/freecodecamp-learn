const mongoose = require('mongoose');


const User = mongoose.model('User', mongoose.Schema({
    username: {
        type: String,
        required: true
    }
}));


exports.User = User;