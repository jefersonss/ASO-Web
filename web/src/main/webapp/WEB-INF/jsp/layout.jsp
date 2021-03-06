<%@ include file="/WEB-INF/jsp/include/include.jsp" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><tiles:getAsString name="title"/></title>

    <!-- Bootstrap -->
<%--     <link href="${pageContext.request.contextPath}/resources/theme-default/css/bootstrap.min.css" rel="stylesheet"> --%>
	<!-- Custom styles for this template -->
<%--     <link href="${pageContext.request.contextPath}/resources/theme-default/css/theme.css" rel="stylesheet"> --%>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body role="document">

    <!-- Fixed navbar -->
    <tiles:insertAttribute name="header" />
    
	<tiles:insertAttribute name="body" />	

	<tiles:insertAttribute name="footer" />
		
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
     <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<%--     <script src="${pageContext.request.contextPath}/resources/theme-default/js/jquery/1.11.0/jquery.min.js"></script> --%>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
<%--     <script src="${pageContext.request.contextPath}/resources/theme-default/js/bootstrap.min.js"></script> --%>
  </body>
</html>