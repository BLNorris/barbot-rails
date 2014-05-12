jQuery ->
  
  #disable cache to fix back button issue
  $.ajaxSetup cache: false
  
  $(document).change "[id^=recipe_amounts_attributes]", () ->
    
    if parseInt($(this).val()) > 0
      $(this).parent().css("background-color","green")
    else if parseInt($(this).val()) <= 0
      $(this).parent().css("background-color","red")
    else
      $(this).parent().css("background-color","#008cba")
  
  # Reloads it when you do tha ajax calls
  $(window).load(fixHeight());
  
  #I should really change this to get a better selection of colors
  rainbowify()

fixHeight = () ->
      boxes = $('.height-fix');
      maxHeight = Math.max.apply Math, boxes.map () ->
        $(this).height()
      boxes.height(maxHeight)

rainbowify = () ->
  
  colors = new Array("#1ABC9C","#2ecc71","#3498db","#9b59b6","#34495e","#f1c40f","#e67e22", "#e74c3c")
  
  $(".rainbow").each () ->
    $(this).css("background-color", colors[Math.floor(Math.random() * colors.length)])
  
  $(".rainbow")
    .mouseenter () ->
      $( this ).darken 'percent': 20
    .mouseleave () ->
      $( this ).lighten 'percent': 25
