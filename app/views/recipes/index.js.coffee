if (!$("#content").has("#content-index").length)
  
  $("#content").addClass('animated bounceOutLeft')
  $("#content").one 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', () ->
    $("this").empty()
    $("#content").html( "<%= j render( "/recipes/index" ) %>")
    $("#content").removeClass("bounceOutLeft")
    $("#content").addClass("bounceInRight")
    rainbowify()
    fixHeight()

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