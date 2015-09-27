function initializeAutocomplete(id) {
  var element = document.getElementById(id);
  if (element) {
    var autocomplete = new google.maps.places.Autocomplete(element, { types: ['geocode'] });
    google.maps.event.addListener(autocomplete, 'place_changed',  function() {
    //	var place = this.getPlace(); console.log(place);
    	element.setAttribute("address", element.value);
    	element.setAttribute("found", "true");
    	});

  }
  
  $("#"+id).keyup(function() {
	  $(this).attr("found",$(this).attr("address")==element.value);
	});
}
 

google.maps.event.addDomListener(window, 'load', function() {
	  initializeAutocomplete('address_from');
	  initializeAutocomplete('address_to');
});