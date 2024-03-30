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

// Serve static files from the 'public' folder
app.use(express.static('public'));

//used to parse json data coming in from the frontend
app.use(express.json());


// SET UP ROUTES FOR PAGES  --------------------------------------
app.get('/login', (req, res) => {
  res.sendFile(__dirname + '/public/login.html');
});

// Redirect to login page as default
app.get('/', (req, res) => {
  res.redirect('/login');
});


// SET UP ENDPOINTS FOR CRUD APIS ----------------------------------------------
//get all the available rooms in the city
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

//get all aggregated room capacity in all hotel chains
app.get('/api/aggregated-room-capacity-view', (req, res) => {
  // Perform database query to fetch data from the MySQL view
  const sql2= 'SELECT * FROM aggregated_room_capacity';
  db.query(sql2, (err, result1) => {
      if (err) {
          console.error('Error fetching data from view:', err);
          res.status(500).json({ error: 'Internal Server Error' });
          return;
      }
      // Send the data fetched from the view as a JSON response
      res.json(result1);
  });
});


//login api endpoint
app.post('/login', (req, res) => {
  const { userType, username, password } = req.body;

  let tableName;
  if (userType === 'employee') {
      tableName = 'employee';
  } else if (userType === 'customer') {
      tableName = 'customer';
  }

 const query = `SELECT * FROM ${tableName} WHERE username = ? AND password = ?`;
  db.query(query, [username, password], (err, results) => {
      if (err) {
          console.error('Error executing MySQL query:', err);
          res.status(500).send('Internal Server Error');
          return;
      }

      if (results.length > 0) {
          // User found, send success response
          res.status(200).send('Login successful');
      } else {
          // User not found or invalid credentials, send error response
          res.status(401).send('Invalid username or password');
      }
  });
});

// Menu route
app.get('/menu', (req, res) => {
  // Here you would typically render the menu page
  // For now, just send back a response
  res.send('This is the menu page');
});


// Start the server
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
