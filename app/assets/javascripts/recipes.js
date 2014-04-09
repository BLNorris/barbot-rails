

$( document ).ready(function() {
  
  
  $( ".ingredient-select" ).click(function() {
    $(this).css("background-color", "#00BA34");

    var myCheckbox = $(this).parent().prev();
    
    //alert(myCheckbox.html());
    if(myCheckbox.is(':checked')){
        myCheckbox.prop('checked', false);
        $(this).css("background-color", "##008cba");
        
      }
    else{   //notchecked
        myCheckbox.prop('checked', true);
        //myCheckbox.hide();
        $(this).css("background-color", "#00BA34");
 
      }
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