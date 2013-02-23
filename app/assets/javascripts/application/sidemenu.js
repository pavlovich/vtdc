/**
 * Created with JetBrains RubyMine.
 * User: pavlovich
 * Date: 2/19/13
 * Time: 8:37 PM
 */

$(document).ready(
    function () {
        $("#my-collapse-nav > li > a[data-target]").parent('li').click(
            function () {
                target = $(this).children('a[data-target]').data('target');
                icon = $(this).children().first().children().first();
                if(icon.hasClass('down')){
                    $(target).collapse('show')
                } else {
                    $(target).collapse('hide');
                }
                $(this).children().first().children().first().toggleClass('down up');
            }
        );
    }
);

//$(document).ready(
//    function () {
//        $("#my-collapse-nav > li > a[data-target]").parent('li').hover(
//            function () {
//                target = $(this).children('a[data-target]').data('target');
//                $(target).collapse('show')
//            },
//            function () {
//                target = $(this).children('a[data-target]').data('target');
//                $(target).collapse('hide');
//            }
//        );
//    }
//);