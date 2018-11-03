<%
u = Request.Form("username")
p = Request.Form("password")
logoff=request.querystring

if u = "andy" and p="amiojane" then
 Session("username")="andy"
 session("topmenu")="panou"
 response.redirect("index.asp")
end if

if logoff="logoff" then
 Session("username") = ""
 response.redirect("index.asp")
end if 

%>