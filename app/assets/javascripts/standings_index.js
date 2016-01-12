$(document).ready(function(){
  $(".btn-special").click(function(event){
    event.preventDefault();
  });
  $teamstring = $('.hidden').clone().get(0).innerHTML
  $('.btn-team').click(function(){
    $('.links-end').append($teamstring);
  });
});
