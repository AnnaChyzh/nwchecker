<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ tag description="userListt" pageEncoding="UTF-8"%>
<%@attribute name="contest" %>
<%@attribute name="contestId" %>
<!-- set path to resources folder -->
<spring:url value="/resources/" var="resources"/>
<head>
    <link href="${resources}js/bootstrapTables/bootstrap-table-heightFix.css" rel="stylesheet"/>
</head>
<div id="userListModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header modal-header-info">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title"><spring:message code="contest.userList.header"/></h4>
            </div>
            <div class="modal-body">
                <table id="ContestUserTable" data-toggle="table"
                       data-url="getContestUsersList.do?contestId=${contestId}"
                       data-classes="table table-hover"
                       data-click-to-select="true"
                       >
                    <thead>
                        <tr>
                            <th data-field="chose" data-checkbox="true" ></th>
                            <th data-field="id" data-sortable="true" class="idField">id</th>
                            <th data-field="displayName" data-sortable="true"><spring:message code="contest.userList.displayName"/></th>
                            <th data-field="department" data-sortable="true"><spring:message code="contest.userList.department"/></th>
                        </tr>
                    </thead>
                </table>
            </div>
            <div class="modal-footer">
                <button id="submitUserListButton" type="button" class="btn btn-primary"><spring:message code="btn.save"/></button>
                <button  type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="btn.close"/></button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->