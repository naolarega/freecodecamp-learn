const mongoose = require('mongoose');


const Exercise = mongoose.model('Exercise', mongoose.Schema({
    user: {
        type: mongoose.ObjectId,
        ref: 'User'
    },
    description: {
        type: String,
        required: true
    },
    duration: {
        type: Number,
        required: true
    },
    date: Date
}));


exports.Exercise = Exercise;