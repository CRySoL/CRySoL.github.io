$(document).ready(function() {{
    $('div.item').hide();
    selected = location.hash.slice(1);
    if (selected) {
        $('#' + selected).show();
    }
    else {
	$('div.item').show();
    }
}});
