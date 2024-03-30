// Fetch items from Express API endpoint
// Function to fetch data from the API
function fetchAggregatedRoomCapacity() {
    fetch('http://localhost:3000/api/aggregated-room-capacity-view')
      .then(response => {
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        return response.json();
      })
      .then(data => {
        displayAggregatedRoomCapacity(data);
      })
      .catch(error => {
        console.error('Error fetching data:', error);
      });
  }
  
  // Function to display the data on the frontend
  function displayAggregatedRoomCapacity(data) {
    const itemList = document.getElementById('itemList');
    itemList.innerHTML = ''; // Clear previous content
  
    //create table 
    const table = document.createElement('table');

    //create table header row
    const headerRow=table.createTHead().insertRow();
    const chainHeader=headerRow.insertCell();
    chainHeader.textContent='Chain:';
    const hotelidHeader=headerRow.insertCell();
    hotelidHeader.textContent='Hotel ID:';
    const totalCapacity=headerRow.insertCell();
    totalCapacity.textContent='Total Capacity:';
    
    //create table body
    const tableBody=table.createTBody();

    //populate table with data
    data.forEach(item => {
      const row = tableBody.insertRow();
      const chainCell = row.insertCell();
      chainCell.textContent = item.chain; 
      const hotelidCell = row.insertCell();
      hotelidCell.textContent = item.hotel_id;
      hotelidCell.style.textAlign = 'center';
      const totalCapacityCell = row.insertCell();
      totalCapacityCell.textContent = item.total_capacity;
      totalCapacityCell.style.textAlign = 'center'; 
    });
    

    //append table to the itemlist container
    itemList.appendChild(table);
  }
  
  // Call the function to fetch and display data when the page loads
  document.addEventListener('DOMContentLoaded', () => {
    fetchAggregatedRoomCapacity();
  });
  
