$(function(){
  // grab the director link
  $(".director-js").on("click", function(e){
    e.preventDefault();
    $.getJSON(this.href).success(function(resp){
      let director = new Director(resp.id, resp.movies, resp.name)
      
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