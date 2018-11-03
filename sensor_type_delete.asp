<%		response.write(request.form("nume"))
		Dim oRS
		Set oConnection = Server.CreateObject("ADODB.Connection") 
		oConnection.Open("DSN=refarm" ) 
		Set oRS = oConnection.Execute("DELETE FROM sensor_type WHERE id="+request.querystring("type"))
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