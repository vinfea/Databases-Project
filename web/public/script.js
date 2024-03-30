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
  
    data.forEach(item => {
      const li = document.createElement('li');
      li.textContent = `City: ${item.city}, Available Rooms Count: ${item.available_rooms_count}`;
      itemList.appendChild(li);
    });
  }
  
  // Call the function to fetch and display data when the page loads
  document.addEventListener('DOMContentLoaded', () => {
    fetchAvailableRoomsPerCity();
  });
  
