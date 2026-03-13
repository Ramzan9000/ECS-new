const express = require('express');
const path = require('path');
const app = express();

// Serve frontend build folder
app.use(express.static(path.join(__dirname, '../public')));

// API endpoint
app.get('/health', (req, res) => {
  res.json({ status: 'ok' });
});

// Optional: support React Router
app.get(/^\/.*$/, (req, res) => {
  res.sendFile(path.join(__dirname, '../public', 'index.html'));
});

const PORT = process.env.PORT || 80;
app.listen(PORT, () => {
  console.log(`Server listening on port ${PORT}`);
});
