$(function(){
  // grab the director link
  $(".director-js").on("click", function(e){
    e.preventDefault();
    $.getJSON(this.href).success(function(resp){
      let director = new Director(resp.id, resp.movies, resp.name)
      let movies = director.formatMovies()

      director.toggleMovies()
      // toggleMovies(director, movies)
      // $(`.director-${director.id}`).append(movies)
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
  html = '<div class="director-movies">'
  let movies = this.movies

  for (let i = 0; i < movies.length; i++) {
    html += `<a href="/movies/${movies[i].id}">${movies[i].title}</a><br>`
  }

  html += '<br></div>'

  return html
}

let showingMovies = false

// function toggleMovies(director, formattedMovies) {
//   if (showingMovies == false) { // if we aren't currently displaying a director's movies
//     $(`.director-${director.id}`).append(formattedMovies); // display them
//     showingMovies = true
//   } else if (showingMovies == true) { // if the movies are displaying
//     $('.director-movies').remove() // remove the div
//     showingMovies = false 
//   }
// }

Director.prototype.toggleMovies = function() {
  if (showingMovies == false) { // if we aren't currently displaying a director's movies
    $(`.director-${this.id}`).append(this.formatMovies()); // display them
    showingMovies = true
  } else if (showingMovies == true) { // if the movies are displaying
    $('.director-movies').remove() // remove the div
    showingMovies = false 
  }
}