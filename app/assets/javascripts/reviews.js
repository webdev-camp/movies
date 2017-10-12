$(function rating() {
  $('input[name="plot-rating"]').prop('checked', false);
    $('.plot-review').on('change','[name="plot-rating"]',function(){
  	   $('.plot-count').text($('[name="plot-rating"]:checked').val());
  	   document.getElementById('review_plot_score').value = $('[name="plot-rating"]:checked').val();
     });
   });

   $(function rating() {
     $('input[name="acting-rating"]').prop('checked', false);
       $('.acting-review').on('change','[name="acting-rating"]',function(){
     	   $('.acting-count').text($('[name="acting-rating"]:checked').val());
         document.getElementById('review_acting_score').value = $('[name="acting-rating"]:checked').val();
        });
      });
