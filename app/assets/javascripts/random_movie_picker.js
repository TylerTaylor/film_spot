$(function(){
  nextSuggestion()
})

function nextSuggestion() {
  $(".next-suggestion").on("click", function(e) {
    e.preventDefault();
    // debugger;
    $.getJSON(this.href).success(function(response){
      let user = this.url.replace('http://localhost:3000/movies/random_movie_picker?user_id=','')

      var movie = new Suggestion(response.id, response.title, response.director, response.description, response.actors, user)

      $('.show-card').html("").append(movie.formatSuggestion())
      $('.show-card').append(movie.viewingLink())
    })
  })
}

function Suggestion(id, title, director, description, actors, intended_user) {
  this.id = id
  this.title = title
  this.director = director
  this.description = description
  this.actors = actors
  this.intended_user = intended_user
}

Suggestion.prototype.formatSuggestion = function() {
  let html = ''
  html += `<h3 class="center">${this.title}</h3><hr>`
  html += this.directorLink()
  html += '<p>Starring:</p>'
  html += this.actorsLinks()

  return html
}

Suggestion.prototype.directorLink = function() {
  let html = `<p>Directed by <a href="/directors/${this.director.id}">${this.director.name}</a></p>`

  return html
}

Suggestion.prototype.actorsLinks = function() {
  let html = ''
  let actors = this.actors

  for (let i = 0; i < actors.length; i++) {
    html += `<a href="/actors/${actors[i].id}">${actors[i].name}</a><br>`
  }

  return html
}

Suggestion.prototype.viewingLink = function() {
  let html = '<div class="viewing center"><p>Have you seen this movie?</p>'
  
  html += `<p><a class="clicked-yes" href="/users/${this.intended_user}/viewings/new?movie_id=${this.id}">Yes</a>`

  return html
}