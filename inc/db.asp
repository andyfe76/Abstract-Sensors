<%
sub db_exec(sql)
	Dim oRS
	Set oConnection = Server.CreateObject("ADODB.Connection") 
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
end sub

function db_open(sql)
	Dim oRs
	Set oConnection = Server.CreateObject("ADODB.Connection") 
	oConnection.Open("DSN=refarm" ) 
	Set oRS = oConnection.Execute(sql)
	db_open = oRs.GetRows
end function


%>