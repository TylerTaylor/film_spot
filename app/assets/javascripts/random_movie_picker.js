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
  let html = ''
  html += '<h3 class="center">' + this.title + '</h3>'
  // html += '<p>Directed by ' + this.director.name + '</p>'
  html += this.directorLink()
  html += '<p>Starring:</p>'
  html += this.actorsLinks()

  return html
}

Suggestion.prototype.directorLink = function() {
  let html = '<p>Directed by <a href="/directors/' + this.director.id + '">' + this.director.name + '</a></p>'

  return html
}

Suggestion.prototype.actorsLinks = function() {
  let html = ''
  let actors = this.actors

  for (let i = 0; i < actors.length; i++) {
    html += '<a href="/actors/' + actors[i].id + '">' + actors[i].name + '</a><br>'
  }

  return html
}