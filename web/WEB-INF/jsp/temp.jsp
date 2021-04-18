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
<form action="${pageContext.request.contextPath}/essay/addEssay" method="post">

    <input type="hidden" name="essayUserDisplayName" value="${addEssayUserInfo}">
    文章名字：<input type="text" class="form-control" name="essayName" required ><br><br><br>
    文章内容：<textarea id="essayText" class="form-control" name="essayText" required class="form-control"
                   rows="6"></textarea><br><br><br>
    <div class="form-group">
        文章作者： <label>${addEssayUserInfo}</label>

    </div>
    文章分类：
    <div class="dropdown" id="myDrop">
        <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="true">
            ${QEssay.essayCategory}

            <span class="caret"></span>
        </button>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1" id="schoolul" >
            <c:forEach var="school" items="${QSchool}">
                <li  id="selectSchoolName">
                    <a href="#" name="${school.schoolName}" >${school.schoolName}</a>
                </li>
            </c:forEach>
        </ul>
    </div>
    <input readonly="readonly" type="hidden" name="essayCategory" id="inputEssayCategory">
    <br><br><br>
    <button type="submit" class="btn btn-primary">修改</button>
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
