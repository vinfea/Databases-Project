// Retrieve data from localStorage
let username = localStorage.getItem('username');
let role = localStorage.getItem('role');

// Display username and role somewhere in the HTML
document.getElementById('usernameDisplay').textContent = username;
document.getElementById('roleDisplay').textContent = role;
