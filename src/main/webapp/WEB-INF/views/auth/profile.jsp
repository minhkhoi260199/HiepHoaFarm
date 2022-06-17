<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="tmp" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<tmp:adminTemplate title="Register">
	<jsp:attribute name="content">
		 <div class="page-content">
            <div class="container">
                <div class="login-wrap">
                    <div class="login-content">
                        <div class="login-logo">
                            <a href="#">
                                <img src="${pageContext.request.contextPath }/resources/images/icon/logo.png"
								alt="CoolAdmin">
                            </a>
                        </div>
                        <div class="login-form">
                            <s:form method="post" action="${pageContext.request.contextPath }/auth/profile" modelAttribute="user">
                                <s:hidden path="idUser" name="idUser" id="idUser"/>
                                <s:hidden path="roleId" name="roleId" id="roleId"/>
                                <s:hidden path="statusId" name="statusId" id="statusId"/>
                                <span style="color:red">${msg }</span>
                                <div class="form-group">
                                    <label>Username</label> <s:errors path="username" style="color:red; font-style:italic"></s:errors>
                                    <s:input
										class="au-input au-input--full" type="number" name="username" path="username"
										placeholder="Số điện thoại"/>
                                </div>
                                <div class="form-group">
                                    <label>Password</label> <s:errors path="password" style="color:red; font-style:italic"></s:errors>
                                    <s:input
										class="au-input au-input--full" type="password"
										name="password" placeholder="Password" path="password"/>
                                </div>
                                 <div class="form-group">
                                    <label>Họ và Tên</label> <s:errors path="fullname" style="color:red; font-style:italic"></s:errors>
                                    <s:input
										class="au-input au-input--full" type="text" name="fullname"
										placeholder="Tên nhân viên" path="fullname"/>
                                </div>
                                <div class="form-group">
                                    <label>Địa Chỉ</label> <s:errors path="address" style="color:red; font-style:italic"></s:errors>
                                    <s:input
										class="au-input au-input--full" type="text" name="address"
										placeholder="Địa chỉ thường trú" path="address"/>
                                </div>
                                <div class="form-group">
                                    <label>Email:</label> <s:errors path="email" style="color:red; font-style:italic"></s:errors>
                                    <s:input
                                            class="au-input au-input--full" type="email" name="email"
                                            placeholder="linhfarm@gmail.com" path="email"/>
                                </div>
                                <button
									class="au-btn au-btn--block au-btn--green m-b-20" type="submit">
									Lưu thay đổi
								</button>
                            </s:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</jsp:attribute>
</tmp:adminTemplate>