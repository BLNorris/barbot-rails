

$( document ).ready(function() {
  
  
  $( "[id^=recipe_amounts_attributes]" ).change(function() {
    
    if  ( parseInt($(this).val()) > 0 ){
      $(this).parent().css("background-color","green")
    }else{
      $(this).parent().css("background-color","#008cba")
    }

    
    //alert("ding");

  });
  
  $(document).ready(function() {
    $(window).load(function() {
      boxes = $('.height-fix');
      maxHeight = Math.max.apply(
      Math, boxes.map(function() {
        return $(this).height();
      }).get());
      boxes.height(maxHeight);
    });
  });
  
});