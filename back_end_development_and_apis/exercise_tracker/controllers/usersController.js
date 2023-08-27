const express = require('express');

const { Exercise } = require('../models/exercisesModel');
const { User } = require('../models/usersModel');


const userRouter = express.Router();

userRouter.post('/users', function(req, res) {
    const username = req.body['username'];

    if (!username) {
        return res.status(400).json({
            error: 'username not provided'
        });
    }

    User.findOne({
        username
    }, function(err, user) {
        if (err) {
            return res.status(500).json({
                error: 'something went wrong'
            });
        }

        if (user) {
            return res.status(409).json({
                error: 'user already registered'
            });
        }

        new User({
            username
        }).save(function(err, user) {
            if (err) {
                return res.status(500).json({
                    error: 'something went wrong'
                });
            }

            res.json({
                username: user.username,
                _id: user._id
            });
        });
    });
});

userRouter.get('/users', function(req, res) {
    User.find(function(err, users) {
        if (err) {
            return res.status(500).json({
                error: 'something went wrong'
            });
        }

        res.json(
            users.map(
                user => ({
                    username: user.username,
                    _id: user._id
                })
            )
        );
    });
});

userRouter.post('/users/:_id/exercises', function(req, res) {
    const { description, duration, date } = req.body;

    if (!description && !duration) {
        return res.status(400).json({
            error: 'required fields missing',
        });
    }

    const userId = req.params._id;

    User.findById(userId, function(err, user) {
        if (err) {
            return res.status(500).json({
                error: 'something went wrong'
            });
        }

        if (!user) {
            return res.status(404).json({
                error: 'user doesn\'t exist'
            });
        }

        new Exercise({
            user,
            description,
            duration,
            date: date ? date : new Date().toDateString()
        }).save(function(err, exercise) {
            if (err) {
                return res.status(500).json({
                    error: 'something went wrong'
                });
            }

            res.json({
                username: user.username,
                description: exercise.description,
                duration: exercise.duration,
                date: exercise.date.toDateString(),
                _id: userId
            });
        });
    });
});

userRouter.get('/users/:_id/logs', function(req, res) {
    const userId = req.params._id;
    const { from, to, limit } = req.query;

    User.findById(userId, function(err, user) {
        if (err) {
            return res.status(500).json({
                error: 'something went wrong'
            });
        }

        if (!user) {
            return res.status(404).json({
                error: 'user doesn\'t exist'
            });
        }

        let exercisesQuery = Exercise.find({
            user
        });
        
        if (from || to) {
            exercisesQuery.where('date');
        }

        if (from) {
            exercisesQuery.gte(new Date(from));
        }

        if (to) {
            exercisesQuery.lte(new Date(to));
        }

        if (limit) {
            exercisesQuery.limit(parseInt(limit));
        }

        exercisesQuery.exec(function(err, exercises) {
            if (err) {
                return res.status(500).json({
                    error: 'something went wrong'
                });
            }

            res.json({
                username: user.username,
                count: exercises.length,
                _id: userId,
                log: exercises.map(
                    exercise => ({
                        description: exercise.description,
                        duration: exercise.duration,
                        date: exercise.date.toDateString()
                    })
                )
            });
        });
    });
});


exports.userRouter = userRouter;