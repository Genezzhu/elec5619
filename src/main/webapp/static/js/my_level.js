// global function
var switchPage = function(currentHighlight) {
	var table_rows = $('.pagination-table tbody tr');
	_.each(table_rows, function(row) {
		row = $(row);
		var row_index = row.data('index');
		if (row_index < (currentHighlight + 1) * pageCap
				&& row_index >= (currentHighlight) * pageCap) {
			row.show();
		} else {
			row.hide();
		}
	});
}

// highlight first page
$('.pagination .page-btn').first().addClass('active');
switchPage(0);

// add handler for page btn
$('.pagination .page-btn').click(function(e) {
	var btn = $(e.currentTarget);
	$('.pagination .page-btn').removeClass('active');
	btn.addClass('active');
	var pageIndex = btn.data('page-index');
	$('.pagination-table tbody tr').hide();
	$('.pagination-table tbody tr[data-page=' + pageIndex + ']').show();
	switchPage(pageIndex);
});

// add handler for page nav btn, go prev and next
$('.pagination .page-nav-btn').click(
		function(e) {
			var btn = $(e.currentTarget);
			var direction = btn.data('direction');
			var currentPage = $('.pagination .page-btn.active').data(
					'page-index');
			if (direction == 'prev') {
				$(
						'.pagination .page-btn[data-page-index='
								+ (currentPage - 1) + ']').click();
			} else {
				$(
						'.pagination .page-btn[data-page-index='
								+ (currentPage + 1) + ']').click();

			}
		});