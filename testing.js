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
        IFNULL((SELECT MAX(booking_id) FROM booking_renting WHERE hotel_id = ? AND chain = ?), 0) + 1 AS booking_id, 
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

  
  //CREATE DIRECT BOOKING

//show all available rooms in hotel from hotel_id and chain between the specified days, specify based on capacity and view and price 
CREATE TABLE room (
	room_num INT,
    hotel_id INT,
    chain VARCHAR(20),
    price DECIMAL(6, 2),
    capacity INT,
    view ENUM('mountainside', 'oceanside'),
    extendible BOOLEAN,
);

CREATE TABLE booking_renting (
	booking_id INT,
	room_num INT,
    hotel_id INT,
	chain VARCHAR(20),
    customer_SSN VARCHAR(9),
    is_renting ENUM('active', 'renting', 'cancelled', 'archived'),
    CONSTRAINT PK_booking_renting PRIMARY KEY(booking_id, hotel_id, chain)
);

CREATE TABLE booking_date (
	booking_id INT,
	hotel_id INT,
    chain VARCHAR(20),
    date DATE,
    CONSTRAINT PK_booking_date PRIMARY KEY (booking_id, hotel_id, chain, date)
);

//in the rows of the table, there should be a book function that redirects with parameters (containing hotel id, chain, start date, end date, room number)

//have button that allows people to directly book a room
//plan: help customer create an account 
 CREATE TABLE customer (
  SSN VARCHAR(9),
    name VARCHAR(25),
    address VARCHAR(50),
    registration_date DATE,
    PRIMARY KEY (SSN)
);

CREATE TABLE booking_payment (
	booking_id INT,
    hotel_id INT,
    chain VARCHAR(20),
    cc_number CHAR(16),
    exp_date DATE,
    ccv CHAR(3),
    CONSTRAINT PK_booking_payment PRIMARY KEY (booking_id, hotel_id, chain)
);


//in each row there should be a book function that redirects with parameters (containing hotel id, chain, start date, end date, room number), should rediect users with a new page that has a form to fill in customer information and booking payment information
//create a submit form should also take parameters of the row: room_num, hotel_id, chain, startDate, endDate (these can all be derived from form fields on the page)
//create a form that customers to fill in customer information: SSN, name, address, autofill current registration date, username, password, it should also include booking_payment information: cc_number, exp_date, ccv
//when you submit the form, it should run these two queries:

  app.post('/customers', (req, res) => {
    const { SSN, name, address, registration_date, username, password} = req.body;}


    app.post('/createDirectBooking', (req, res) => {
      const { room_num, hotel_id, chain, customer_SSN, startDate, endDate, cc_number, exp_date, ccv } = req.body;

//then it should parse the booking_id in response json from create direct booking
    
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
    