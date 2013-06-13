$(document).ready(function() {{
    selected = location.hash.slice(1);
    if (selected) {
	console.log(selected);
        $('div.item').hide();
        $('#' + selected).show();
    }
}});
