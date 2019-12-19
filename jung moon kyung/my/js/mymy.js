		(function ($) {
		  // custom css expression for a case-insensitive contains()
		  jQuery.expr[':'].Contains = function(a,i,m){
			  return (a.textContent || a.innerText || "").toUpperCase().indexOf(m[3].toUpperCase())>=0;
		  };
		 
		  function filterList(header, list) { 
		  // header is any element, list is an unordered list
			// create and add the filter form to the header
			var form = $("<form>").attr({"class":"filterform","action":"#"}),
				input = $("<input>").attr({"class":"filterinput","type":"text"});
			$(form).append(input).appendTo(header);
		 
			$(input)
			  .change( function () {
				var filter = $(this).val();
				if(filter) {
			  
				  $matches = $(list).find('a:Contains(' + filter + ')').parent();
				  $('subli', list).not($matches).slideUp();
				  $matches.slideDown();
					
				} else {
				  $(list).find("subli").slideDown();
				}
				return false;
			  })
			.keyup( function () {
				// fire the above change event after every letter
				$(this).change();
			});
		  }
		 
		 
		  //ondomready
		  $(function () {
			filterList($("#form"), $("#list"));
		  });
		}(jQuery));
 

 	$(function() {
		  $('#forgot_username_link').tipsy({gravity: 'w'});   
		});

			$(document).ready(function() {

				$(".signin").click(function(e) {          
					e.preventDefault();
					$("fieldset#signin_menu").toggle();
					$(".signin").toggleClass("menu-open");
				});
				
				$("fieldset#signin_menu").mouseup(function() {
					return false
				});
				$(document).mouseup(function(e) {
					if($(e.target).parent("a.signin").length==0) {
						$(".signin").removeClass("menu-open");
						$("fieldset#signin_menu").hide();
					}
				});			
				
			});


			$(function(){
		 var shrinkHeader = 30;
		 var shrinkhollow = 465;
		  $(window).scroll(function() {
			var scroll = getCurrentScroll();
			  if ( scroll >= shrinkHeader ) {
				   $('#navtop').addClass('shrink');  
				}
				else {
					$('#navtop').removeClass('shrink');	
				}
			   if(scroll>= shrinkhollow ){
					$('#navtop').addClass('shrinkhollow');  
				}
				else {
					$('#navtop').removeClass('shrinkhollow');	
				}
	});
	function getCurrentScroll() {
		return window.pageYOffset || document.documentElement.scrollTop;
		}
	});




	/*배너2 자동슬라이드 기능*/
	$(function(){
		$('#carousel1').infiniteCarousel();
	});




