console.log("yeehaw we viewing.js")

// $(function(){
//   $("a.clicked-yes").on("click", function(e) {
//     // fire some ajax
//     // debugger;
//     $.ajax({
//       method: "GET",
//       url: this.href // what URL should we fire this request to?
//     }).done(function(data){
//       // get a response (data)
//       // debugger;
//       $(".viewing").html("").append(data);
//       // load that response into the HTML of the page
//     })


//     e.preventDefault();
//   });

  
// });


$(function(){
  bindClick()
})

function bindClick() {
  $("a.clicked-yes").on("click", function(e) {
    e.preventDefault();
    $.get(this.href).success(function(response){
      $(".viewing").html("").append(response);
    })
  })
}