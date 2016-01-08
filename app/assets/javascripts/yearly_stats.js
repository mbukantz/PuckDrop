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

$(document).ready(function(){
  $('.content').click(function(event){
    event.preventDefault();
  });
  $('.goalie-toggle').on('click',function() {
    $('.skater').hide();
    $('.goalie').removeClass('hidden');
  });
  $('.skater-toggle').on('click',function() {
    $('.goalie').addClass('hidden');
    $('.skater').show();
  });
});
