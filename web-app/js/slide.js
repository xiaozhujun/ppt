(function($, n){

    var len = $("#pptItemList li.pptItemLi").length,
        index = 1,
        timer;
        timer;
        timer;

    $("#pptItemList .pptItemUL").css({"width":len*n+"px"});
    function turnSlide(){

        if (index != len) {
            $(".btns li").removeClass("cur").eq(index).addClass("cur");
            $("#pptItemList .pptItemUL").stop().animate({"margin-left":-1*n*index+"px"}, 300, "linear", function(){
                index ++;
            });
        } else {
            $("#pptItemList .pptItemUL").stop().animate({"margin-left":"0"}, 300, "linear", function(){
                index = 1;
            });
        }

    }

    timer = setInterval(turnSlide, 10000);

})(jQuery, 1000);