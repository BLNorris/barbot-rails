

$( document ).ready(function() {
  
  
  $( "[id^=recipe_amounts_attributes]" ).change(function() {
    
    if  ( parseInt($(this).val()) > 0 ){
      $(this).parent().css("background-color","green")
    }else{
      $(this).parent().css("background-color","#008cba")
    }

    
    //alert("ding");

  });
  

    $(window).load(fixHeight());


  
  
  
  rainbowify();
  
});

function fixHeight() {
      boxes = $('.height-fix');
      maxHeight = Math.max.apply(
      Math, boxes.map(function() {
        return $(this).height();
      }).get());
      boxes.height(maxHeight);
    }

function rainbowify(){
  
  var countOfColors = 20;
  
  $(".rainbow").each(function(){
    $(this).css("background-color", rainbow(countOfColors, [Math.round(Math.random() * countOfColors)]));
  });
  
  $(".rainbow")
    .mouseenter(function() {
      $( this ).darken({'percent': 20})
    })
    .mouseleave(function() {
      $( this ).lighten({'percent': 25})
    });
  
    $(".upvote").click(function(){
      rating = $.ajax({
        url: "/recipe/upvote",
        type: "post"
        
      })
      
    });
}

function rainbow(numOfSteps, step) {
    // This function generates vibrant, "evenly spaced" colours (i.e. no clustering). This is ideal for creating easily distinguishable vibrant markers in Google Maps and other apps.
    // Adam Cole, 2011-Sept-14
    // HSV to RBG adapted from: http://mjijackson.com/2008/02/rgb-to-hsl-and-rgb-to-hsv-color-model-conversion-algorithms-in-javascript
    var r, g, b;
    var h = step / numOfSteps;
    var i = ~~(h * 6);
    var f = h * 6 - i;
    var q = 1 - f;
    switch(i % 6){
        case 0: r = 1, g = f, b = 0; break;
        case 1: r = q, g = 1, b = 0; break;
        case 2: r = 0, g = 1, b = f; break;
        case 3: r = 0, g = q, b = 1; break;
        case 4: r = f, g = 0, b = 1; break;
        case 5: r = 1, g = 0, b = q; break;
    }
    var c = "#" + ("00" + (~ ~(r * 255)).toString(16)).slice(-2) + ("00" + (~ ~(g * 255)).toString(16)).slice(-2) + ("00" + (~ ~(b * 255)).toString(16)).slice(-2);
    return (c);
}