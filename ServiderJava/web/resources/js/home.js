$( document ).ready(function() {
    $("#search").autocomplete({
        source: ["Bob", "Greg", "Jaques", "Bobby", "Georges"],
        messages: {
            noResults: '',
            results: function() {}
        }
    });
});