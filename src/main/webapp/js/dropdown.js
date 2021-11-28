$(".nav li ").hover(function() {            //메뉴 드롭다운

$(this).find("ul").stop().slideToggle(300);
});