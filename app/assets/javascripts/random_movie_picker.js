$(function(){
  nextSuggestion()
})

function nextSuggestion() {
  $(".next-suggestion").on("click", function(e) {
    e.preventDefault();
    // debugger;
    $.getJSON(this.href).success(function(response){
      var movie = new Suggestion(response.id, response.title, response.director, response.description, response.actors)

      $('.show-card').html("").append(movie.formatSuggestion())
    })
  })
}

function Suggestion(id, title, director, description, actors) {
  this.id = id
  this.title = title
  this.director = director
  this.description = description
  this.actors = actors
}

Suggestion.prototype.formatSuggestion = function() {
  var suggestionHtml = ''
  suggestionHtml += '<h3 class="center">' + this.title + '</h3>'
  suggestionHtml += '<p>Directed by ' + this.director.name + '</p>'

  return suggestionHtml
}

Suggestion.prototype.directorLink = function() {
  let link = '<a href="/directors/' + this.director.id + '">' + this.director.name + '</a>'

  return link
}