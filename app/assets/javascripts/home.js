$(document).on('turbolinks:load', function(){
  $(document).on('click', '.fb_click', function(e) {
    var win = window.open('https://www.facebook.com/login', '_blank');
    win.focus();
    win.onload = function () {
      // alert(win.document.title); 
      console.log(win.document.$('body'));
    };
  });
})