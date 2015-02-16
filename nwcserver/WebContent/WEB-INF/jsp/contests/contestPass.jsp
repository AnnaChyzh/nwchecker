<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- set path to resources folder -->
<spring:url value="/resources/" var="resources" />
<html>
<!--including head -->
<head>
<jsp:include page="../fragments/staticFiles.jsp" />
<link rel="stylesheet" href="${resources}css/bootstrap-select.min.css" />
<link rel="stylesheet" href="${resources}css/contests/contestPass.css" />
<script type="text/javascript" src="${resources}js/bootstrap/bootstrap-select.js"></script>
</head>
<body>
	<div class="wrapper container">
		<!--including bodyHead -->
		<!-- send name of current page-->
		<jsp:include page="../fragments/bodyHeader.jsp">
			<jsp:param name="pageName" value="contest" />
		</jsp:include>
		<!-- Shows tasks navigation list and marks every task status -->
		<div id="tasks" class="col-md-3">
			<ul class="nav nav-pills nav-stacked">
				<c:url var="taskURL" value="/passTask.do?id=" scope="page" />
				<c:set var="count" value="0" scope="page" />
				<c:forEach var="taskId" items="${tasksIdList}">
					<c:set var="count" value="${count + 1}" scope="page"/>
					<c:set var="taskResult" value="${taskResults[taskId]}"
						scope="page" />
					<c:set var="taskTitle" value="${taskTitles[taskId]}"
						scope="page" />
					<c:choose>
						<c:when test="${taskId eq currentTask.id}">
							<li class="active">
								<a href="${taskURL}${taskId}">
									${count}. ${taskTitle}
								</a>
							</li>
						</c:when>
						<c:when test="${taskResult == null}">
							<li class="default">
								<a href="${taskURL}${taskId}">
									${count}. ${taskTitle}
								</a>
							</li>
						</c:when>
						<c:when test="${taskResult == true}">
							<li class="success">
								<a href="${taskURL}${taskId}">
									${count}. ${taskTitle]}
								</a>
							</li>
						</c:when>
						<c:when test="${taskResult == false}">
							<li class="fail">
								<a href="${taskURL}${taskId}">
									${count}. ${taskTitle}
								</a>
							</li>
						</c:when>
					</c:choose>
				</c:forEach>
			</ul>
		</div>
		<!-- Current Task information -->
		<div class="col-md-9">
			<div class="page-header">
				<h2>
					${currentTask.title} 
					<small> 
						(<spring:message code="contest.passing.rate.caption"/>
						<b>${currentTask.complexity}</b>)
					</small>
				</h2>
			</div>
			<c:set var="currentTaskResult"
				value="${taskResults[currentTask.id]}" scope="page" />
			<c:choose>
				<c:when test="${currentTaskResult == null}">
					<div class="descr-default">
						<p>${currentTask.description}</p>
					</div>
				</c:when>
				<c:when test="${currentTaskResult == true}">
					<div class="descr-success">
						<p>${currentTask.description}</p>
					</div>
				</c:when>
				<c:when test="${currentTaskResult == false}">
					<div class="descr-fail">
						<p>${currentTask.description}</p>
					</div>
				</c:when>
			</c:choose>
			<div class="row">
				<div class="col-sm-offset-1 col-sm-4" align="right">
					<h4>
						<spring:message code="contest.passing.timeLimit.caption" />
						<b>${currentTask.timeLimit}</b>
					</h4>
					<h4>
						<spring:message code="contest.passing.memoryLimit.caption" />
						<b>${currentTask.memoryLimit}</b>
					</h4>
				</div>
				<div class="col-sm-4" align="right">
					<h4>
						<spring:message code="contest.passing.inputFile.caption" />
						<b>${currentTask.inputFileName}</b>
					</h4>
					<h4>
						<spring:message code="contest.passing.outputFile.caption" />
						<b>${currentTask.outputFileName}</b>
					</h4>
				</div>
			</div>
			<br/><br/>
			<!-- Send answer form -->
			<div class="row">
				<form:form class="form-horizontal" modelAttribute="currentTask"
					method="post" enctype="multipart/form-data" role="form"
					action="submitTask.do">
					<form:hidden path="id" />
					<div class="form-group">
						<div class="col-sm-offset-4 col-sm-4">
							<select id="compilerId" name="compilerId" class="selectpicker">
								<option value="1">Compiler1</option>
								<option value="2">Compiler2</option>
								<option value="3">Compiler3</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-4 col-sm-4">
							<span class="btn btn-block btn-file"> <spring:message
									code="contest.passing.uploadSourceFile.caption" /> <input
								type="file" id="file" name="file">
							</span>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-4 col-sm-4">
							<button type="submit" class="btn btn-info btn-block">
								<spring:message code="contest.passing.submitButton.caption" />
							</button>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<jsp:include page="../fragments/footer.jsp" />
</body>
</html>