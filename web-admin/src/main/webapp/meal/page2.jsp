<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<div style="display:flex;justify-content: center;margin: 0px auto;">
<FORM METHOD="post" ACTION="${ctxPath}/meal/mealController?action=${param.get("action")}${(empty param.get("nameKeyword"))?"":"&nameKeyword="}${param.get("nameKeyword")}${(empty param.get("featureName"))?"":"&featureName="}${param.get("featureName")}">
    <%if (rowsPerPage < rowNumber) {%>
    <%if (pageIndex >= rowsPerPage) {%>

    <A href="${ctxPath}/meal/mealController?action=${param.get("action")}${(empty param.get("nameKeyword"))?"":"&nameKeyword="}${param.get("nameKeyword")}${(empty param.get("featureName"))?"":"&featureName="}${param.get("featureName")}&whichPage=1" type="button" class="button" style="text-decoration: none;color:#333;">至第一頁</A>&nbsp;
    <A href="${ctxPath}/meal/mealController?action=${param.get("action")}${(empty param.get("nameKeyword"))?"":"&nameKeyword="}${param.get("nameKeyword")}${(empty param.get("featureName"))?"":"&featureName="}${param.get("featureName")}&whichPage=<%=whichPage-1%>" type="button" class="button" style="text-decoration: none;color:#333;">上一頁</A>&nbsp;

    <%}%>
    <%if (pageNumber > 1) {%>
    <select size="1" name="whichPage">
        <%for (int i = 1; i <= pageNumber; i++) {%>
        <option value="<%=i%>">跳至第<%=i%>頁
                <%}%>
    </select>
    <input type="submit" value="確定">
    <%}%>
    <%if (pageIndex < pageIndexArray[pageNumber - 1]) {%>

    <A href="${ctxPath}/meal/mealController?action=${param.get("action")}${(empty param.get("nameKeyword"))?"":"&nameKeyword="}${param.get("nameKeyword")}${(empty param.get("featureName"))?"":"&featureName="}${param.get("featureName")}&whichPage=<%=whichPage+1%>" type="button" class="button" style="text-decoration: none;color:#333;">下一頁</A>&nbsp;
    <A href="${ctxPath}/meal/mealController?action=${param.get("action")}${(empty param.get("nameKeyword"))?"":"&nameKeyword="}${param.get("nameKeyword")}${(empty param.get("featureName"))?"":"&featureName="}${param.get("featureName")}&whichPage=<%=pageNumber%>" type="button" class="button" style="text-decoration: none;color:#333;">至最後一頁</A>&nbsp;

    <%}%>
    <%}%>

</FORM>
</div> 
<br><br>

