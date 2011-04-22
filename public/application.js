function fetch(fragment_name) {
  $.ajax({
    url: "/fragments/" + fragment_name,
    data: $('#search').serialize(),
    success: function(data, status, req) {
      $('#' + fragment_name).append(data);
    },
    error: function(request, status) {
      console.log(status);
    }
  });
}

$(document).ready(function() {
  $('#stop-polling').click(function() {
    if (typeof document.pollId != "undefined" && document.pollId !== null) {
      clearInterval(document.pollId);
    }
  });
});
