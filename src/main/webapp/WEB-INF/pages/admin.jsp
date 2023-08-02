<%-- 
    Document   : admin.jsp
    Created on : 2 thg 8, 2023, 17:07:30
    Author     : vbmho
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:url value="/admin/index" var="action" />
<section class="container">
    <h1 class="text-center text-success mt-1">DANH SÁCH BÀI ĐĂNG</h1>
    <a href="<c:url value="/admin/posts"/>" class="btn btn-info mt-1">Thêm bài đăng</a>

    <c:if test="${pages > 1}">
        <ul class="pagination mt-1">
            <li class="page-item"><a class="page-link" href="${action}">Tất cả</a></li>
            <c:forEach begin="1" end="${pages}" var="i">
                <c:url value="/admin/index" var="pageUrl">
                    <c:param name="page" value="${i}" /> 
                </c:url>
                <li class="page-item"><a class="page-link" href="${pageUrl}">${i}</a></li>
            </c:forEach>
        </ul>

    </c:if>

    <table class="table" style="width:100%">
        <thead class="table-dark">
            <tr>
                <th style="width:10%">ID</th>
                <th colspan="2" style="width:60%">Tiêu đề</th>
                <th style="width:10%">Hệ đào tạo</th>
                <th style="width:10%"></th>
                <th style="width:10%"></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${posts}" var="p">
                <tr>
                    <td>${p.id}</td>
                    <td colspan="2">${p.title}</td>
                    <td>${p.typeoftrainningId.name}</td>
                    <td>
                        <a href="" class="btn btn-info">Cập nhật</a>
                    </td>
                    <td>
                        <button class="btn btn-danger" onclick="">Xóa</button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</section>
<script src="<c:url value="/js/main.js"/>"></script>
