<%-- 
    Document   : add_department
    Created on : 13 thg 8, 2023, 22:30:30
    Author     : vbmho
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:url value="/admin/departments/add" var="action" />
<section class="container">
    <h1 class="text-center text-success mt-1">THÊM KHOA</h1>
    <div class="mt-3">

        <c:if test="${errMsg != null}">
            <div class="alert alert-danger">
                ${errMsg}
            </div>
        </c:if>
        <hr>
        <form:form action="${action}" method="post" modelAttribute="department">
            <form:errors path="*" element="div" cssClass="alert alert-danger" />

            <form:hidden path="id" />
            <div class="mt-3">
                <label for="title"><b>Tên khoa</b></label>
                <div class="form-floating mb-3">
                    <form:input type="text" class="form-control" path="name" id="name"  />

                </div>
            </div>

            <div class="mt-3">
                <label for="typeoftrainningId"><b>Hệ đào tạo</b></label>
                <div class="form-floating">
                    <form:select class="form-select" id="type" name="type" path="typeoftrainningId.id">
                        <c:forEach items="${types}" var="t">
                            <c:choose>
                                <c:when test="${t.id == department.typeoftrainningId.id}">
                                    <option value="${t.id}" selected>${t.name}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${t.id}">${t.name}</option>
                                </c:otherwise>
                            </c:choose>

                        </c:forEach>
                    </form:select>
                </div>
            </div>


            <div class="mt-3">
                <label for="content"><b>Mô tả</b></label>
                <div class="form-floating mb-3">
                    <form:textarea rows="5" class="form-control" path="description" id="description"/>
                </div>
            </div>

            <div class="mt-3">
                <label for="content"><b>Website</b></label>
                <div class="form-floating mb-3">
                    <form:textarea rows="5" class="form-control" path="website" id="website"/>
                </div>
            </div>

            <div class="mt-3">
                <label for="content"><b>Điểm chuẩn</b></label>
                <div class="form-floating mb-3">
                    <form:textarea rows="5" class="form-control" path="averageScore" id="averageScore"/>
                </div>
            </div>

            <div class="mt-3">
                <label for="content"><b>Chương trình đào tạo</b></label>
                <div class="form-floating mb-3">
                    <form:textarea rows="5" class="form-control" path="educationProgram" id="educationProgram"/>
                </div>
            </div>


            <div class="form-floating mb-3 mt-3">
                <button class="btn btn-info mt-1" type="submit">
                    <c:choose>
                        <c:when test="${department.id != null}">
                            Cập nhật
                        </c:when>
                        <c:otherwise>
                            Thêm khoa
                        </c:otherwise>
                    </c:choose>
                </button>
            </div>


        </form:form>
</section>
<script src="<c:url value="/js/main.js"/>"></script>