// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$(document).on('page:fetch', function() { NProgress.start(); })
$(document).on('page:change', function() { NProgress.done(); })
$(document).on('page:restore', function() { NProgress.remove(); })
      $(function() {
 $('.span-material').materialripple();
 $('.card').materialripple();

        $( ".tooltip-link" ).tooltip({
          content: function () {
            return $(this).prop('title');
            },
          track: true
          });
          var a = $("embedly-tooltips")
           embedly('card', {
            selector: 'a.embed',
            chrome: '1',
            controls: '0'
          });
          var IDs = [];
$(".card-face__avatar").find("span").each(function(){ IDs.push("#" + this.id)}); 
  
         for (var i = 0; i < IDs.length; i++) {
          var online = $(IDs[i]).attr("title");
         if(online === "true"){
             $( IDs[i]).css( "color", "#3c763d" );
             $( IDs[i]).addClass( "online" );
             $( IDs[i] ).removeClass( "offline" );
         }else if(online === "false"){
             $( IDs[i]).css( "color", "#d9534f" );
             $( IDs[i]).addClass( "offline" );
             $( IDs[i] ).removeClass( "online" );
         };
         
    }
     
         

        });
   function Link(){
      var Link = $('.Linkjs').attr("title"); 
      document.location.href = Link;
   }