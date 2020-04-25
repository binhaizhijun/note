<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/25
  Time: 17:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>验证码</title>

      <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
    <script>
        function reloadCheckImg(){
            $("img").attr("src","img.jsp?t="+(new Date().getTime()));
        }

      $ (document).ready(function () {
        $("#checkcodeId").blur(function () {
          var $checkcode = $("#checkcodeId").val();
          //校验:文本输入框的值  发送到服务端.
          //服务端: 获取文本框输入的值,和真实验证码图片中的值对比,并返回验证结果
          $.post(
                  "CheckCodeServlet",//服务端地址
                  "checkcode="+$checkcode,
                  function (result) {  //
                    $("#tip").html(result);
                  }
          );
        });
      });
    </script>
    
  </head>
  <body>
        验证码:
        <input type="text" name="checkcode" id="checkcodeId" size="4">

        <%--验证码--%>
        <a href="javascript:reloadCheckImg()"><img src="img.jsp"></a>
        <span id="tip"></span>
  </body>
</html>
