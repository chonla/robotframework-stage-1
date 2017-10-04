(function() {
  $('form').on('submit', function() {
    var credential = ['demouser', 'demopassword'];

    if ($('input[type="text"]').val() !== credential[0] || $('input[type="password"]').val() !== credential[1]) {
      show_error('ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง');
      return false;
    }
  });
})();

function show_error(msg) {
  $('#modalBody').html(msg);
  $('#modal').modal();
}