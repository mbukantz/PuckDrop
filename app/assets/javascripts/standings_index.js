$(document).ready(function(){
  $(".btn-special").click(function(event){
    event.preventDefault();
  });

  $('#wins-trigger').click(function(){
    $('#wins-graph').removeClass('hidden');
  });

  $teamstring = $('.hidden').clone().get(0).innerHTML
  $('.btn-team').click(function(){
    $('.links-end').append($teamstring);
  });

});
