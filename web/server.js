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

// Redirect to login page as default
app.get('/', (req, res) => {
  res.redirect('/login');
});

// SET UP ROUTES FOR PAGES  --------------------------------------
app.get('/login', (req, res) => {
  res.sendFile(__dirname + '/public/login.html');
});

app.get('/', (req, res) => { 
  res.sendFile(__dirname + '/public/findRooms.html');
});

app.get('/hotelCapacity', (req, res) => {
  res.sendFile(__dirname + '/public/hotelCapacity.html');
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

//api endpoint to get filter the rooms
app.get('/findRooms', (req, res) => {
  const { startDate, endDate, capacity, hotelChain, roomView, numRooms, price, city } = req.query;

  // Define the base SQL query
  let sql = `SELECT r.room_num, r.hotel_id, r.chain, r.price, r.capacity, r.view, h.address AS location
             FROM room r
             JOIN hotel h ON r.hotel_id = h.hotel_id AND r.chain = h.chain
             WHERE r.capacity = ?`;
  let values = [capacity];

  // Add conditions for start date and end date if provided
  if (startDate && endDate) {
      sql += ` AND r.room_num NOT IN (
                    SELECT DISTINCT br.room_num
                    FROM booking_renting br
                    JOIN booking_date bd ON br.booking_id = bd.booking_id
                    WHERE bd.date BETWEEN ? AND ?
                    AND br.hotel_id = r.hotel_id
                    AND br.chain = r.chain
                )`;
      values.push(startDate, endDate);
  }

  // Add conditions for hotel chain, room view, num_rooms, price, and city
  if (hotelChain) {
      sql += ` AND h.chain = ?`;
      values.push(hotelChain);
  }
  if (roomView) {
      sql += ` AND r.view = ?`;
      values.push(roomView);
  }
  if (numRooms) {
      sql += ` AND h.num_rooms >= ?`;
      values.push(numRooms);
  }
  if (price) {
      sql += ` AND r.price <= ?`;
      values.push(price);
  }
  if (city) {
      sql += ` AND h.address LIKE ?`;
      values.push(`%${city}%`);
  }

  db.query(sql, values, (err, results) => {
      if (err) {
          console.error('Error executing MySQL query:', err);
          res.status(500).send('Internal Server Error');
          return;
      }
      res.json(results);
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
