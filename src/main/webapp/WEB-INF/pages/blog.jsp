<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
<title>Google Maps JavaScript API v3 Example: Distance Matrix</title>

    <!-- jQuery -->
    <script src="resources/js/jquery.js"></script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script type="text/javascript">
var map;
var origin = "12 St James' Rd, Mitcham CR4, United Kingdom"
var destinations = [
    "6 Cambrian Green, London NW9, United Kingdom"];
var directionsDisplay;
var directionsService = new google.maps.DirectionsService();

function calculateDistances() {
    var service = new google.maps.DistanceMatrixService();
    service.getDistanceMatrix({
        origins: [origin], //array of origins
        destinations: destinations, //array of destinations
        travelMode: google.maps.TravelMode.DRIVING,
        unitSystem: google.maps.UnitSystem.METRIC,
        avoidHighways: false,
        avoidTolls: false
    }, callback);
}

function callback(response, status) {
    if (status != google.maps.DistanceMatrixStatus.OK) {
        alert('Error was: ' + status);
    } else {
        //we only have one origin so there should only be one row
        var routes = response.rows[0];
        var sortable = [];
        for (var i = routes.elements.length - 1; i >= 0; i--) {
            var rteLength = routes.elements[i].duration.value;
            sortable.push([destinations[i], rteLength]);
        }
        
        //build the waypoints.
        var waypoints = [];
        for (j = 0; j < sortable.length - 1; j++) {
            console.log(sortable[j][0]);
            waypoints.push({
                location: sortable[j][0],
                stopover: true
            });
        }
        //start address == origin
        var start = origin;
        //end address is the furthest desitnation from the origin.
        var end = sortable[sortable.length - 1][0];
        //calculate the route with the waypoints        
        calculateRoute(start, end, waypoints);
 
    }
}

//Calculate the route of the shortest distance we found.
function calculateRoute(start, end, waypoints) {
    var request = {
        origin: start,
        destination: end,
        waypoints: waypoints,
        optimizeWaypoints: true,
        travelMode: google.maps.TravelMode.DRIVING
    };
    directionsService.route(request, function (result, status) {
        if (status == google.maps.DirectionsStatus.OK) {
            directionsDisplay.setDirections(result);
        }
    });
}

function initialize() {
    directionsDisplay = new google.maps.DirectionsRenderer();
    var centerPosition = new google.maps.LatLng(38.713107, -90.42984);
    var options = {
        zoom: 12,
        center: centerPosition,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map($('#map')[0], options);
    geocoder = new google.maps.Geocoder();
    directionsDisplay.setMap(map);
    calculateDistances();
}

google.maps.event.addDomListener(window, 'load', initialize);
</script>
<style>
body {
  font-family: sans-serif;
}
#map {
    width: 450px;
    height: 400px;
}
</style>
</head>
<body>
<div id="container">
<div id="results"></div>
<div id="map"></div>
</div>
</body>
</html>