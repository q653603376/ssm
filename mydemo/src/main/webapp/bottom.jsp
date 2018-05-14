<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>Insert title here</title>
<style type="text/css">
#pagination,.f-16,#pagination li{
	display: inline;
}
</style>
</head>
<body>
<!-- 底部分页 -->
        <div class="text-c" style="padding-top: 30px;">
        <c:if test="${totalPage>0}">
        	<c:if test="${currPage!=1}">
        	<button class="btn size-L btn-secondary radius" onclick="page(${1},${pageSize})">首页</button>
        	</c:if>
        	<c:if test="${currPage>1}"> 
        	<button class="btn size-L btn-primary radius" onclick="page(${currPage>1?currPage-1:1},${pageSize})">上一页</button>        	                        
            </c:if>
            
            <c:if test="${totalPage<= 10}">  
            	<c:forEach var="i" begin="1" end="${totalPage}">
            		<ul id="pagination">
                        <c:choose>
                            <c:when test="${i==currPage}">  
                                <li><button class="btn size-L size-MINI btn-secondary radius" onclick="page(${i},${pageSize})">${i}</button></li>  
                            </c:when>
                            <c:otherwise>  
                                <li><button class="btn size-L size-MINI radius" onclick="page(${i},${pageSize})">${i}</button></li>  
                            </c:otherwise>
                        </c:choose>
                    </ul>  
                </c:forEach>  
            </c:if>
            <c:if test="${totalPage > 10}">
            
            	<c:if test="${currPage< 10}">  
                        <c:forEach var="i" begin="1" end="10">
                        	<ul id="pagination">  
                            <c:choose>  
                                <c:when test="${i ==currPage}">  
                                    <li class="active"><button class="btn size-L btn-secondary radius" onclick="page(${i},${pageSize})">${i}</button></li>  
                                </c:when>  
                                <c:otherwise>  
                                    <li><button class="btn size-L radius" onclick="page(${i},${pageSize})">${i}</button></li>  
                                </c:otherwise>  
                            </c:choose>
                            </ul>  
                        </c:forEach>  
                </c:if>
                
                <c:if test="${currPage >= 10}">  
                        <c:forEach var="j" begin="${currPage-5}" end="${currPage+4}"> 
                        	<ul id="pagination">
                            <c:if test="${j <= totalPage}">  
                                <c:choose>  
                                    <c:when test="${j == currPage}">  
                                        <li class="active"><button class="btn size-L btn-secondary radius" onclick="page(${j},${pageSize})">${j}</button></li>  
                                    </c:when>  
                                    <c:otherwise>  
                                        <li><button class="btn size-L radius" onclick="page(${j},${pageSize})">${j}</button></li>  
                                    </c:otherwise>  
                                </c:choose>  
                            </c:if>
                            </ul>  
                        </c:forEach>  
                    </c:if>
            </c:if>         	
            <c:if test="${currPage<totalPage}">              	       
            <button class="btn size-L btn-primary radius" onclick="page(${currPage==totalPage?currPage:currPage+1},${pageSize})">下一页</button>
            </c:if>
            <c:if test="${currPage!=totalPage}">
            <button class="btn size-L btn-secondary radius" onclick="page(${totalPage},${pageSize})">尾页</button>
            </c:if>
           	&nbsp;&nbsp;&nbsp;&nbsp;
           	 	<input type="hidden" name="beginTime" value="${beginTime}" />
            	<input type="hidden" name="endTime" value="${endTime}" />
            	<input type="hidden" name="conditions" value="${conditions}" />
            	<input type="hidden" name="pageSize" value="${pageSize}" />
               	<p style="display: inline;" class="f-16">跳转</p>
                <input placeholder="页数" class="input-text radius size-M" type="text" style="width: 50px;" id="currPage" name="currPage" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();" >
                <button class="btn size-M btn-success" type="submit" onclick="checkNull()" class="btn size-MINI radius">确认</button>
           &nbsp;&nbsp;&nbsp;&nbsp;
          	 显示
	        <select id="record" name="record" onchange="changeTitle()">
			    <option value="10" <c:out value="${pageSize!=10?1:null}" default="selected"/> >10</option>
			    <option value="20" <c:out value="${pageSize!=20?1:null}" default="selected"/> >20</option>
			    <option value="50" <c:out value="${pageSize!=50?1:null}" default="selected"/> >50</option>
			    <option value="100" <c:out value="${pageSize!=100?1:null}" default="selected"/> >100</option>
	        </select>
           	条
           	&nbsp;&nbsp;&nbsp;&nbsp;
        	<span style="display: inline;">当前页：${currPage } 页      共：${totalPage }页/${count}条</span>
      		
      </c:if>
      </div>
</body>
</html>