$("#menu-toggle").click(function(e) {
  e.preventDefault();
  $("#wrapper").toggleClass("toggled");
});

$(document).ready(function(){
  $("#current").click(function(){
    $(".current_card").hide();
  });
  $(".current_link").click(function(){
    $(".current_card").show();
  });
  $("#backlog").click(function(){
    $(".backlog_card").hide();
  });
  $(".backlog_link").click(function(){
    $(".backlog_card").show();
  });
  $("#icebox").click(function(){
    $(".icebox_card").hide();
  });
  $(".icebox_link").click(function(){
    $(".icebox_card").show();
  });
});


