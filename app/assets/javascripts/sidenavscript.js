$("#menu-toggle").click(function(e) {
  e.preventDefault();
  $("#wrapper").toggleClass("toggled");
});

$(document).ready(function(){
  $("#current").click(function(){
    $(".current_card").toggle();
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

  $(".feature_form_current").hide();

  $("button#add_current_feature").click(function(){
    $(".feature_form_current").toggle();
  });

  $(".feature_form_backlog").hide();

  $("button#add_backlog_feature").click(function(){
    $(".feature_form_backlog").toggle();
  });


  $(".feature_form_icebox").hide();

  $("button#add_icebox_feature").click(function(){
    $(".feature_form_icebox").toggle();
  });
  
  $('.common').multiselect();
});