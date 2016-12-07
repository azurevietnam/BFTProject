$(document).ready(function () {
    $('#search_flight').bootstrapValidator({
        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            fromLocation: {
                validators: {
                    notEmpty: {
                        message: 'Please supply departure place'
                    }
//               regexp: {
//                  regexp: /^[a-zA-Z\s]+$/,
//                  message: 'The username can only consist of alphabetical'
//               }
                }
            },
            toLocation: {
                validators: {
                    notEmpty: {
                        message: 'Please supply destination'
                    }
//               regexp: {
//                  regexp: /^[a-zA-Z\s]+$/,
//                  message: 'The username can only consist of alphabetical'
//               }
                }
            },
            departureDate: {
                validators: {
                    notEmpty: {
                        message: 'Please supply departure date'
                    }
                }
            }

        }
    });
});
