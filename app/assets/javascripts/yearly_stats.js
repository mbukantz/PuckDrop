$(document).ready(function(){
  $(".btn-special").click(function(event){
    event.preventDefault();
  });
  $('.btn-stat').click(function(){
    $('#stats').removeClass('hidden');
    $('#players').addClass('hidden');
  });
  $('.btn-player').click(function(){
    $('#players').removeClass('hidden');
    $('#stats').addClass('hidden');
  });
});

$(document).ready(function(){
  $('.content').click(function(event){
    byebug;
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
