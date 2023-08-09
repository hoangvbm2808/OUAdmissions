<%-- 
    Document   : admin.jsp
    Created on : 2 thg 8, 2023, 17:07:30
    Author     : vbmho
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:url value="/admin/post" var="action" />
<section class="container">
    <h1 class="text-center text-success mt-1">DANH SÁCH BÀI ĐĂNG</h1>
    <a href="<c:url value="/admin/post/add"/>" class="btn btn-success mt-1">Thêm bài đăng</a>

    <c:if test="${pages > 1}">
        <ul class="pagination mt-1">
            
            
            <c:url value="/admin/post" var="pageUrl">
                    <c:param name="page" value="0" /> 
                </c:url>
                <li class="page-item"><a class="page-link" href="${pageUrl}">Tất cả</a></li>
            
            <c:forEach begin="1" end="${pages}" var="i">
                <c:url value="/admin/post" var="pageUrl">
                    <c:param name="page" value="${i}" /> 
                </c:url>
                <li class="page-item"><a class="page-link" href="${pageUrl}">${i}</a></li>
            </c:forEach>
        </ul>

    </c:if>

    <table class="table table-hover rounded-pill" style="width:100%">
        <thead class="table-dark">
            <tr>
                <th class="text-center" style="width:10%">ID</th>
                <th class="text-center" colspan="2" style="width:60%">Tiêu đề</th>
                <th class="text-center" style="width:10%">Hệ đào tạo</th>
                <th class="text-center" style="width:10%">Cập nhật</th>
                <th class="text-center" style="width:10%">Xóa</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${posts}" var="p">
                <tr>
                    <td class="text-center">${p.id}</td>
                    <td colspan="2">${p.title}</td>
                    <td>${p.typeoftrainningId.name}</td>
                    <td class="text-center">
                        <a href="" class=" btn btn-success">Cập nhật</a>
                    </td>
                    <td class="text-center">
                        <button class="btn btn-danger text-center" onclick="">Xóa</button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</section>
<script src="<c:url value="/js/main.js"/>"></script>
