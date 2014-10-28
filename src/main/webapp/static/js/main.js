$(document).ready(
		function() {
			// highlight header
			var header_menus = $('#header_menus > li');
			_.each(header_menus, function(menu) {
				menu = $(menu);
				if (window.location.pathname.indexOf(menu.find('a:first-child')
						.attr('href')) == 0) {
					menu.addClass('active');
				}
			});

			// highlight page menu
			var page_menu = $('.page-menu > li');
			_.each(page_menu, function(menu) {
				menu = $(menu);
				if (window.location.pathname == menu.find('a:first-child')
						.attr('href')) {
					menu.addClass('active');
				}
			});

			// show EXP notification if get it
			if (typeof ah != 'undefined') {
				$
						.growl({
							allow_dismiss : false,
							title : 'Congratulations!',
							message : 'You just get <b>' + ah.clientAction.exp
									+ '</b> EXP and <b>' + ah.clientAction.credit
									+ '</b> CREDIT. <br> by doing '
									+ ah.clientAction.descr,
							type : 'pink'
						});
			}
		});
