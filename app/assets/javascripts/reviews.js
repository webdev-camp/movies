$(function() {
  function displayRating(type) {
    var score = document.getElementById('review_'+type+'_score').value;
    var star = $('[name='+type+'-rating][value='+ score +']');
    score = parseInt(score);
    $(star).prop('checked', true);
  }
  displayRating('plot');
  displayRating('acting');
});

$(function() {
  function setRating(type){
    $('.'+type+'-count').text($('[name="'+type+'-rating"]:checked').val());
    $('.'+type+'-review').on('change','[name="'+type+'-rating"]',function(){
      $('.'+type+'-count').text($('[name="'+type+'-rating"]:checked').val());
      document.getElementById('review_'+type+'_score').value = $('[name="'+type+'-rating"]:checked').val();
    });
  }
setRating('plot');
setRating('acting');
});
