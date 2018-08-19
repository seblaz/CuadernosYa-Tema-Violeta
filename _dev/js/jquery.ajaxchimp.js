(function ($) {
    'use strict';

    $.ajaxChimp = {
        responses: {
            'We have sent you a confirmation email'                                             : 0,
            'Please enter a valid email'                                                        : 1,
            'An email address must contain a single @'                                          : 2,
            'The domain portion of the email address is invalid (the portion after the @:'      : 3,
            'The username portion of the email address is invalid (the portion before the @:'   : 4,
            'This email address looks fake or invalid. Please enter a real email address'       : 5,
            'Please enter a value'                                                              : 6,
            'This email cannot be added to this list. Please enter a different email address.'  : 7
        },
        translations: {
            'en': null,
            'es': {

                0 : 'En breve te enviaremos un email de confirmacion.',
                1 : 'Ingresá un correo electrónico válido.',
                2 : 'El correo electrónico debe contener un @.',
                3 : 'La parte del dominio es inválida (la que está después del @).',
                4 : 'La parte del usuario es inválida (la que está antes del @).',
                5 : 'Este correo electrónico es inválida. Ingresá un correo electrónico real.',
                6 : 'Ingresá un correo electrónico.',
                7 : 'Este correo electrónico no puede ser agregado a la lista. Ingresá otro correo.',
                'submit' : 'Suscribiendo...'
            }            
        },
        init: function (selector, options) {
            $(selector).ajaxChimp(options);
        }
    };

    $.fn.ajaxChimp = function (options) {
        $(this).each(function(i, elem) {
            var form = $(elem);
            var email = form.find('input[type=email]');
            var label = form.find('.info');

            var settings = $.extend({
                'url': form.attr('action'),
                'language': 'es'
            }, options);

            var url = settings.url.replace('/post?', '/post-json?').concat('&c=?');

            form.attr('novalidate', 'true');
            email.attr('name', 'EMAIL');

            form.submit(function () {
                var msg;
                function successCallback(resp) {
                    if (resp.result === 'success') {
                        msg = 'We have sent you a confirmation email';
                        label.removeClass('error').addClass('valid');
                        email.removeClass('error').addClass('valid');
                    } else {
                        email.removeClass('valid').addClass('error');
                        label.removeClass('valid').addClass('error');
                        var index = -1;
                        try {
                            var parts = resp.msg.split(' - ', 2);
                            if (parts[1] === undefined) {
                                msg = resp.msg;
                            } else {
                                var i = parseInt(parts[0], 10);
                                if (i.toString() === parts[0]) {
                                    index = parts[0];
                                    msg = parts[1];
                                } else {
                                    index = -1;
                                    msg = resp.msg;
                                }
                            }
                        }
                        catch (e) {
                            index = -1;
                            msg = resp.msg;
                        }
                    }

                    // Translate and display message
                    if ( 
                        settings.language !== 'en'
                        && $.ajaxChimp.translations
                        && $.ajaxChimp.translations[settings.language]
                    
                    ) {
                        for (var exp in $.ajaxChimp.responses) {
                            if(msg.includes(exp)){
                                msg = $.ajaxChimp.translations[settings.language][$.ajaxChimp.responses[exp]];
                                break;
                            }
                        }
                    }
                    label.html(msg);

                    label.show(2000);
                    if (settings.callback) {
                        settings.callback(resp);
                    }
                }

                var data = {};
                var dataArray = form.serializeArray();
                $.each(dataArray, function (index, item) {
                    data[item.name] = item.value;
                });

                label.removeClass('error');
                email.removeClass('error');

                $.ajax({
                    url: url,
                    data: data,
                    success: successCallback,
                    dataType: 'jsonp',
                    error: function (resp, text) {
                        console.log('mailchimp ajax submit error: ' + text);
                    }
                });

                // Translate and display submit message
                var submitMsg = 'Submitting...';
                if(
                    settings.language !== 'en'
                    && $.ajaxChimp.translations
                    && $.ajaxChimp.translations[settings.language]
                    && $.ajaxChimp.translations[settings.language]['submit']
                ) {
                    submitMsg = $.ajaxChimp.translations[settings.language]['submit'];
                }
                label.html(submitMsg).show(2000);

                return false;
            });
        });
        return this;
    };
})(jQuery);