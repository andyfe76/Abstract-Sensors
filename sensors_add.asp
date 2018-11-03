<%
		s_model=request.querystring("sensor_model")
		s_type=request.querystring("sensor_type")
		s_module = session("module")

		Dim oRS
		Set oConnection = Server.CreateObject("ADODB.Connection") 
		oConnection.Open("DSN=refarm" ) 
		sql = "INSERT INTO `refarm`.`sensors` (`modules`, `sensor_model`, `sensor_type`, `P1`, `P2`, `P3`, `P4`) VALUES ('"
		sql = sql + s_module+"','"+s_model+"','"+s_type+"','"+request.querystring("p1")+"','"+request.querystring("p2")+"','"+request.querystring("p3")+"','"+request.querystring("p4")+"');"
		Set oRS = oConnection.Execute(sql)
		'response.write(sql)
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