<%@page contentType="text/html; charset=UTF-8" language="java"%>

<head>

    <title>注册</title>

    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>

    <script>
        function fnSignup() {

            var name = $('#name').val();
            var password1 = $('#password1').val();
            var telnum = $('#telnum').val();
            var password2 = $('#password2').val();
            var sex = $('#sex').val();

            var retel = /^1[34578]\d{9}$/;
            if (retel.test(telnum)) {
            } else {
                alert("请输入正确的手机号！");
                return false;
            }

            var repwd = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[a-zA-Z0-9]{8,16}$/;
            if (repwd.test(password1)) {
            } else {
                alert("请输入正确的密码！");
                return false;
            }

            if (password1 == password2) {
            } else {
                alert("请两次输入一致的密码！");
                return false;
            }

            var rename = /^.{1,20}$/;
            if (rename.test(name)) {
            } else {
                alert("请输入最多20位的姓名或昵称！");
                return false;
            }

            var param = {};

            param.telNum = telnum;
            param.password = password1;
            param.name = name;
            param.sex = sex;

            $.ajax({
                type: 'POST',
                data: JSON.stringify(param),
                contentType: 'application/json',
                dataType: 'json',
                url: '${pageContext.request.contextPath}/wtf/consignup',
                async: false,
                success: function (data) {
                    if (data > 0)
                        alert("注册成功")
                    else
                        alert("注册失败！")
                },
                error: function (e) {
                    alert("system error");
                }
            })

            return false;
        }
    </script>

</head>

<body>
    <div class="container">
        <div class="clearfix" style="margin-bottom: 120px;"></div>
        <div class="col-md-3 column"></div>
        <div class="col-md-6 column">

            <div class="row col-md-offset-8">
                <a href='${pageContext.request.contextPath}/jsp/baber-sign-up.jsp' role="button">商家注册，请点击跳转</a>
            </div>
            <div class="row col-md-offset-8">
                <a href='${pageContext.request.contextPath}/jsp/log-in.jsp' role="button">如果已有账号，请直接登录</a>
            </div>
            <div class="clearfix" style="margin-bottom: 10px;"></div>
            <form onsubmit="return fnSignup()">



                <div class="form-group row">
                    <label for="telnum" class="col-sm-3">手机号码</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="telnum" placeholder=""> <small id="telnumHelp"
                            class="form-text text-muted"> 请输入11位手机号码 </small>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="password1" class="col-sm-3">密码</label>
                    <div class="col-sm-9">
                        <input type="password" class="form-control" id="password1" placeholder=""> <small
                            id="passwordHelp1" class="form-text text-muted">
                            请输入大写字母、小写字母、数字组成的组合，至少8位，至多16位 </small>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="password2" class="col-sm-3"></label>
                    <div class="col-sm-9">
                        <input type="password" class="form-control" id="password2" placeholder=""> <small
                            id="passwordHelp2" class="form-text text-muted"> 请输入再次确认密码 </small>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="name" class="col-sm-3">姓名</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="name" placeholder="">
                        <small id="nameHelp" class="form-text text-muted">
                            请输入您的姓名或昵称 最多20位 </small>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="sex" class="col-sm-3">性别</label>
                    <div class="col-sm-9">
                        <select id="sex" class="form-control">
                            <option value="true" selected>先生</option>
                            <option value="false">女士</option>
                        </select> <small id="sexHelp" class="form-text text-muted">
                            请告诉我们如何称呼您 </small>
                    </div>
                </div>

                <div class="col-sm-offset-3 col-sm-9 row">
                    <button type="submit" id="signupcheck" class="btn btn-primary btn-lg btn-block">注册</button>
                </div>



            </form>
        </div>
    </div>
</body>

</html>