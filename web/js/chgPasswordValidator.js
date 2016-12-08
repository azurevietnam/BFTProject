$(document).ready(function () {
    $('#chgPassword').bootstrapValidator({
// To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            oldPassword: {
                validators: {
                    notEmpty: {
                        message: 'Please supply password'
                    }
//               regexp: {
//                  regexp: /^[a-zA-Z\s]+$/,
//                  message: 'The username can only consist of alphabetical'
//               }
                }
            },
            newPassword: {
                validators: {
                    notEmpty: {
                        message: 'Please supply password'
                    }

                }
            },
            confirmPassword: {
                validators: {
                    identical: {
                        field: 'newPassword',
                        message: 'The password and its confirm are not the same'
                    }
                }
            }

        }
    });
});
