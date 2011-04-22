function fetch(fragment_name) {
  $.ajax({
    url: "/fragment/" + fragment_name,
    data: $('#search').serialize(),
    success: function(data, status, req) {
      $('#' + fragment_name).html(data);
    },
    error: function(request, status) {
      console.log(status);
    }
  });
}