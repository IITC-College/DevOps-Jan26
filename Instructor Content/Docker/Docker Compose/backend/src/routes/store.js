const express = require('express');
const KeyValue = require('../models/keyValue');

const keyValueRouter = express.Router();

keyValueRouter.post('/', async (req, res) => {
    const { key, value } = req.body;
    if (!key || !value) {
        return res.status(400).json({
            error: "both key and value are required"
        });
    }


    try {
        const existing = await KeyValue.findOne({ key });

        if (existing) {
            return res.status(400).json({
                error: "key already exists"
            });
        }

        const newKeyValue = new KeyValue({ key, value });
        await newKeyValue.save();
        res.status(201).json({ ok: true, message: 'Key value stored!!' });
    } catch (error) {
        res.status(500).json({ error: 'Failed to store key value' });
    }
})

keyValueRouter.get('/:key', async (req, res) => {
    const { key } = req.params;
    try {
        const keyValue = await KeyValue.findOne({ key });
        if (!keyValue) {
            return res.status(404).json({
                error: "key not found"
            });
        }

        return res.status(200).json({
            key: key,
            value: keyValue.value
        });
    } catch (error) {
        res.status(500).json({ error: 'Failed to retrieve key value' });
    }
})

keyValueRouter.put('/:key', async (req, res) => {
    const { key } = req.params;
    const { value } = req.body;

    if (!value) {
        return res.status(400).json({
            error: "value is required"
        });
    }

    try {
        const keyValue = await KeyValue.findOneAndUpdate(
            { key },
            { value },
            { new: true }
        );

        if (!keyValue) {
            return res.status(404).json({
                error: "key not found"
            });
        }

        return res.status(200).json({
            message: "key value pair updated successfully",
            key: keyValue.key,
            value: keyValue.value
          });
    } catch (error) {
        res.status(500).json({ error: 'Failed to update key value' });
    }
})


keyValueRouter.delete('/:key', async (req, res) => {
    const { key } = req.params;

    try {
        const keyValue = await KeyValue.findOneAndDelete({ key });

        if (!keyValue) {
            return res.status(404).json({
                error: "key not found"
            });
        }
        
        return res.status(200).json({
            message: "key value pair deleted successfully",
            key: keyValue.key,
            value: keyValue.value
          });
    } catch (error) {
        res.status(500).json({ error: 'Failed to delete key value' });
    }
})

module.exports = keyValueRouter;
