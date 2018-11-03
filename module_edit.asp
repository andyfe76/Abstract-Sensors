<%
	module=request.querystring("module")
	name=request.form("name")
	desc=request.form("desc")
		Dim oRS
		Set oConnection = Server.CreateObject("ADODB.Connection") 
		sql="UPDATE `refarm`.`modules` SET `name`='"+request.form("nume")+"' WHERE `id`='"+module+"';"
		response.write(sql)
		oConnection.Open("DSN=refarm" ) 
		Set oRS = oConnection.Execute(sql)
		if oRs.state = 1 then 
		oRS.Close
		Set oRS = Nothing
		end if
		if oConnection.state = 1 then
		oConnection.Close
		Set oConnection = Nothing
		end if
		response.redirect("index.asp")

%>