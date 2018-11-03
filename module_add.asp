<%
		unit=request.querystring("unit")
		Dim oRS
		Set oConnection = Server.CreateObject("ADODB.Connection") 
		oConnection.Open("DSN=refarm" ) 
		Set oRS = oConnection.Execute("INSERT INTO `refarm`.`modules` (`unit`, `name`) VALUES ('"+unit+"', '"+request.form("nume")+"');")
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