$(document).ready(function () {

    var windowHeight = $(window).height();
    var frontHeight = parseInt($('#front').css('height'));
    var footerHeight = parseInt($('.site-footer').css('height'));
    var mainContainerHeight = parseInt($('#mainContainer').height());

    var mainContainerMargin = (windowHeight - frontHeight - mainContainerHeight - footerHeight) / 2;
    $('#mainContainer').css({
        marginTop : mainContainerMargin,
        marginBottom : mainContainerMargin,
        minHeight : mainContainerHeight
    })
});