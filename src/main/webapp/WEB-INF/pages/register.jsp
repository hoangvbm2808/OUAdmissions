<%-- 
    Document   : register
    Created on : 31 thg 7, 2023, 12:22:27
    Author     : vbmho
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    * {
        box-sizing: border-box
    }

    /* Add padding to containers */
    .container {
        margin: 100px;
    }

    /* Full-width input fields */
    input[type=text], input[type=password] {
        width: 100%;
        padding: 15px;
        margin: 5px 0 22px 0;
        display: inline-block;
        border: none;
        background: #f1f1f1;
    }

    input[type=text]:focus, input[type=password]:focus {
        background-color: #ddd;
        outline: none;
    }

    /* Overwrite default styles of hr */
    hr {
        border: 1px solid #f1f1f1;
        margin-bottom: 25px;
    }

    /* Set a style for the submit/register button */
    .registerbtn {
        background-color: #04AA6D;
        color: white;
        padding: 16px 20px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        width: 100%;
        opacity: 0.9;
        font-size: 20px;
    }

    .registerbtn:hover {
        opacity:1;
    }

    /* Add a blue text color to links */
    a {
        color: dodgerblue;
    }

    /* Set a grey background color and center the text of the "sign in" section */
    .signin {
        background-color: #f1f1f1;
        text-align: center;
    }
</style>
<div class="container">
    <h1>Đăng ký</h1>

        <hr>
    <form:form action="" method="POST" modelAttribute="user" enctype="multipart/form-data">

        
        <div class="form-group">
            <label for="first_name"><b>Tên</b></label>
            <form:input type="text" placeholder="Nhập tên"  path="firstName" required="required" autocomplete="off" id="first_name"  />
            
            <label for="last_name"><b>Họ</b></label>
            <form:input type="text" placeholder="Nhập họ" path="lastName" required="required" autocomplete="off" id="last_name"/>

            <label for="email"><b>Địa chỉ Email</b></label>
            <form:input type="text" placeholder="Nhập email" path="email" required="required" autocomplete="off" id="email"/>

            <label for="phone"><b>Số điện thoại</b></label>
            <form:input type="text" placeholder="Nhập số điện thoại" path="phone" required="required" autocomplete="off" id="phone"/>

            <label for="username"><b>Tên đăng nhập</b></label>
            <form:input type="text" placeholder="Nhập tên tài khoản" path="username" required="required" autocomplete="off" id="username"/>

            <label for="psw"><b>Mật khẩu</b></label>
            <form:input type="password" placeholder="Nhập mật khẩu" path="password" required="required" autocomplete="off" id="password"/>


            <label for="avatar">Chọn ảnh đại diện:</label>

            <form:input type="file" id="file" path="file" cssClass="form-control" accept="image/png, image/jpeg" />
            <hr>

            <p>Thông tin & chính sách sử dụng <a href="#">OUAdmissions</a>.</p>
            <button type="submit" class="registerbtn">Đăng ký</button>

        </div>        

        <div class="container signin">
            <p>Bạn đã có tài khoản? <a href="#">Đăng nhập</a>.</p>
        </div>
    </form:form>
</div>

