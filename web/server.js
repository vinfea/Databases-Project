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
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
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

app.get('/employeeAvailableRooms', (req, res) => {
  res.sendFile(__dirname + '/public/employeeAvailableRooms.html');
});

app.get('/directBooking.html', (req, res) => {
  res.sendFile(__dirname + '/public/directBooking.html');
});

app.get('/createHotel.html', (req, res) => {  
  res.sendFile(__dirname + '/public/createHotel.html');
});

app.get('/deleteHotel.html', (req, res) => {
  res.sendFile(__dirname + '/public/deleteHotel.html');
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

      // Check if any rows were affected (if a booking was actually deleted)
      if (result.affectedRows > 0) {
        return res.json({ message: 'Booking deleted successfully.' });
      } else {
        return res.status(404).json({ error: 'Booking not found or already deleted.' });
      }

      // Fetch updated list of bookings
      /*const username = req.body.username; // Assuming username is also sent in the request
      fetchBookings(username)
          .then(updatedBookings => {
              res.json({ message: 'Booking deleted successfully.', bookings: updatedBookings });
          })
          .catch(error => {
              console.error('Error fetching updated bookings:', error);
              res.status(500).json({ error: 'Failed to fetch updated bookings.' });
          });*/
  });
});


app.post('/api/updateBookingStatus', (req, res) => {
  const { bookingId, hotelId, chain } = req.body;

  // Validate input parameters
  if (!bookingId || !hotelId || !chain) {
    return res.status(400).json({ error: 'Missing required parameters' });
  }

  // Update the booking status in the database
  const query = `
    UPDATE booking_renting
    SET is_renting = 'renting'
    WHERE booking_id = ? AND hotel_id = ? AND chain = ?
  `;
  const values = [bookingId, hotelId, chain];

  db.query(query, values, (err, result) => {
    if (err) {
      console.error('Error updating booking status:', err);
      return res.status(500).json({ error: 'Failed to update booking status' });
    }
    // Check if any rows were affected by the update
    if (result && result.affectedRows === 0) { // Added result guard
      return res.status(404).json({ error: 'Booking not found' });
    }
    res.json({ message: 'Booking status updated successfully' });
  });
});

// Endpoint to retrieve customers at the employee's hotel
app.get('/api/currentCustomers', (req, res) => {
  const { employeeUsername } = req.query;

  // Query to retrieve hotel information where the employee works
  const employeeHotelQuery = `
      SELECT hotel_id, chain
      FROM employee
      WHERE username = ?
  `;

  db.query(employeeHotelQuery, [employeeUsername], (err, results) => {
      if (err) {
          console.error('Error fetching employee hotel information:', err);
          return res.status(500).json({ error: 'Failed to fetch employee hotel information' });
      }

      if (results.length === 0) {
          return res.status(404).json({ error: 'Employee not found' });
      }

      const { hotel_id, chain } = results[0];

      // Query to retrieve customers at the employee's hotel
      const customerQuery = `
          SELECT c.*, e.username
          FROM customer c
          JOIN booking_renting br ON c.SSN = br.customer_SSN
          JOIN employee e ON br.hotel_id = e.hotel_id AND br.chain = e.chain
          WHERE e.username = ?
      `;

      db.query(customerQuery, [employeeUsername], (err, customerResults) => {
          if (err) {
              console.error('Error fetching customers:', err);
              return res.status(500).json({ error: 'Failed to fetch customers' });
          }
          res.json(customerResults);
      });
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

// Assuming 'app' is your Express app instance
app.post('/cancelBooking', (req, res) => {
  const { booking_id, hotel_id, chain } = req.body;

  // Check if all required parameters are provided
  if (!booking_id || !hotel_id || !chain) {
    return res.status(400).json({ error: 'Missing parameters' });
  }

  // Update the booking_renting table
  let sql = `
    UPDATE booking_renting
    SET is_renting = 'cancelled'
    WHERE booking_id = ? AND hotel_id = ? AND chain = ?;
  `;
  let values = [booking_id, hotel_id, chain];

  db.query(sql, values, (err, result) => {
    if (err) {
      console.error('Error updating booking:', err);
      return res.status(500).json({ error: 'Internal Server Error' });
    }

    if (result.affectedRows === 0) {
      return res.status(404).json({ error: 'Booking not found or not updated' });
    }

    // Successful update
    return res.status(200).json({ message: 'Booking cancelled successfully' });
  });
});


//allows customers to book a room OG
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

    // Get the next available booking_id
    db.query(
      'SELECT IFNULL(MAX(booking_id), 0) + 1 AS next_booking_id FROM booking_renting WHERE hotel_id = ? AND chain = ?',
      [hotel_id, chain],
      (err, result) => {
        if (err) {
          console.error('Error getting next booking_id:', err);
          return res.status(500).json({ error: 'Internal Server Error' });
        }

        const nextBookingId = result[0].next_booking_id;

        // Insert data into booking_renting directly with the next booking_id
        db.query(
          'INSERT INTO booking_renting (booking_id, room_num, hotel_id, chain, customer_SSN, is_renting) VALUES (?, ?, ?, ?, ?, ?)',
          [nextBookingId, room_num, hotel_id, chain, customer_SSN, 'active'],
          (err) => {
            if (err) {
              console.error('Error inserting into booking_renting:', err);
              return res.status(500).json({ error: 'Internal Server Error' });
            }

            // Call InsertBookingDates procedure
            db.query(
              'CALL InsertBookingDates(?, ?, ?, ?, ?)',
              [nextBookingId, hotel_id, chain, startDate, endDate],
              (err) => {
                if (err) {
                  console.error('Error executing MySQL query:', err);
                  return res.status(500).json({ error: 'Internal Server Error' });
                }

                // Send the booking ID to the frontend
                res.status(200).json({ message: 'Booking created successfully', newBookingId: nextBookingId });
              }
            );
          }
        );
      }
    );
  });
});

//create direct booking
app.post('/createDirectBooking', (req, res) => {
  const { room_num, hotel_id, chain, customer_SSN, startDate, endDate, cc_number, exp_date, ccv } = req.body;

  // Get the next available booking_id
  db.query(
    'SELECT IFNULL(MAX(booking_id), 0) + 1 AS next_booking_id FROM booking_renting WHERE hotel_id = ? AND chain = ?',
    [hotel_id, chain],
    (err, result) => {
      if (err) {
        console.error('Error getting next booking_id:', err);
        return res.status(500).json({ error: 'Internal Server Error' });
      }

      const nextBookingId = result[0].next_booking_id;

      // Insert data into booking_renting directly with the next booking_id
      db.query(
        'INSERT INTO booking_renting (booking_id, room_num, hotel_id, chain, customer_SSN, is_renting) VALUES (?, ?, ?, ?, ?, ?)',
        [nextBookingId, room_num, hotel_id, chain, customer_SSN, 'renting'],
        (err) => {
          if (err) {
            console.error('Error inserting into booking_renting:', err);
            return res.status(500).json({ error: 'Internal Server Error' });
          }

          // Call InsertBookingDates procedure
          db.query(
            'CALL InsertBookingDates(?, ?, ?, ?, ?)',
            [nextBookingId, hotel_id, chain, startDate, endDate],
            (err) => {
              if (err) {
                console.error('Error executing MySQL query:', err);
                return res.status(500).json({ error: 'Internal Server Error' });
              }

              // Update payment info
              db.query(
                'UPDATE booking_payment SET cc_number = ?, exp_date = ?, ccv = ? WHERE booking_id = ? AND hotel_id = ? AND chain = ?',
                [cc_number, exp_date, ccv, nextBookingId, hotel_id, chain],
                (err, result) => {
                  if (err) {
                    console.error('Error updating payment info:', err);
                    return res.status(500).json({ error: 'Failed to update payment info.' });
                  }

                  // Send the booking ID to the frontend
                  res.status(200).json({ message: 'Booking created successfully', newBookingId: nextBookingId });
                }
              );
            }
          );
        }
      );
    }
  );
});


//gets employees hotel_id and chain
app.get('/employee/hotelinfo', (req, res) => {
  const { username } = req.query;

  if (!username) {
    return res.status(400).json({ error: 'Username parameter is required' });
  }

  const getHotelIdAndChainQuery = `
    SELECT hotel_id, chain
    FROM employee
    WHERE username = ?;
  `;

  db.query(getHotelIdAndChainQuery, [username], (err, results) => {
    if (err) {
      console.error('Error getting hotel_id and chain:', err);
      return res.status(500).json({ error: 'Internal Server Error' });
    }

    if (results.length === 0) {
      // No employee found with the provided username
      return res.status(404).json({ error: 'Employee not found' });
    }

    const hotelId = results[0].hotel_id;
    const chain = results[0].chain;

    // Return the hotel_id and chain in the response
    res.json({ hotelId, chain });
  });
});

//gets available rooms for hotel employee 
app.get('/available-rooms', (req, res) => {
  const { hotel_id, chain, startDate, endDate, capacity, view, maxPrice } = req.query;

  // Construct the SQL query based on filters
  let sql = `
    SELECT *
    FROM room
    WHERE hotel_id = ? AND chain = ? AND capacity >= ? AND view = ? AND price <= ? 
    AND NOT EXISTS (
      SELECT 1
      FROM booking_renting br
      JOIN booking_date bd ON br.booking_id = bd.booking_id
      WHERE br.hotel_id = room.hotel_id AND br.chain = room.chain
      AND bd.date BETWEEN ? AND ?
      AND br.is_renting IN ('active', 'renting')
      AND br.room_num = room.room_num
    )
  `;

  const params = [hotel_id, chain, capacity, view, maxPrice, startDate, endDate];

  // Execute the query
  db.query(sql, params, (err, results) => {
    if (err) {
      console.error('Error fetching available rooms:', err);
      return res.status(500).json({ error: 'Internal Server Error' });
    }

    // Return the results
    res.json(results);
  });
});

// Create a new customer endpoint
app.post('/customers', (req, res) => {
  const { SSN, name, address, username, password } = req.body;
  
  // Generate registration_date based on current date
  const registration_date = new Date().toISOString().slice(0, 10);

  // Insert the new customer into the database
  const sql = 'INSERT INTO customer (SSN, name, address, registration_date, username, password) VALUES (?, ?, ?, ?, ?, ?)';
  const values = [SSN, name, address, registration_date, username, password];

  db.query(sql, values, (err, result) => {
    if (err) {
      console.error('Error creating new customer:', err);
      return res.status(500).json({ error: 'Failed to create customer' });
    }

    console.log('New customer created:', SSN);

    // Return success response with SSN
    res.status(201).json({ message: 'Customer created successfully', SSN: SSN });
  });
});


// Menu route
app.get('/menu', (req, res) => {
  // Here you would typically render the menu page
  // For now, just send back a response
  res.send('This is the menu page');
});

/// API endpoint to retrieve user profile data using SQL queries
app.get('/api/profile', (req, res) => {
  const { userType, username } = req.query;

  let tableName;
  if (userType === 'employee') {
      tableName = 'employee';
  } else if (userType === 'customer') {
      tableName = 'customer';
  } else {
      return res.status(400).send('Invalid userType');
  }

  const query = `SELECT * FROM ${tableName} WHERE username = ?`;
  db.query(query, [username], (err, results) => {
      if (err) {
          console.error('Error executing MySQL query:', err);
          return res.status(500).send('Internal Server Error');
      }

      if (results.length > 0) {
          // User found, send profile data as HTML
          const profileData = results[0];
          let profileHtml = `<h1>Profile</h1>`;
          for (const key in profileData) {
              profileHtml += `<p><strong>${key}:</strong> ${profileData[key]}</p>`;
          }
          res.send(profileHtml);
      } else {
          // User not found
          res.status(404).send('User not found');
      }
  });
});

// Route to handle updating user profile
app.post('/api/updateProfile', (req, res) => {
  const { name, address, username, role } = req.body;

  console.log('Updating profile:', req.body);
  // Check if username and role are provided

  if (!username || !role) {
    return res.status(401).json({ error: 'Unauthorized' });
  }

  let updateQuery, updateParams;

  if (role === 'customer') {
    updateQuery = 'UPDATE customer SET name = ?, address = ? WHERE username = ?';
    updateParams = [name, address, username];
  } else if (role === 'employee') {
    updateQuery = 'UPDATE employee SET name = ?, address = ? WHERE username = ?';
    updateParams = [name, address, username];
  } else {
    return res.status(400).json({ error: 'Invalid role' });
  }

  db.query(updateQuery, updateParams, (err, results) => {
    if (err) {
      console.error('Error updating profile:', err);
      return res.status(500).json({ error: 'Failed to update profile' });
    }
    return res.status(200).json({ message: 'Profile updated successfully' });
  });
});

//create new hotel
app.post('/api/hotel', (req, res) => {
  const { hotel_id, chain, num_rooms, address, email, rating, manager_SSN } = req.body;

  // Validate required fields
  if (!hotel_id || !chain || !num_rooms || !address || !email || !rating || !manager_SSN) {
    return res.status(400).json({ error: 'Missing required fields' });
  }

  // Prepare SQL statement
  const sql = `
    INSERT INTO hotel (hotel_id, chain, num_rooms, address, email, rating, manager_SSN)
    VALUES (?, ?, ?, ?, ?, ?, ?)
  `;

  // Execute the SQL query with parameters
  db.query(sql, [hotel_id, chain, num_rooms, address, email, rating, manager_SSN], function (err) {
    if (err) {
      console.error(err.message);
      return res.status(500).json({ error: 'Failed to create hotel' });
    }
    console.log(`A new hotel has been added with ID: ${hotel_id}`);
    res.status(201).json({ message: 'Hotel created successfully', hotel_id });
  });
});

//view hotels
app.post('/api/hotels', (req, res) => {
  // SQL query to select hotel information including rating
  const query = `
      SELECT h.hotel_id, h.chain, h.num_rooms, h.address, h.email, hp.phone_num, h.rating
      FROM hotel h
      INNER JOIN hotel_phone hp ON h.hotel_id = hp.hotel_id AND h.chain = hp.chain;
  `;

  // Execute the query
  db.query(query, (err, results) => {
      if (err) {
          console.error('Error fetching hotel data:', err);
          res.status(500).json({ error: 'Failed to fetch hotel data' });
          return;
      }
      res.json(results); // Send hotel data as JSON response
  });
});

//delete hotel function
app.delete('/api/hotels/:hotel_id/:chain', (req, res) => {
  const { hotel_id, chain } = req.params;

  // Check if hotel_id and chain are provided
  if (!hotel_id || !chain) {
    return res.status(400).json({ error: 'Hotel ID and Chain are required' });
  }

  // Delete hotel from database
  const sql = 'DELETE FROM hotel WHERE hotel_id = ? AND chain = ?';
  db.query(sql, [hotel_id, chain], (err, result) => {
    if (err) {
      console.error(err.message);
      return res.status(500).json({ error: 'Failed to delete hotel' });
    }

    // Check if any row was affected
    if (result.affectedRows === 0) {
      return res.status(404).json({ error: 'Hotel not found' });
    }

    console.log(`Hotel with ID ${hotel_id} in chain ${chain} has been deleted`);
    res.status(200).json({ message: 'Hotel deleted successfully' });
  });
});


