<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<style>
    .quickmenu {position:absolute;width:120px;top:50%;margin-top:-50px;right:10px;background:#fff;}
    .quickmenu ul {position:relative;float:left;width:100%;display:inline-block;*display:inline;border:1px solid #ddd;}
    .quickmenu ul li {float:left;width:100%;border-bottom:1px solid #ddd;text-align:center;display:inline-block;*display:inline;}
    .quickmenu ul li a {position:relative;float:left;width:100%;height:30px;line-height:30px;text-align:center;color:#999;font-size:9.5pt;}
    .quickmenu ul li a:hover {color:#000;}
    .quickmenu ul li:last-child {border-bottom:0;}
</style>
<div class="quickmenu">
    <ul>
        <li><a href="#">하트시그널4</a></li>
        <li><a href="#">김지영 이뻐</a></li>
        <li><a href="#">김지민도 이뻐</a></li>
        <li><a href="#">유이수는 별로</a></li>
        <li><a href="#">1 대 1 문의</a></li>
    </ul>
</div>
<script>
    $(document).ready(function(){
        var currentPosition = parseInt($(".quickmenu").css("top"));
        $(window).scroll(function() {
            var position = $(window).scrollTop();
            $(".quickmenu").stop().animate({"top":position+currentPosition+"px"},500);
        });
    });
</script>