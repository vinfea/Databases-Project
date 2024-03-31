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
  res.redirect('/login.html');
});

app.get('/login', (req, res) => {
  res.redirect('/login.html');
});

// SET UP ROUTES FOR PAGES  --------------------------------------
app.get('/login', (req, res) => {
  res.sendFile(__dirname + '/public/login.html');
});

app.get('/login.html', (req, res) => {
  res.sendFile(__dirname + '/public/login.html');
});
app.get('/findRooms', (req, res) => {
  res.sendFile(__dirname + '/public/findRooms.html');
});

app.get('/hotelCapacity', (req, res) => {
  res.sendFile(__dirname + '/public/hotelCapacity.html');
});

app.get('/employeeBookings', (req, res) => {
  res.sendFile(__dirname + '/public/employeeBookings.html');
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

app.post('/api/customerbookings', (req, res) => {
  const { username } = req.body;

  // Validate username
  if (!username) {
    return res.status(400).json({ error: 'Username is required' });
  }

  // SQL query to fetch bookings for the customer
  const sql = `
    SELECT br.booking_id, br.room_num, br.hotel_id, br.chain, br.is_renting, bd.date
    FROM booking_renting br
    JOIN customer c ON br.customer_SSN = c.SSN
    JOIN booking_date bd ON bd.booking_id = br.booking_id AND bd.hotel_id = br.hotel_id AND bd.chain = br.chain
    WHERE c.username = ?
  `;

  db.query(sql, [username], (err, results) => {
    if (err) {
      console.error('Error fetching bookings:', err);
      return res.status(500).json({ error: 'Internal server error' });
    }

    // Check if any bookings were found
    if (results.length === 0) {
      return res.status(404).json({ message: 'No bookings found for the user' });
    }

    // Bookings found, return as JSON
    res.json(results);
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

// Hardcoded API endpoint to fetch bookings for a hotel the employee works at
app.post('/api/getEmployeeBookings', (req, res) => {
  // Username of the logged-in employee
  const { username } = req.body;

  if (!username) {
      return res.status(400).json({ error: 'Username is required' });
  }

  const query = `
      SELECT br.booking_id, br.room_num, br.hotel_id, br.chain, br.customer_SSN, br.is_renting, bd.date, bp.cc_number, bp.exp_date, bp.ccv
      FROM booking_renting br
      JOIN employee e ON br.hotel_id = e.hotel_id AND br.chain = e.chain
      JOIN booking_date bd ON bd.booking_id = br.booking_id AND bd.hotel_id = br.hotel_id AND bd.chain = br.chain
      LEFT JOIN booking_payment bp ON bp.booking_id = br.booking_id AND bp.hotel_id = br.hotel_id AND bp.chain = br.chain
      WHERE e.username = ?;
  `;

  db.query(query, [username], (err, results) => {
      if (err) {
          console.error('Error executing MySQL query:', err);
          res.status(500).send('Internal Server Error');
          return;
      }
      res.json(results);
  }
  );

});
// API endpoint to update payment info
app.post('/api/updatePaymentInfo', (req, res) => {
  const { bookingId, hotelId, chain, cc_number, exp_date, ccv } = req.body;

  // Update payment info in the database
  const query = `
      UPDATE booking_payment
      SET cc_number = ?, exp_date = ?, ccv = ?
      WHERE booking_id = ? AND hotel_id = ? AND chain = ?
  `;
  const values = [cc_number, exp_date, ccv, bookingId, hotelId, chain];

  db.query(query, values, (err, result) => {
      if (err) {
          console.error('Error updating payment info:', err);
          return res.status(500).json({ error: 'Failed to update payment info.' });
      }
      res.json({ message: 'Payment info updated successfully.' });
  });
});

app.delete('/api/deleteBooking', (req, res) => {
  const { bookingId, hotelId, chain } = req.body;

  // Delete the booking from the database
  const query = `
      DELETE FROM booking_renting
      WHERE booking_id = ? AND hotel_id = ? AND chain = ?
  `;
  const values = [bookingId, hotelId, chain];

  db.query(query, values, (err, result) => {
      if (err) {
          console.error('Error deleting booking:', err);
          return res.status(500).json({ error: 'Failed to delete booking.' });
      }
      res.json({ message: 'Booking deleted successfully.' });
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
app.get('/findRoom', (req, res) => {
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


//allows customers to book a room 
app.post('/createBooking', (req, res) => {
  const { room_num, hotel_id, chain, customer_username, startDate, endDate } = req.body;

  // Get the customer's SSN based on the provided username
  db.query('SELECT SSN FROM customer WHERE username = ?', [customer_username], (err, results) => {
    if (err) {
      console.error('Error executing MySQL query:', err);
      return res.status(500).json({ error: 'Internal Server Error' });
    }

    if (results.length === 0) {
      return res.status(404).json({ error: 'Customer not found' });
    }

    const customer_SSN = results[0].SSN;

    // Create temporary table with booking data
    const createTempBookingTableQuery = `
      CREATE TEMPORARY TABLE temp_booking AS
      SELECT
        (SELECT MAX(booking_id) 
         FROM booking_renting
         WHERE hotel_id = ? AND chain = ?) + 1 AS booking_id, 
        ? AS room_num,
        ? AS hotel_id,
        ? AS chain,
        ? AS customer_SSN,
        'active' AS is_renting
      FROM customer c
      WHERE c.username = ?;
    `;

    // Insert data into booking_renting
    const insertIntoBookingRentingQuery = `
      INSERT INTO booking_renting (booking_id, room_num, hotel_id, chain, customer_SSN, is_renting)
      SELECT booking_id, room_num, hotel_id, chain, customer_SSN, is_renting
      FROM temp_booking;
    `;

    // Get the booking_id from the inserted row
    const getBookingIdQuery = 'SELECT booking_id FROM temp_booking;';

    // Drop the temporary table
    const dropTempBookingTableQuery = 'DROP TEMPORARY TABLE IF EXISTS temp_booking;';

    // Execute the queries
    db.query(createTempBookingTableQuery, [hotel_id, chain, room_num, hotel_id, chain, customer_SSN, customer_username], (err) => {
      if (err) {
        console.error('Error creating temporary table:', err);
        return res.status(500).json({ error: 'Internal Server Error' });
      }

      db.query(insertIntoBookingRentingQuery, (err) => {
        if (err) {
          console.error('Error inserting into booking_renting:', err);
          return res.status(500).json({ error: 'Internal Server Error' });
        }

        db.query(getBookingIdQuery, (err, results) => {
          if (err) {
            console.error('Error getting booking_id:', err);
            return res.status(500).json({ error: 'Internal Server Error' });
          }

          const newBookingId = results[0].booking_id;
          console.log('New Booking ID:', newBookingId);

          db.query(dropTempBookingTableQuery, (err) => {
            if (err) {
              console.error('Error dropping temporary table:', err);
              return res.status(500).json({ error: 'Internal Server Error' });
            }

            // Call InsertBookingDates procedure
            db.query(
              'CALL InsertBookingDates(?, ?, ?, ?, ?)',
              [newBookingId, hotel_id, chain, startDate, endDate],
              (err) => {
                if (err) {
                  console.error('Error executing MySQL query:', err);
                  return res.status(500).json({ error: 'Internal Server Error' });
                }

                res.status(200).json({ message: 'Booking created successfully', newBookingId });
              }
            );
          });
        });
      });
    });
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
