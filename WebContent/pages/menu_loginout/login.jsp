<!DOCTYPE html>
<html lang="en">
<head>
   <%@ include file="../metrouiHeader.jsp" %>
   <style type="text/css">
	.metro .logininfo:before {
       content: "登录";
     }
     
   </style>
   <title>志愿者登录</title>
</head>

<body class="metro" style="padding-left: 50%;padding-top: 20px;">
  <div  class="example logininfo" style="width: 500px;margin-left: -250px;">
    <label id="console_message" style="color:red;font-size:20px"></label>
    <form id="loginForm" action="<%=request.getContextPath() %>/login.action" method="post">
      <fieldset>
          <legend>志愿者登录</legend>
          <h5 style="color: red;text-align: center;"><s:actionerror/><s:actionmessage/></h5>
          <label>工号</label>
          <div class="input-control text" data-role="input-control">
              <input type="text" placeholder="请输入工号,不是姓名" name="volunteer.code" autofocus required="required"/>
              <button class="btn-clear" tabindex="-1"></button>
          </div>
          
          <label>密码</label>
          <div class="input-control password" data-role="input-control">
              <input type="password" placeholder="请输入密码" name="volunteer.password" autofocus required="required"/>
              <button class="btn-reveal" tabindex="-1"></button>
          </div>
          
          <input type="submit" value="登录"/>
          <input type="button" value="指纹登录" onclick="beginVerify()"/>
          <div style="margin-top: 20px">
          </div>
      </fieldset>
  </form>
 </div>
 <script type="text/javascript">
    //please refer to form-validation-script.js
    $(document).ready(function() {
        $("#loginForm").validate({
            messages:{
                'volunteer.name': {
                    required: "请输入姓名"
                },
                'volunteer.password': {
                    required: "请输入密码"
                }
            }
        }); 
    });
    </script>

   <script>
       window.figureNumber = [];
      <s:iterator value="volunteerCodes" var="index">
       window.figureNumber.push({code:"<s:property value="#index[0]"/>",md5:"<s:property value="#index[1]"/>"});
      </s:iterator>
      function  printMessage(message){
          jQuery("#console_message").html(message);
      }
      function callBackSubmit(code,md5){
          jQuery("[name='volunteer.code']").val(code);
          jQuery("[name='volunteer.password']").val(md5);
          jQuery("form").submit();
      }
   </script>
   <%@include file="../finger_function/fingerverification.jsp"%>
</body>
</html>