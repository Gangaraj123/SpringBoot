<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <!DOCTYPE html>
 <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
 
<html lang="en">
<head>
     <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://kit.fontawesome.com/9c4d841e13.js"
        crossorigin="anonymous"></script>
     <!-- script for jquery -->
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
     
    <link rel="stylesheet" href="/style.css">

    <title>Blogger</title>
</head>
<body>
	 <c:if test="${page!='login' && page!='signup' }">
	     <%@include file="navbar.jsp" %>
	 </c:if>  
  	<c:choose>  
    <c:when test="${page == 'login'}">  
      <%@include file="login.jsp" %>  
    </c:when>  
    <c:when test="${page == 'signup'}">  
        <%@include file="signup.jsp" %>
    </c:when> 
    <c:when test="${page == 'create'}">
      
        <%@include file="create.jsp" %>
    </c:when> 
    <c:when test="${page == 'home'}">  
         <jsp:include page="home.jsp">
        <jsp:param name="allblogs" value="${allblogs}"/>
    </jsp:include>
    </c:when> 
    <c:when test="${page == 'yourblogs'}">  
        <jsp:include page="yourblogs.jsp">
        <jsp:param name="allblogs" value="${blogs}"/>
    </jsp:include> 
    </c:when> 
    <c:when test="${page == 'edit'}">  
        <jsp:include page="Edit.jsp">
        <jsp:param name="blog" value="${blog}"/>
    </jsp:include>  
    </c:when> 
    <c:when test="${page == 'showblog'}">
    <jsp:include page="Display.jsp">
        <jsp:param name="blog" value="${blog}"/>
    </jsp:include>  
     </c:when> 
     
    <c:otherwise>  
       <%@include file="NotFound.jsp" %>
    </c:otherwise>  
</c:choose>  
     <footer class="container footer" style="text-align: center;">
        <p>© Gangaraju Bopparam - DAIICT</p>
    </footer>
    <!-- including scripts -->
    
    <script src="/client.js"></script>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>
</html>