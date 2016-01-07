$(document).ready(function(){
  $(".btn-special").click(function(event){
    event.preventDefault();
  });
  $statstring = $('.hidden').clone().get(0).innerHTML
  $('.btn-stat').click(function(){
    $('.links-end').append($statstring);
  });
  
  $playerstring = $('.hidden').clone().get(0).innerHTML
  $('.btn-player').click(function(){
    $('.links-end').append($playerstring);
  });
});
