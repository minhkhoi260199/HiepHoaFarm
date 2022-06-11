<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="tmp" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<tmp:authTemplate title="Register">
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
                            <s:form method="post" action="${pageContext.request.contextPath }/auth/register" modelAttribute="user">
                                <div class="form-group">
                                    <label>Username</label> <s:errors path="username" style="color:red; font-style:italic"></s:errors>
                                    <s:input
										class="au-input au-input--full" type="text" name="username" path="username"
										placeholder="Username"/>
                                </div>
<%--                                <div class="form-group">--%>
<%--                                    <label>Email Address</label> <s:errors path="email" style="color:red; font-style:italic"></s:errors>--%>
<%--                                    <s:input--%>
<%--										class="au-input au-input--full" type="email" name="email"--%>
<%--										placeholder="Email" path="email"/>--%>
<%--                                </div>--%>
                                <div class="form-group">
                                    <label>Password</label> <s:errors path="password" style="color:red; font-style:italic"></s:errors>
                                    <s:input
										class="au-input au-input--full" type="password"
										name="password" placeholder="Password" path="password"/>
                                </div>
<%--                                 <div class="form-group">--%>
<%--                                    <label>Name</label> <s:errors path="name" style="color:red; font-style:italic"></s:errors>--%>
<%--                                    <input--%>
<%--										class="au-input au-input--full" type="text" name="name"--%>
<%--										placeholder="Name" path="name"/>--%>
<%--                                </div>--%>
<%--                                <div class="form-group">--%>
<%--                                    <label>Address</label> <s:errors path="address" style="color:red; font-style:italic"></s:errors>--%>
<%--                                    <input--%>
<%--										class="au-input au-input--full" type="text" name="address"--%>
<%--										placeholder="Address" path="address"/>--%>
<%--                                </div>--%>
<%--                                <div class="form-group">--%>
<%--                                    <label>Phone</label> <s:errors path="phone" style="color:red; font-style:italic"></s:errors>--%>
<%--                                    <s:input--%>
<%--										class="au-input au-input--full" type="phone" name="phone"--%>
<%--										placeholder="Phone" path="phone"/>--%>
<%--                                </div>--%>
                                <!-- <div class="login-checkbox">
                                    <label>
                                        <input type="checkbox" name="aggree">Agree the terms and policy
                                    </label>
                                </div> -->
                                <button
									class="au-btn au-btn--block au-btn--green m-b-20" type="submit">
									register
								</button>
                            </s:form>
                            <div class="register-link">
                                <p>
                                    Already have account?
                                    <a href="${pageContext.request.contextPath }/auth/login">Sign In</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</jsp:attribute>
</tmp:authTemplate>