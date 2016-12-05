$(document).ready(function () {
   $(function () {
      $("#from_location, #to_location").autocomplete({
         source: function (request, response) {
            $.ajax({
               url: "AutocompleteController",
               type: "GET",
               data: {
                  term: request.term
               },
               dataType: "json",
               success: function (data) {
                  response(data);
               }
            });
         }
      });
   });
});

