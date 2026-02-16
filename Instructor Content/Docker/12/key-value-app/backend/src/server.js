const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');

const app = express();
const PORT = process.env.PORT || 3000;

app.use(bodyParser.json());

mongoose.connect('mongodb://localhost:27017/keyvalue',
    {
        auth: {
            username: 'key-value-user',
            password: 'key-value-password'
        },
        connectTimeoutMS: 500
    }
).then(() => {
    console.log('MongoDB connected successfully');
    app.listen(PORT, () => {
        console.log(`Server listening on port ${PORT}`);
    });
}).catch((err) => {
    console.error('MongoDB connection error:', err.message);
    process.exit(1);
});

app.get('/health', (req, res) => {
    res.json({ ok: true, message: 'Health check' });
});