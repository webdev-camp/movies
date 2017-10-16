function displayRating(type) {
  var score = document.getElementById('review_'+type+'_score').value;
  var star = $('[name='+type+'-rating][value='+ score +']');
  $(star).prop('checked', true);
}

jQuery(function() {
  displayRating('plot');
  displayRating('acting');
});

function type_class(type, kind) {
  return '.'+type+'-' + kind ;
}

function setRating(type){
  var type_count_class = type_class(type, "count") ;
  var type_review_class = type_class(type, "review") ;
  var rating_selector = '[name="'+type+'-rating"]:checked' ;
  var rating_value = $(rating_selector).val() ;
  $(type_count_class).text(rating_value );
  $(type_review_class).on('change',rating_selector ,function(){
    $(type_count_class).text($(rating_selector).val());
    document.getElementById('review_'+type+'_score').value = $(rating_value)
  });
}

$(function() {
  setRating('plot');
  setRating('acting');
});
