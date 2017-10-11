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
    .append($('<td>').text(data.login))
    .append($('<td>').append(rm));
  body.append(tr);
}

function remove_user(l) {
  $('#modalLoading').on('shown.bs.modal', function() {
    $('#modalLoading').off('shown.bs.modal');
    firebase.database().ref("users/" + l).remove(function() {
      $('#modalLoading').modal('hide');    
    });
  });

  $('#modalLoading').modal();
}

$(function () {
  get_users();
});