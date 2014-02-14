var carousel = document.getElementById('carousel');
var next = document.getElementById('next');
var previous = document.getElementById('previous');
var imgWidth = carousel.getElementsByTagName('img')[0].offsetWidth;

carousel.style.marginLeft = 0;

next.addEventListener('mouseover', show);
next.addEventListener('mouseout', hide);
next.addEventListener('click', toRight);

previous.addEventListener('mouseover', show);
previous.addEventListener('mouseout', hide);
previous.addEventListener('click', toLeft);

function show(e) {
  e.target.style.opacity = 1;
}

function hide(e) {
  e.target.style.opacity = 0.5;
}

// Slides the images to the left or goes back to the first image if it has reached the end
function toLeft(e){
  var targetLeft = parseInt(carousel.style.marginLeft) - imgWidth;

  var slide = window.setInterval(function(){
    var left = parseInt(carousel.style.marginLeft);
    left -= 10;
    carousel.style.marginLeft = left + "px";
    if (left < targetLeft) {
      window.clearInterval(slide);
    }
  },20)
}

// Slides the images to the right or goes back to the last image if it has reached the end
function toRight(){
  var targetLeft = parseInt(carousel.style.marginLeft) + imgWidth;

  var slide = window.setInterval(function(){
    var left = parseInt(carousel.style.marginLeft);
    left += 10;
    carousel.style.marginLeft = left + "px";
    if (left > targetLeft) {
      window.clearInterval(slide);
    }
  },20)
}

//Hook up the next and previous buttons to call the toLeft and toRight functions