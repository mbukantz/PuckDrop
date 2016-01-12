$(document).ready(function(){
  $(".btn-special").click(function(event){
    event.preventDefault();
  });
  $teamstring = $('.hidden').clone().get(0).innerHTML
  $('.btn-team').click(function(){
    $('.links-end').append($teamstring);
  });

  $(".ws").click(function(event){
    event.preventDefault();
  });
  $('.ws').dblclick(function(){
    $('.ws').hide();
  });
  $('.ws').dblclick(function(){
    $('.ws-show').show();
  });
});
