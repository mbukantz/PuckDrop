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
