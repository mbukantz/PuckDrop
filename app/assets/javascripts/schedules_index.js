$(document).ready(function(){
  $(".btn-special").click(function(event){
    event.preventDefault();
  });
  $schedulestring = $('#schedules').clone().get(0).innerHTML
  $('.btn-sched').click(function(){
    $('.links-top').append($schedulestring);
  });
});
