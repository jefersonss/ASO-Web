<%-- <%@page import="com.adp.cosenhview.dao.adapter.PodSelector.Pod"%> --%>
<%@ include file="/WEB-INF/jsp/include/include.jsp" %>

    <!-- Fixed navbar -->
    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="${pageContext.request.contextPath}/">ASO Web View</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
          	<li><a href="${pageContext.request.contextPath}/">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/pacientes">Pesquisar Pacientes</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>