const express = require('express');

const healthRouter = express.Router();

healthRouter.get('/', (req, res) => {
    res.json({ ok: true, message: 'Health check!!' });
});

module.exports = healthRouter;