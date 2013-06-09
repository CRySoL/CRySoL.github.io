      $(document).ready(function() {{
        selected = location.hash.slice(1);
        if (selected) {
          $('div.author').hide();
          $('#' + selected).show();
        }
      }});
