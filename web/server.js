require('dotenv').config();
const express = require('express');
const mysql = require('mysql');
const app = express();
const PORT = 3000;

console.log('DB_USER:', process.env.DB_USER);
console.log('DB_PASSWORD:', process.env.DB_PASSWORD);
console.log('DB_SCHEMA:', process.env.DB_SCHEMA);

// Create MySQL connection
const db = mysql.createConnection({
  host: 'localhost', //dont change
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_SCHEMA 
});

// Connect
db.connect((err) => {
  if (err) {
    throw err;
  }
  console.log('MySQL Connected...');
});

// Set up your Express routes for CRUD operations
// For example, a route to get all items from a table
app.get('/api/available-rooms-per-city', (req, res) => {
  const sql = 'SELECT * FROM available_rooms_per_city';
  db.query(sql, (err, result) => {
    if (err) {
      console.error('Error querying the view:', err);
      res.status(500).json({ error: 'Internal server error' });
      return;
    }
    res.json(result);
  });
});

// Other CRUD routes for insert, update, delete, etc.

// Serve static files from the 'public' folder
app.use(express.static('public'));

// Start the server
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
