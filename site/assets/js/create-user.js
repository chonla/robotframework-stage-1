(function () {
  $('#create-form').on('submit', function () {
    var name = $('#inputName').val();
    var login = $('#inputLogin').val();
    var password = $('#inputPassword').val();
    var password2 = $('#inputPassword2').val();
    if (password === password2) {
      if (create_user(name, login, password)) {
        show_success('บันทึกสำเร็จ');
      } else {
        show_error('ชื่อผู้ใช้นี้มีอยู่แล้ว');
      }
    } else {
      show_error('รหัสผ่านไม่ตรงกับรหัสผ่านยืนยัน');
    }
    return false;
  });
})();

function create_user(u, l, p) {
  var database = firebase.database();
  var userRef = database.ref("users/" + l);

  userRef.set({
    "name": u,
    "login": l,
    "password": p,
    "locked": false
  });

  // var users = localStorage.getItem("users") || "{}";
  // var db = JSON.parse(users);
  // if (db.hasOwnProperty(l)) {
  //   return false;
  // }
  // db[l] = {
  //   "name": u,
  //   "login": l,
  //   "password": p
  // };

  // var flat = JSON.stringify(db);
  // localStorage.setItem("users", flat);
  return true;
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
