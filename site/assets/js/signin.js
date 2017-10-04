(function() {
  $('#signin-form').on('submit', function() {
    var credential = ['demouser', 'demopassword'];
    var user_credential = [$('#inputUser').val(), $('#inputPassword').val()];

    if (credential !== user_credential) {
      show_error('ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง');
      return false;
    } else {
      window.location.href = "dashboard.html";
    }
  });
})();

function show_error(msg) {
  $('#modalBody').html(msg);
  $('#modal').modal();
}