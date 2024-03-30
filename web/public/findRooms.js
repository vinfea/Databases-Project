$(document).ready(function() {
    $('#searchForm').submit(function(e) {
        e.preventDefault();
        let startDate = $('#startDate').val();
        let endDate = $('#endDate').val();
        let capacity = $('#capacity').val();
        // Get other search criteria values
        
        $.ajax({
            type: 'GET',
            url: '/search',
            data: {
                startDate: startDate,
                endDate: endDate,
                capacity: capacity
                // Include other criteria in the data object
            },
            success: function(response) {
                displayRooms(response);
            },
            error: function(xhr, status, error) {
                console.error(xhr.responseText);
            }
        });
    });

    function displayRooms(rooms) {
        let roomList = $('#roomList');
        roomList.empty();
        rooms.forEach(function(room) {
            roomList.append(`<div>Room Number: ${room.room_num}</div>`);
            // Display other room details as needed
        });
    }
});
