$(document).on("page:update", function() {
  
  //Image Grid Layout
  var $grid = $('.grid').masonry({
    // set itemSelector so .grid-sizer is not used in layout
    itemSelector: '.grid-item',
    // use element for option
    columnWidth: '.grid-sizer',
    percentPosition: true
  })
  
  
  $grid.imagesLoaded().progress( function() {
    $grid.masonry('layout');
  });
  
})







