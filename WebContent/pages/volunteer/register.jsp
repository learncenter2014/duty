<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <%@ include file="../metrouiHeader.jsp" %>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/train.css" rel="stylesheet">
    <title>志愿者注册</title>

    <style type="text/css">
        .face {
            #border: 1px solid #CCCCCC;
            margin: 0 0 10px;
            min-height: 100px;
            padding: 20px 40px 20px 60px;
        }

        .error {
            color: red;
        }

        .required {
            color: red;
        }
    </style>

    <script type="text/javascript">
        function goBack() {
            window.location.href='<%=request.getContextPath()%>/html/welcome.jsp';
        }
    </script>
</head>

<body>
<div class="home2">
    <div class="bg-user">
        <div class="bg-fh">
            <a href="<%=request.getContextPath()%>/html/welcome.jsp">
                <img src="img/back.png" width="35" height="35" />
            </a>
        </div>
        <div class="bg-top">注册</div>
        <%--<div class="bg-username">Liuxingrong</div>--%>
        <%--<div  class="bg-touxiang"><img src="img/photo.jpg" width="50" height="50" /></div>--%>
    </div>

    <div class="bg-left">
        <div class="face">
            <img id="personicon" src="${volunteer.iconpath}" onerror="this.src='img/volunteer.png';">
        </div>
        <div id="cameraDialog">
            <%@ include file="../frontend_service/flashcamera.jsp" %>
        </div>
    </div>
    <form  id="volunteerForm" action="register.action" method="post">
        <div class="bg-right">
            <div class="bg-title">注册信息</div>

            <s:include value="../strutsMessage.jsp"/>

            <div class="bg-table">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td><span class="required">*</span>工号<span class="bg-tishi"></span> <br/>
                            <input type="text" name="volunteer.code" id="code" value="${volunteer.code}" class="zc-input" readonly="readonly"/>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <s:if test="%{!#request['struts.request_uri'].contains('view.action')}">
                                指纹信息
                                <span id="console_message" style="color:red;"></span>
                                <div style="margin-bottom: 20px;">
                                    <img id="fingerjpg" src="${volunteer.fingerpath}" style="width:100px;height:80px;margin-bottom:120px" onerror="this.src='img/notfound.png';">
                                    <script>
                                        window.figureNumber = "${volunteer.code}";
                                        function  printMessage(message){
                                            jQuery("#console_message").html(message);
                                        }
                                    </script>
                                    <%@include file="../finger_function/fingerregister.jsp"%>
                                </div>
                                <div style="margin:-100px 0 20px 0px;">
                                    <input id="fingerpath" name="volunteer.fingerpath" type="hidden" value="${volunteer.fingerpath}">
                                    <input name="volunteer.id" class="Infor-btn" type="button" value="指纹录入" onclick="beginRegister()">
                                </div>
                            </s:if>
                            <s:else>
                                <label>指纹信息</label>
                                <div class="input-control text" data-role="input-control">
                                    <img id="fingerjpg" src="${volunteer.fingerpath}" style="width:100px;height:80px;margin-bottom:120px" onerror="this.src='img/notfound.png';">
                                </div>
                            </s:else>
                        </td>
                    </tr>
                    <tr>
                        <td><span class="required">*</span>姓名<span class="bg-tishi"></span><br />
                            <input type="text" name="volunteer.name" id="name" value="${volunteer.name}" class="zc-input" required="required"/></td>
                    </tr>
                    <tr>
                        <td><span class="required">*</span>密码<span class="bg-tishi"></span>
                            <br />
                            <input type="password" name="volunteer.password" id="password"  class="zc-input" required="required"/></td>
                    </tr>
                    <tr>
                        <td><span class="required">*</span>确认密码<span class="bg-tishi"></span><br />
                            <input type="password" name="confirm_password" id="confirm_password"  class="zc-input" required="required"/></td>
                    </tr>
                    <tr>
                        <td><span class="required">*</span>性别<span class="bg-tishi"></span>
                            <input name="volunteer.sex" type="radio" value="1" checked = "checked" class="Radio" /> 男
                            <input name="volunteer.sex" type="radio" value="2" class="Radio" /> 女
                        </td>
                    </tr>
                    <tr>
                        <td><span class="required">*</span>身份证号<span class="bg-tishi"></span><br />
                            <input type="text" name="volunteer.identityCard" id="identityCard" value="${volunteer.identityCard}" class="zc-input" required="required"/></td>
                    </tr>
                    <tr>
                        <td><span class="required">*</span>手机<span class="bg-tishi"></span><br />
                            <input type="text" name="volunteer.cellPhone" id="cellPhone" value="${volunteer.cellPhone}" class="zc-input" required="required"/></td>
                    </tr>
                    <tr>
                        <td>微信<br />
                            <input type="text" name="volunteer.wechat" id="wechat" class="zc-input" /></td>
                    </tr>
                    <tr>
                        <td><span class="required">*</span>邮箱<span class="bg-tishi"></span><br />
                            <input type="text" name="volunteer.email" id="email" value="${volunteer.email}" class="zc-input"/></td>
                    </tr>

                </table>
            </div>
            <div class="bg-btn">
                <input class="Infor-btn" type="submit"  value="注册"/>
                <input class="Infor-btn" type="button"  value="取消" onclick="goBack()" />
            </div>
        </div>

        <%@ include file="volunteerFieldsValidation.jsp"%>

    </form>
</div>
</body>
</html>

