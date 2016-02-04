$(document).ready(function(){
  $(".links").click(function(event){
    event.preventDefault();
  });
  $('#news_links').click(function(){
    $('#new_article').removeClass('hidden');
  });
});
