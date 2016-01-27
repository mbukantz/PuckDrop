$(document).ready(function(){
  $(".links-top").click(function(event){
    event.preventDefault();
  });
  $('.btn-sched').click(function(){
    $('#schedules').removeClass('hidden')
  });
});
