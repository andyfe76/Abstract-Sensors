<%
		modele=request.querystring("modele")
		Dim oRS
		Set oConnection = Server.CreateObject("ADODB.Connection") 
		oConnection.Open("DSN=refarm" ) 

		sql = "UPDATE `refarm`.`sensor_models` SET `name`='"+request.form("nume")+"', "
		sql = sql + "`desc`='"+request.form("desc")+"',"
		sql = sql + "`P1`='" + request.form("p1") + "',"
		sql = sql + "`P2`='" + request.form("p2") + "',"
		sql = sql + "`P3`='" + request.form("p3") + "',"
		sql = sql + "`P4`='" + request.form("p4") + "' WHERE `id`='"+modele+"';"



		Set oRS = oConnection.Execute(sql)
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