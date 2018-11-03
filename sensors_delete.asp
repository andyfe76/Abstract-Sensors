<%		response.write(request.form("nume"))
		Dim oRS
		Set oConnection = Server.CreateObject("ADODB.Connection") 
		oConnection.Open("DSN=refarm" ) 
		Set oRS = oConnection.Execute("DELETE FROM sensor_models WHERE id="+request.querystring("modele"))
		if oRs.state = 1 then 
		oRS.Close
		Set oRS = Nothing
		end if
		if oConnection.state = 1 then
		oConnection.Close
		Set oConnection = Nothing
		end if
		response.redirect("index.asp?tipuri="+session("tipuri"))

%>