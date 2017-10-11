function get_users() {
  var database = firebase.database();
  var userRef = database.ref("users");
  userRef.on('child_added', function (data) {
    append_user_table("user-table", data.key, data.val());
  });

  userRef.on('child_removed', function (data) {
    remove_user_table(data.key);
  });
}

function remove_user_table(key) {
  $('#data-row-' + key).remove();
}

function append_user_table(id, key, data) {
  var body = $("#" + id + " tbody");
  var rm = data.locked ? $('<span>ล็อก</span>') : ($('<button>')
    .addClass("btn btn-danger btn-block")
    .on('click', function () {
      remove_user(key);
    })
    .text("ลบ"));
  var tr = $('<tr>')
    .attr('id', 'data-row-' + key)
    .append($('<td>').text(data.name))
    .append($('<td>').text(key))
    .append($('<td>').append(rm));
  body.append(tr);
}

function remove_user(l) {
  var database = firebase.database();
  var userRef = database.ref("users/" + l);
  userRef.remove();
  var usernameRef = database.ref("usernames");
  usernameRef.on('child_added', function (data) {
    if (l === data.val()) {
      data.ref.remove();
      usernameRef.off();
    }
  });
}

$(function () {
  get_users();
});