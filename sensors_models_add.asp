<%
		tipuri=request.querystring("tipuri")
		Dim oRS
		Set oConnection = Server.CreateObject("ADODB.Connection") 
		oConnection.Open("DSN=refarm" ) 

		sql = "INSERT INTO sensor_models (`sensor_type`, `name`, `desc`, `P1`, `P2`, `P3`, `P4`) "
		sql = sql + "VALUES ('"+tipuri+"', '"+request.form("nume")+"','"+request.form("desc")+"'"
		sql = sql + " ,'" + request.form("pin1") + "'"
		sql = sql + " ,'" + request.form("pin2") + "'"
		sql = sql + " ,'" + request.form("pin3") + "'"
		sql = sql + " ,'" + request.form("pin4") + "');"


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