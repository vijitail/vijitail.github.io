/*!
 * flagship v0.0.1
 * A description for your project.
 * (c) 2019 Vijit Ail
 * MIT License
 * http://link-to-your-git-repo.com
 */

function calcTransform() {
  var matrix = $('.services-carousel-item-wrapper').css('transform').replace(/[^0-9\-.,]/g, '').split(',');
  var x = matrix[12] || matrix[4];
  var y = matrix[13] || matrix[5];
  var xP = x / $('.services-carousel-item-wrapper').width() * 100; 
  if(isNaN(xP)) return 0 
  return xP
}

var len = 5;

var windowWidth = $(window).width() + 14;
var current = 4;
if(windowWidth <= 1024) {
  current = 3
}
if(windowWidth <= 768) {
  current = 2
}
if(windowWidth <= 600) {
  current = 1
}

var originalCurrent = current;

var canSlideNext = len - current;
var canSlideBack = 0;

$('.carousel-control-next[href="#services-carousel"]').click(function() {
  console.log('Next',canSlideNext);
  console.log('Back',canSlideBack);
  if(canSlideNext > 0) {
    $('.services-carousel-item-wrapper').css('transform', 'translateX('+ parseInt(calcTransform() - 20) +'%)');
    canSlideNext--;
    canSlideBack++;
  } else {
    current = originalCurrent;
    canSlideNext = len - current;
    canSlideBack = 0;
    $('.services-carousel-item-wrapper').css('transform', 'translateX(0%)')
  };
});

$('.carousel-control-prev[href="#services-carousel"]').click(function() {
  console.log('Next',canSlideNext);
  console.log('Back',canSlideBack);
  if(canSlideBack > 0) {
    $('.services-carousel-item-wrapper').css('transform', 'translateX('+ parseInt(calcTransform() + 20) +'%)');
    canSlideBack--;
    canSlideNext++;
  } else {
    $('.services-carousel-item-wrapper').css('transform', 'translateX('+ parseInt(calcTransform() - (canSlideNext * 20)) +'%)');
    canSlideBack=canSlideNext;
    canSlideNext=0;
  };
});

/**
 * Element.matches() polyfill (simple version)
 * https://developer.mozilla.org/en-US/docs/Web/API/Element/matches#Polyfill
 */
if (!Element.prototype.matches) {
	Element.prototype.matches = Element.prototype.msMatchesSelector || Element.prototype.webkitMatchesSelector;
}