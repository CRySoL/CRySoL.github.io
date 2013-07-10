function hide_others() {
    $('div.item').hide();
    selected = location.hash.slice(1);
    if (selected) {
        $('#' + selected).show();
    }
    else {
	$('div.item').show();
    }
}

$(document).ready(hide_others);
