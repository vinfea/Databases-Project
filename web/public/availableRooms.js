// Fetch items from Express API endpoint
// Function to fetch data from the API
function fetchAvailableRoomsPerCity() {
    fetch('http://localhost:3000/api/available-rooms-per-city')
      .then(response => {
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        return response.json();
      })
      .then(data => {
        displayAvailableRoomsPerCity(data);
      })
      .catch(error => {
        console.error('Error fetching data:', error);
      });
  }
  
  // Function to display the data on the frontend
  function displayAvailableRoomsPerCity(data) {
    const itemList = document.getElementById('itemList');
    itemList.innerHTML = ''; // Clear previous content
  
    //create table 
    const table = document.createElement('table');

    //create table header row
    const headerRow=table.createTHead().insertRow();
    const cityHeader=headerRow.insertCell();
    cityHeader.textContent='City';
    const availableRoomsHeader=headerRow.insertCell();
    availableRoomsHeader.textContent='Available Rooms:';
    
    //create table body
    const tableBody=table.createTBody();

    //populate table with data
    data.forEach(item => {
      const row= tableBody.insertRow();
      const cityCell=row.insertCell();
      cityCell.textContent=item.city;
      const availableRoomsCell=row.insertCell();
      availableRoomsCell.textContent=item.available_rooms_count;
      availableRoomsCell.style.textAlign = 'center'; 

    });

    //append table to the itemlist container
    itemList.appendChild(table);
  }
  
  // Call the function to fetch and display data when the page loads
  document.addEventListener('DOMContentLoaded', () => {
    fetchAvailableRoomsPerCity();
  });
  
