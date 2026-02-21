const express = require("express");
const Notebook = require("./models");
const notebookRouter = express.Router();
const mongoose = require("mongoose");

const validateId = (req, res, next) => {
  const { id } = req.params;

  if (!mongoose.Types.ObjectId.isValid(id)) {
    return res.status(404).json({
      error: "Notebook not found",
    });
  }

  next();
};
// Create new notebook: POST /api/notebooks
notebookRouter.post("/", async (req, res) => {
  try {
    const { name, description } = req.body;

    if (!name) {
      return res.status(400).json({
        error: "Name field is required",
      });
    }

    const notebook = new Notebook({
      name,
      description,
    });

    await notebook.save();

    res.status(201).json({
      data: notebook,
    });
  } catch (error) {
    res.status(500).json({
      error: error.message,
    });
  }
});

// Get all notebooks: GET /api/notebooks
notebookRouter.get("/", async (req, res) => {
  try {
    const notebooks = await Notebook.find({});
    res.json({
      data: notebooks,
    });
  } catch (error) {
    res.status(500).json({
      error: error.message,
    });
  }
});

// Get Single notebook: GET /api/notebooks/:id
notebookRouter.get("/:id", validateId, async (req, res) => {
  try {
    const notebook = await Notebook.findById(req.params.id);

    if (!notebook) {
      return res.status(404).json({
        error: "Notebook not found",
      });
    }

    res.json({ data: notebook });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Update notebook: PUT /api/notebooks/:id
notebookRouter.put("/:id", validateId, async (req, res) => {
  try {
    const { name, description } = req.body;

    const notebook = await Notebook.findByIdAndUpdate(
      req.params.id,
      { name, description },
      { new: true }
    );

    if (!notebook) {
      return res.status(404).json({
        error: "Notebook not found",
      });
    }

    res.json({ data: notebook });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Delete notebook: DELETE /api/notebooks/:id
notebookRouter.delete("/:id", validateId, async (req, res) => {
  try {
    const notebook = await Notebook.findByIdAndDelete(req.params.id);

    if (!notebook) {
      return res.status(404).json({
        error: "Notebook not found",
      });
    }

    res.status(204).send();
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = notebookRouter;
