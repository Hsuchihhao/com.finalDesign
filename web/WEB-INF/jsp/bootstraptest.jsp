<%--
  Created by IntelliJ IDEA.
  User: hsu
  Date: 2021/3/27
  Time: 22:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.6.0.js"></script>
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.4.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/statics/bootstrap-3.3.7-dist/js/bootstrap.js"></script>

</head>
<body>
<div class="dropdown" id="myDrop">
    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown"
            aria-haspopup="true" aria-expanded="true">
        Dropdown
        <span class="caret"></span>
    </button>
    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1" id="mylist">
        <li><a href="#" name="ActionName">Action</a></li>
        <li><a href="#" name="Another action Name">Another action</a></li>
        <li><a href="#">Something else here</a></li>
        <li role="separator" class="divider"></li>
        <li><a href="#">Separated link</a></li>
    </ul>
</div>
<button type="button" id="buttonDisplay">广东</button>
<input type="text" id="inputDisplay">
<script type="text/javascript">
    // 获取选中的值
    $("#mylist li").on('click',function(){
        $("#inputDisplay").val($(this).text());
        //Input可以获得li里的值
        $("#buttonDisplay").text($(this).text());
        //button无法获取
        console.log($(this).children("a").get(0));
        // 如下方式获取不到元素name属性
        //console.log($(this).children("a").get(0).attr("name"));
        // 如下方式可以获取name属性
        console.log($(this).children(":first").attr("name"));
        //$("#test").val($(this).children);
    });
</script>

</body>
</html>
