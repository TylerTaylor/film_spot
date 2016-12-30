console.log("yeehaw we viewing.js")

$(function(){
  clickedYes()
  newRating()
})

function clickedYes() {
  $("a.clicked-yes").on("click", function(e) {
    e.preventDefault();
    $.get(this.href).success(function(response){
      $(".viewing").html("").append(response);
    })
  })
}

// this (newRating) is a delegated event (http://api.jquery.com/on/)
// Delegated events have the advantage that they can process events from descendant elements that are added to the document at a later time. By picking an element that is guaranteed to be present at the time the delegated event handler is attached, you can use delegated events to avoid the need to frequently attach and remove event handlers. This element could be the container element of a view in a Model-View-Controller design, for example, or document if the event handler wants to monitor all bubbling events in the document. The document element is available in the head of the document before loading any other HTML, so it is safe to attach events there without waiting for the document to be ready.

function newRating() {
  $(document).on("click", ".rating-js", function(e) {
    e.preventDefault();
    $.ajax({
      method: "POST",
      url: e.target.form.action,
      data: $(e.target.form).serialize(),
      dataType: "JSON"
    }).success(function(response){
      // create a JS object
      var newViewing = new Viewing(response.rating)
      var addRating = newViewing.showRating()
      $('.viewing').html("").append(addRating)
    })
  })
}

// Object Constructor //
function Viewing(rating) {
  this.rating = rating
}

// create a function for that object's prototype - format and add it to the current page?
Viewing.prototype.showRating = function() {
  var ratingHtml = ''
  ratingHtml += '<p><strong>You rated this: ' + this.countStars() + ' stars</strong></p>' 

  return ratingHtml
}

// find the appropriate amount of black/white stars to show
Viewing.prototype.countStars = function() {
  var whiteStars = (5 - this.rating)
  // multiply our rating by star codes
  array = (new Array(this.rating+1)).join("&#9733;")
  whiteArray = (new Array(whiteStars+1)).join("&#9734;")
  stars = array += whiteArray
  
  return stars
}