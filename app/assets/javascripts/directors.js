$(function(){
  // grab the director link
  $(".director-js").on("click", function(e){
    e.preventDefault();
    $.getJSON(this.href).success(function(response){
      debugger;
    })
  })
})

// make director object

// format director's movies