function get_users() {
  var users = localStorage.getItem("users") || "{}";
  var db = JSON.parse(users);
  return db;
}

function render_user_table(id, users) {
  var body = $("#" + id + " tbody");
  body.empty();
  var i = 1;
  for (var k in users) {
    var rm = $('<button>')
      .addClass("btn btn-danger btn-block")
      .on('click', function() {
        remove_user(k);
        refresh_user_table();
      })
      .text("ลบ");
    var tr = $('<tr>')
      .append($('<td>').text(i++))
      .append($('<td>').text(users[k].name))
      .append($('<td>').text(users[k].login))
      .append($('<td>').append(rm));
    body.append(tr);
  }
}

function remove_user(l) {
  var users = localStorage.getItem("users") || "{}";
  var db = JSON.parse(users);
  if (!db.hasOwnProperty(l)) {
    return false;
  }
  delete db[l];

  var flat = JSON.stringify(db);
  localStorage.setItem("users", flat);
  return true;
}

function refresh_user_table() {
  var users = get_users();
  render_user_table("user-table", users);
}

$(function() {
  refresh_user_table();
});