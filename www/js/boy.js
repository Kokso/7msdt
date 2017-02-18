var mouseX = 0, mouseY = 0;
var xp = 0, yp = 0, dxp = 0, dyp = 0;
var width, height;
var boy, dragon;
var d_orientation = 0;
            
$(document).mousemove(function(e){
    mouseX = e.pageX;
    mouseY = e.pageY;
    width = $(window).width();
    height = $(window).height();
    boy = $( "#boy" );
    dragon = $( "#dragon" );
});

setInterval(function(){
    xp += (mouseX - xp) / 32;
              
    if (xp > (width/2+315))
        xp = width/2+315;
    if (xp < (width/2-315))
        xp = width/2-315; 
    boy.css({
        left:(xp-45)
    });
}, 30);

setInterval(function(){
    if (d_orientation === 0 && dxp < mouseX) { 
        dragon.css({
            'background': 'url("./www/images/sun.png") no-repeat center'
        }); 
        d_orientation = 1;
    } else if (d_orientation === 1 && dxp > mouseX) {
        dragon.css({
            'background': 'url("./www/images/sun.png") no-repeat center'
        });
        d_orientation = 0;
    }
        
    dxp += (mouseX - dxp) / 12;
    dyp += (mouseY - dyp) / 12;
        
    if (dxp > (width-90))
        dxp = width-90;
    if (dyp > (height-200))
        dyp = height-200;
    dragon.css({
        left:dxp-86, 
        top:dyp
    });
}, 30);