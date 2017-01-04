$(function(){
  // grab the director link
  $(".director-js").on("click", function(e){
    e.preventDefault();
    $.getJSON(this.href).success(function(resp){
      let director = new Director(resp.id, resp.movies, resp.name)
      let movies = director.formatMovies()
      
    })
  })
})

// make director object
function Director(id, movies, name) {
  this.id = id
  this.movies = movies
  this.name = name
}

// format director's movies
Director.prototype.formatMovies = function() {
  html = ''
  let movies = this.movies

  for (let i = 0; i < movies.length; i++) {
    html += `<a href="/movies/${movies[i].id}">${movies[i].title}</a>`
  }

  return html
}