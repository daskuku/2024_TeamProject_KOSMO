$(document).on("click", ".customerServiceitem", function() {
    var $additional = $(this).find(".additional");

    $additional.toggle();

    $(this).addClass("active").siblings().removeClass("active");
    $(this).siblings().find(".additional").hide();

    if ($additional.is(":visible")) {
        $(this).removeClass("active");
    } else {
        $(this).siblings().find(".additional").hide();
    }
});
