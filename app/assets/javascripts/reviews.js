$(function rating() {
  var plot = document.getElementById('review_plot_score').value;
  plot = parseInt(plot);
  if (plot > 0) {
    var thing = $('[name=plot-rating][value='+ plot +']');
    $(thing).prop('checked', true);
    $('.plot-count').text($('[name="plot-rating"]:checked').val());
  // } else {
    // $('input[name="plot-rating"]').prop('checked', false);
  }
    $('.plot-review').on('change','[name="plot-rating"]',function(){
  	   $('.plot-count').text($('[name="plot-rating"]:checked').val());
  	   document.getElementById('review_plot_score').value = $('[name="plot-rating"]:checked').val();
     });
   });

$(function rating() {
  var acting = document.getElementById('review_acting_score').value;
  acting = parseInt(acting);
  if (acting > 0) {
    var thing = $('[name=acting-rating][value='+ acting +']');
    $(thing).prop('checked', true);
    $('.acting-count').text($('[name="acting-rating"]:checked').val());

  // } else {
    // $('input[name="acting-rating"]').prop('checked', false);
  }
   $('.acting-review').on('change','[name="acting-rating"]',function(){
 	   $('.acting-count').text($('[name="acting-rating"]:checked').val());
     document.getElementById('review_acting_score').value = $('[name="acting-rating"]:checked').val();
    });
  });
