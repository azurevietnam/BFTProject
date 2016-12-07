$(document).ready(function () {
    $('#add_flight_form').bootstrapValidator({
// To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            flightName: {
                validators: {
                    notEmpty: {
                        message: 'Please supply Flight Name'
                    }
//               regexp: {
//                  regexp: /^[a-zA-Z\s]+$/,
//                  message: 'The username can only consist of alphabetical'
//               }
                }
            },
            airlineName: {
                validators: {
                    notEmpty: {
                        message: 'Please supply Airline Name'
                    }

                }
            },
            fromLocation: {
                validators: {
                    notEmpty: {
                        message: 'Please supply location'
                    }
                }
            },
            toLocation: {
                validators: {
                    notEmpty: {
                        message: 'Please supply location'
                    }
                }
            },
            departure: {
                validators: {
                    notEmpty: {
                        message: 'Please supply departure time'
                    }
                }
            },
            arrival: {
                validators: {
                    notEmpty: {
                        message: 'Please supply arrival time'
                    }
                }
            },
            fSeat: {
                validators: {
                    notEmpty: {
                        message: 'Please supply seats'
                    },
                    regexp: {
                        regexp: /^[0-9]+$/,
                        message: 'The seats must be number'
                    }
                }
            },
            bSeat: {
                validators: {
                    notEmpty: {
                        message: 'Please supply seats'
                    },
                    regexp: {
                        regexp: /^[0-9]+$/,
                        message: 'The seats must be number'
                    }

                }
            },
            eSeat: {
                validators: {
                    notEmpty: {
                        message: 'Please supply seats'
                    },
                    regexp: {
                        regexp: /^[0-9]+$/,
                        message: 'The seats must be number'
                    }
                }
            }

        }
    });
});
