(function () {
  $('#create-form').on('submit', function () {
    var name = $('#inputName').val();
    var login = $('#inputLogin').val();
    var password = $('#inputPassword').val();
    var password2 = $('#inputPassword2').val();
    if (password === password2) {
      create_user(name, login, password);
      // if (create_user(name, login, password)) {
      //   show_success('บันทึกสำเร็จ');
      // } else {
      //   show_error('ชื่อผู้ใช้นี้มีอยู่แล้ว');
      // }
      return false;
    } else {
      //show_error('รหัสผ่านไม่ตรงกับรหัสผ่านยืนยัน');
    }
    return false;
  });
})();

function create_user(u, l, p) {
  $('#modalLoading').modal();
  var db = firebase.database();
  var newKey = db.ref().child('users').push().key;
  var user = {};
  user["/users/" + newKey] = {
    "login": l,
    "name": u,
    "password": p,
    "locked": false
  };
  return db.ref().update(user)
    .then(function () {
      $('#modalLoading').modal('hide');
      show_success('บันทึกสำเร็จ');
    })
    .catch(function () {
      $('#modalLoading').modal('hide');
      show_error('ชื่อผู้ใช้นี้มีอยู่แล้ว');
    });


  // $('#modalLoading').modal('hide');
  // show_success('บันทึกสำเร็จ');

  // userRef.on('child_added', function (data) {
  //   console.log(data);
  //   if (data.val() === null) {
  //     userRef.set({
  //       "name": u,
  //       "password": p,
  //       "locked": false
  //     });
  //     //return true;
  //     show_success('บันทึกสำเร็จ');
  //   } else {
  //     show_error('รหัสผ่านไม่ตรงกับรหัสผ่านยืนยัน');
  //     //return false;
  //   }
  // });



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
  //return true;
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
