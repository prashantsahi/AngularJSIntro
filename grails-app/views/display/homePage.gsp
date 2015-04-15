%{--<html>
<head>
    <meta name='layout' content='main'/>
    <title>todo</title>
    <style type='text/css' media='screen'>
    #login {
        margin: 15px 0px;
        padding: 0px;
        text-align: center;
    }

    #login .inner {
        width: 340px;
        padding-bottom: 6px;
        margin: 60px auto;
        text-align: left;
        border: 1px solid #aab;
        background-color: #f0f0fa;
        -moz-box-shadow: 2px 2px 2px #eee;
        -webkit-box-shadow: 2px 2px 2px #eee;
        -khtml-box-shadow: 2px 2px 2px #eee;
        box-shadow: 2px 2px 2px #eee;
    }

    #login .inner .fheader {
        padding: 18px 26px 14px 26px;
        background-color: #f7f7ff;
        margin: 0px 0 14px 0;
        color: #2e3741;
        font-size: 18px;
        font-weight: bold;
    }

    #login .inner .cssform p {
        clear: left;
        margin: 0;
        padding: 4px 0 3px 0;
        padding-left: 105px;
        margin-bottom: 20px;
        height: 1%;
    }

    #login .inner .cssform input[type='text'] {
        width: 120px;
    }

    #login .inner .cssform label {
        font-weight: bold;
        float: left;
        text-align: right;
        margin-left: -105px;
        width: 110px;
        padding-top: 3px;
        padding-right: 10px;
    }

    #login #remember_me_holder {
        padding-left: 120px;
    }

    #login #submit {
        margin-left: 15px;
    }

    #login #remember_me_holder label {
        float: none;
        margin-left: 0;
        text-align: left;
        width: 200px
    }

    #login .inner .login_message {
        padding: 6px 25px 20px 25px;
        color: #c33;
    }

    #login .inner .text_ {
        width: 120px;
    }

    #login .inner .chk {
        height: 12px;
    }
    </style>
</head>

<body>
<div id='login'>
    <div class='inner'>
        <div class='fheader'>please login</div>

        <g:if test='${flash.message}'>
            <div class='login_message'>${flash.message}</div>
        </g:if>

        <form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
            <p>
                <label for='username'>username:</label>
                <input type='text' class='text_' name='j_username' id='username'/>
            </p>

            <p>
                <label for='password'>password:</label>
                <input type='password' class='text_' name='j_password' id='password'/>
            </p>

            <p id="remember_me_holder">
                <input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
                <label for='remember_me'>remember me</label>
            </p>

            <p>
                <input type='submit' id="submit" value='${message(code: "springSecurity.login.button")}'/>
            </p>
        </form>
    </div>
</div>
<script type='text/javascript'>
    <!--
    (function() {
        document.forms['loginForm'].elements['j_username'].focus();
    })();
    // -->
</script>
</body>
</html>--}%



<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <asset:stylesheet src="bootstrap.css"/>

    <!-- Add custom CSS here -->
    <style>
    .span-label1 {
        display: inline-block;
        width: 100px;
    }
    </style>
    <asset:stylesheet src="sb-admin.css"/>
    <asset:stylesheet src="font-awesome.min.css"/>
    <!-- JavaScript -->
    <asset:javascript src="jquery-1.10.2.js"/>
    <asset:javascript src="bootstrap.js"/>
    <asset:javascript src="angular-1.2.16.js"/>
    <asset:javascript src="todo.js"/>

    <title>::HomePage::</title>
</head>

<body>
<div class="row">
    <div class="col-lg-1"></div>

    <div class="col-lg-4">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">Register</h3>
            </div>

            <div class="panel-body">
                <g:uploadForm name="registration" controller="display" id="registration">
                    <div>
                        <span class="span-label1">FirstName</span>
                        <g:textField name="firstName" id="firstName" placeholder="firstName"/>
                    </div><br>

                    <div id="div5">
                        <span class="span-label1">LastName</span>
                        <g:textField name="lastName" placeholder="Last Name" id="lastName"/>
                    </div><br>

                    <div>
                        <span class="span-label1">Email</span>
                        <g:textField name="email" placeholder="Email Id"/>
                    </div><br>

                    <div>
                        <span class="span-label1">UserName</span>
                        <g:textField name="username" placeholder="User Name"/>
                    </div><br>

                    <div>
                        <span class="span-label1">Password</span>
                        <g:textField name="password" placeholder="Password"/>
                    </div><br>


                %{--            <div>
                                <span class="span-label1">Confirm Password</span>
                                <g:textField name="confirmPassword" placeholder="Retype Password"/>
                            </div><br>--}%


                    <div>
                        <g:actionSubmit action="register" name="register" value="Register"
                                        style="float:left; margin-right: 150px"/>
                    </div>
                </g:uploadForm>
            </div>
        </div>
    </div>

    <div class="col-lg-2"></div>

%{--

    <div class="col-lg-4">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">Login</h3>
            </div>

            <div class="panel-body">
                <g:form class="form-box" name="login" controller="login">
                    <div>
                        <span class="span-label1">UserName*</span>
                        <g:textField name="username" placeholder="UserName"/>
                    </div><br>

                    <div>
                        <span class="span-label1">Password*</span>
                        <g:passwordField name="password" placeholder="Password"/>
                    </div><br>

         <span><g:link controller="login"
                                       action="showForgotPassword">Forgot Password</g:link></span>
                         <span></span>

                    <g:actionSubmit name="button" value="Login" action="loginHandler"
                                    style="float:right;margin-right: 150px"/>
                </g:form>
            </div>
        </div>
    </div>

--}%

    <div class="col-lg-4">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">Login</h3>
            </div>

            <div class="panel-body">
                <g:form name="login" method="POST"  uri="/j_spring_security_check">
                    <ul>
                        <li>
                            <label for="j_username">Username:</label>
                            <g:textField name="j_username"/>
                        </li>
                        <li>
                            <label for="j_password">Password:</label>
                            <g:passwordField name="j_password"/>
                        </li>
                    </ul>
                    <div class="button-panel">
                        <g:submitButton name="banner-login-button" value="Log in" />
                    </div>
                </g:form>
            </div>
        </div>
    </div>


    <div class="col-lg-1"></div>

</div>

</body>
</html>