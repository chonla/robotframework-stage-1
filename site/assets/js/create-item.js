(function () {
  $('#create-form').on('submit', function () {
    show_success('บันทึกสำเร็จ');
    return false;
  });
})();

function show_success(msg) {
  $('#modal-body').html(msg);
  $('#modal').on('hidden.bs.modal', function (e) {
    window.location.href = "go-to-dashboard.html";
  });
  $('#modal').modal();
}
