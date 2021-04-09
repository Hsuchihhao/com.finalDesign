<%--
  Created by IntelliJ IDEA.
  User: hsu
  Date: 2021/3/9
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>love</title>
    <link href="favicon.ico" rel="shortcut icon"/>
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.4.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.6.0.js"></script>
    <script src="https://www.recaptcha.net/recaptcha/api.js?oncallback=renderRecaptcha" async defer></script>
    <script>
        <!--判断用户名是否重复-->
        function namedisfcous() {
            $.get({
                url: "${pageContext.request.contextPath}/user/UserNameRegister",
                data: {"name": $("#userName").val()},
                success: function (data) {
                    if (data.toString() === 'ok') {
                        $("#userInfo").css("color", "green");
                        $("#userInfo").html(data);
                        console.log(data);
                    } else {
                        $("#userInfo").css("color", "red");
                        $("#userInfo").html(data);
                    }

                }
            })
        }


        function displaynamedisfcous() {
            $.get({
                url: "${pageContext.request.contextPath}/user/UserDisplayNameRegister",
                data: {"displayName": $("#userDisplayName").val()},
                success: function (data) {
                    if (data.toString() === 'ok') {
                        $("#nameInfo").css("color", "green");
                        $("#nameInfo").html(data);
                        console.log(data);
                    } else {
                        $("#nameInfo").css("color", "red");
                        $("#nameInfo").html(data);
                    }

                }
            })
        }
        function pwddisfcous() {
            var pwd1 = document.getElementById("password").value;
            var pwd2 = document.getElementById("password2").value;
            if (pwd1 != pwd2) {
                $("#pwdInfo").css("color", "red");
                $("#pwdInfo").html("密码不一致");
            } else {
                $("#pwdInfo").css("color", "green");
                $("#pwdInfo").html("ok");
            }

        }
    </script>


    <script type="text/javascript">
        function maildisfcous() {
            var r = /^((([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6}\;))*(([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})))$/;
            var mail = document.getElementById("mail").value;
            var result = r.test(mail);
            if (result == true) {
                $("#mailInfo").css("color", "green");
                $("#mailInfo").html("ok");
            } else {
                $("#mailInfo").css("color", "red");
                $("#mailInfo").html("邮箱格式错误");
            }
        }


    </script>
</head>

<body style=" background-color:gainsboro;
             ">
<div class="modal-dialog" style="margin-top: 10%; width:400px;">
    <div class="modal-content">
        <div class="modal-header">

            <h4 class="modal-title text-center" id="myModalLabel">注册</h4>
        </div>
        <form action="${pageContext.request.contextPath}/user/UserRegister" method="post">
            <div class="modal-body" id="model-body">

                <!--输入用户名-->
                <div class="form-group">
                    <label>用户名</label>
                    <span id="userInfo"></span>
                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                    <input type="text" class="form-control" id="userName" name="userName" placeholder="输入注册时用户名"
                           autocomplete="off" required onblur="namedisfcous()">
                </div>
                <!--输入名字-->
                <div class="form-group">
                    <label>输入名字</label>
                    <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                    <input type="text" class="form-control" id="userDisplayName" name="userDisplayName"
                           placeholder="输入名字"
                           autocomplete="off" onblur="displaynamedisfcous()" required>
                    <span id="nameInfo"></span>
                </div>
                <!--第一次输入密码-->
                <div class="form-group">
                    <label>密码</label>
                    <span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
                    <input type="password" class="form-control" id="password" name="password" placeholder="输入密码"
                           autocomplete="off" required>
                </div>

                <!--第二次输入密码-->
                <div class="form-group">
                    <label>再次输入密码</label>
                    <span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
                    <input type="password" class="form-control" id="password2" name="userPassword" placeholder="再次输入密码"
                           autocomplete="off" required onblur="pwddisfcous()">
                    <span id="pwdInfo"></span>
                </div>
                <!--输入邮箱-->
                <div class="form-group">
                    <label>输入邮箱地址</label>
                    <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                    <input type="text" class="form-control" id="mail" name="userEmail" placeholder="email@example.com"
                           autocomplete="off" onblur="maildisfcous()" required>
                    <span id="mailInfo"></span>
                </div>

            </div>

            <div class="modal-footer">

                <div class="form-group">
                    <button class="btn btn-primary form-control" type="submit" id="toUserPage"
                    >注册
                    </button>
                </div>
            </div>
        </form>

    </div>
</div><!-- /.modal-content -->
</div><!-- /.modal -->

</body>
</html>
