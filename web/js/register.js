$(document).ready(function () {
    $('#register_form').bootstrapValidator({
        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            firstName: {
                validators: {
                    stringLength: {
                        min: 2,
                        max: 30,
                        message: 'Please enter at least 2 characters and no more than 30'
                    },
                    notEmpty: {
                        message: 'Please supply your first name'
                    }
//               regexp: {
//                  regexp: /^[a-zA-Z\s]+$/,
//                  message: 'The username can only consist of alphabetical'
//               }
                }
            },
            lastName: {
                validators: {
                    stringLength: {
                        min: 2,
                        max: 30,
                        message: 'Please enter at least 2 characters and no more than 30'
                    },
                    notEmpty: {
                        message: 'Please supply your last name'
                    }
//               regexp: {
//                  regexp: /^[a-zA-Z\s]+$/,
//                  message: 'The username can only consist of alphabetical'
//               }
                }
            },
            username: {
                validators: {
                    stringLength: {
                        min: 5,
                        max: 30,
                        message: 'Please enter at least 5 characters and no more than 30'
                    },
                    notEmpty: {
                        message: 'Please supply your username'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_]+$/,
                        message: 'The username can only consist of alphabetical, number and underscore'
                    }
                }
            },
            password: {
                validators: {
                    stringLength: {
                        min: 5,
                        max: 30,
                        message: 'Please enter at least 5 characters and no more than 30'
                    },
                    notEmpty: {
                        message: 'Please supply your password'
                    }
                }
            },
            confirmPassword: {
                validators: {
                    identical: {
                        field: 'password',
                        message: 'The password and its confirm are not the same'
                    }
                }
            },
            email: {
                validators: {
                    notEmpty: {
                        message: 'Please supply your email address'
                    },
                    emailAddress: {
                        message: 'Please supply a valid email address'
                    }
                }
            }
        }
    });
});
