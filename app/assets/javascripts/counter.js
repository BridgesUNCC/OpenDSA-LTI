$(function() {

  function count($this) {
    var aj = $.ajax({
      url: "/odsa_exercise_progresses/get_count",
      type: 'get',
      data: $(this).serialize()
    }).done(function(data) {
      $this.html(data['practiced_ex']);
    }).fail(function(data) {
      console.log('AJAX request has FAILED');
    });

    setTimeout(function() {
      count($this)
    }, 10000);
  }

  $stat_count = $(".stat-count");
  if ($stat_count.length) {
    count($stat_count);
  }
});