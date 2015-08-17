/*
 * Turn an input element into a rating system
 *
 * Author: Daniel Amaya
 * */
;(function ($, window, document, undefined) {
    'use strict';

    var pluginName = 'rating',
        defaults = {
            // whether or not to display the label under the stars
            showLabel: true,
            // messages for the label under the stars
            messages: [
                'How was your experience?',
                'Truly just terrible',
                'It could have been better',
                'Meh',
                'It was pretty good',
                'Doesn\'t get more amazing than this!'
            ],
            // error message when the rating is empty
            validationMessage: 'Please rate before you continue',
            // display the widget as inline-block instead of block
            inline: false,
            // the icon from FontAwesome this widget will use
            icon: 'fa-star',
            // colors
            color: '#b08bd7',
            colorHover: '#7d40bc',
            // the size of the icon
            size: '20px',
            disabled: false
        };

    // The actual plugin constructor
    function Plugin (element, options) {
        this.$element = $(element);
        this.settings = $.extend({}, defaults, options);
        this._defaults = defaults;
        this._name = pluginName;
        this.init();
    }

    Plugin.prototype = {
        init: function () {
            var $el = this.$element,
                self = this,
                $container,
                star,
                $message,
                i,
                $starsContainer;

            this.value = $el.val() ? parseInt($el.val(), 10) : 0;

            $el.on('change', function () {
              console.log('change!');
              var val = (+$el.val());
              self.value = val;
              highlightStars(val);
            });

            $el.on('invalid', function (e) {
                e.preventDefault();
                $container.tipi('text', self.settings.validationMessage)
                    .tipi('show');
            });
            function isFloat(n) {
                return n === +n && n !== (n|0);
            }

            // highlight the stars in the container
            function highlightStars(current) {
                var i;

                for(i = 1; i <= 5; i++) {
                    if(i <= current) {
                        $container.find('i[rating-value=' + i + ']').css('background-color', self.settings.colorHover);
                    } else {
                        $container.find('i[rating-value=' + i + ']').css('background-color', self.settings.color);
                    }
                }

                if(self.settings.showLabel) {
                    $message.text(self.settings.messages[current]);
                }
            }

            // create DOM elements
            $container = $('<div class="rating-container" />')
            // instantiate tipi on the container
                .tipi();

            if(self.settings.inline) {
                $container.css('display', 'inline-block');
            }

            // ... stars
            $starsContainer = $('<div class="stars" />');

            for(i = 1; i <= 5; i++) {
                if ( Math.floor($el.val()) == i && isFloat(i - $el.val()) ) {
                    star = $('<i rating-value="' + i + '" class="fa ' + self.settings.icon + ' halfish" />');
                }
                else {
                    star = $('<i rating-value="' + i + '" class="fa ' + self.settings.icon + '" />');
                }
                star.css('font-size', self.settings.size);
                if ( self.settings.disabled ) {
                    star.css('cursor', 'default');
                }
                $starsContainer.append(star);
            }
            $container.append($starsContainer);

            // ... message
            if(self.settings.showLabel) {
                $message = $('<span />').text(self.settings.messages[0]);
                $container.append($message);
            }

            // bind events
            if ( !self.settings.disabled ) {
                $container.find('i').mouseenter(function () {
                    var val = parseInt($(this).attr('rating-value'), 10);
                    highlightStars(val);
                }).click(function () {
                    var val = parseInt($(this).attr('rating-value'), 10);
                    $el.val(val).trigger('change');
                    // if tipi was open because of an error, hide it!
                    $container.tipi('hide');
                });

                $container.mouseleave(function () {
                    highlightStars(self.value);
                });
            }

            // finally update the DOM
            $el.after($container)
               .hide();

            // highlight a first time
            highlightStars(this.value);

            // finally give access to our container
            Plugin.prototype._$container = $container;

            return this;
        },

        val: function (value) {
            if(!value) {
                return this.value;
            }

            if(value < 1 || value > 5) {
                throw 'Invalid value, rating can only range from 1 to 5';
            }

            this.$element.val(value).trigger('change');
        },

        container: function () {
            return this._$container;
        }
    };

    // Instantiation or method call, accordingly
    $.fn[pluginName] = function (options) {
        var args = Array.prototype.slice.call(arguments),
            output;

        this.each(function() {
            var instance = $.data(this, 'plugin_' + pluginName),
                method;

            if (!instance) {
                $.data( this, 'plugin_' + pluginName, new Plugin(this, options));
            } else {
                method = args.shift();
                output = instance[method].apply(instance, args);
            }
        });

        // chain jQuery functions
        return output === undefined ? this : output;
    };

})(jQuery, window, document);