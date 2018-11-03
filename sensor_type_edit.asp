<%
	tipuri=request.querystring("type")
	name=request.form("name")
	desc=request.form("desc")
		Dim oRS
		Set oConnection = Server.CreateObject("ADODB.Connection") 
		sql="UPDATE `refarm`.`sensor_type` SET `name`='"+request.form("nume")+"' WHERE `id`='"+tipuri+"';"
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
		response.redirect("index.asp?right=senzori")

%>