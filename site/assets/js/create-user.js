(function () {
  $('#create-form').on('submit', function () {
    var name = $('#inputName').val();
    var login = $('#inputLogin').val();
    var password = $('#inputPassword').val();
    var password2 = $('#inputPassword2').val();
    if (password === password2) {
      create_user(name, login, password);
    } else {
      show_error('รหัสผ่านไม่ตรงกับรหัสผ่านยืนยัน');
    }
    return false;
  });
})();

function create_user(u, l, p) {
  $('#modalLoading').on('shown.bs.modal', function () {
    $('#modalLoading').off('shown.bs.modal');
    var db = firebase.database();
    console.log(l);
    db.ref("users").orderByChild("login").equalTo(l).once("value", function (data) {
      if (data.val() === null) {
        var newKey = db.ref().child('users').push().key;
        var user = {};
        user["/users/" + newKey] = {
          "login": l,
          "name": u,
          "password": p,
          "locked": false
        };
        return db.ref().update(user, function () {
          $('#modalLoading').modal('hide');
          show_success('บันทึกสำเร็จ');
        })
      } else {
        $('#modalLoading').modal('hide');
        show_error('ชื่อผู้ใช้นี้มีอยู่แล้ว');
      }
    });
  });

  $('#modalLoading').modal();
}

function show_error(msg) {
  $('#modal-error-body').html(msg);
  $('#modal-error').modal();
}

function show_success(msg) {
  $('#modal-body').html(msg);
  $('#modal').on('hidden.bs.modal', function (e) {
    window.location.href = "go-to-list-user.html";
  });
  $('#modal').modal();
}
