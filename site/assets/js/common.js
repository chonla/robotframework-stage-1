(function () {
  $(init);
})();

function init() {
  init_smooth_scroll();
}

function init_smooth_scroll() {
  $("a[href^='#']").on('click', function (event) {
    event.preventDefault();
    var hash = this.hash;
    $('html, body').animate({
      scrollTop: $(hash).offset().top
    }, 800, function () {
      window.location.hash = hash;
    });
  });
}