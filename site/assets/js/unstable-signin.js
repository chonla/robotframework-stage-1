(function() {
  $('#signin-form').on('submit', function() {
    var credential = ['demouser', 'demopassword'];
    var success_chance = 30;

    if ($('#inputUser').val() !== credential[0] || $('#inputPassword').val() !== credential[1]) {
      show_error('ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง');
      return false;
    }

    var hit = parseInt(Math.random() * 100, 10);
    if (hit > success_chance) {
      show_error('ไม่สามารถติดต่อ API ได้');
      return false;
    }
  });
})();

function show_error(msg) {
  $('#modalBody').html(msg);
  $('#modal').modal();
}