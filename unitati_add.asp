<%
	if request.querystring="add" then
		Dim oRS
		Set oConnection = Server.CreateObject("ADODB.Connection") 
		oConnection.Open("DSN=refarm" ) 
		Set oRS = oConnection.Execute("INSERT INTO `refarm`.`units` (`name`, `desc`) VALUES ('"+request.form("nume")+"', '"+request.form("desc")+"');")
		if oRs.state = 1 then 
		oRS.Close
		Set oRS = Nothing
		end if
		if oConnection.state = 1 then
		oConnection.Close
		Set oConnection = Nothing
		end if
		response.redirect("index.asp")
	end if
%>