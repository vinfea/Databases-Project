$(document).ready(function() {
    $('#loginForm').submit(function(e) {
        e.preventDefault();
        let userType = $('#userType').val();
        let username = $('#username').val();
        let password = $('#password').val();
        console.log(userType, username, password)

        // AJAX POST request to Express.js backend
        $.ajax({
            type: 'POST',
            url: '/login',
            data: JSON.stringify({ userType, username, password }),
            contentType: 'application/json',
            success: function(response) {
                console.log(response);
                // Redirect to menu page upon successful login
                localStorage.setItem('username', username);
                localStorage.setItem('role', userType);
                console.log('Stored in localStorage:', localStorage.getItem('username'), localStorage.getItem('role'));
                window.location.href = '/menu.html';
                
            },
            error: function(xhr, status, error) {
                console.error(xhr.responseText);
                // Handle error response, e.g., show error message
            }
        });
    });
});
