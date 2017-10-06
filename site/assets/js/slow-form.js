(function () {
  slow_present();
  $('#create-form').on('submit', function () {
    show_success('บันทึกสำเร็จ');
    return false;
  });
})();

function slow_present() {
  setTimeout(function () {
    $('#loading').hide();
    $('#create-form').show();
  }, 5000);
}

function show_success(msg) {
  $('#modal-body').html(msg);
  $('#modal').on('hidden.bs.modal', function (e) {
    window.location.href = "go-to-dashboard.html";
  });
  $('#modal').modal();
}
