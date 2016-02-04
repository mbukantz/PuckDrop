$(document).ready(function(){
  $(".links").click(function(event){
    event.preventDefault();
  });
  $('#video_links').click(function(){
    $('#new_video').removeClass('hidden');
  });
});
