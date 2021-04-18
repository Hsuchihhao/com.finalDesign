<%--
  Created by IntelliJ IDEA.
  User: hsu
  Date: 2021/4/19
  Time: 0:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/school/addSchool" method="post" enctype="multipart/form-data">
    学校名字：<input type="text" name="schoolName" required><br><br><br>
    学校图片：<input type="file" name="schoolPic2" required><br><br><br>
    学校介绍：<input type="text" name="schoolProfile" required><br><br><br>
    <input type="submit" value="添加">
</form>
</body>
<script type="text/javascript">
    // 获取选中的值
    $("#schoolul li").on('click',function(){

        //获取dom元素，点击哪个显示哪个
        $("#inputEssayCategory").val($(this).text());

        console.log("inputEssayCategory内容---"+ $("#inputEssayCategory").val())

        //下框口变成选中字符
        $(dropdownMenu1).text($(this).text());
        console.log("button内容----"+$(dropdownMenu1).text());

        $("#inputEssayCategory").val( $(this).children(":first").attr("name"));
        console.log("inputEssayCategory内容---"+ $("#inputEssayCategory").val())

    });
</script>
</html>
