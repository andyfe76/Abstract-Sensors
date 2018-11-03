<%
on error resume next
%>

<div class="row">
	<div class="col s3 center orange lighten-2">
		<span class="flow-text white-text"><bold>Unitati</bold>
		<a style="color:white" href="#unitati_add" class="modal-trigger"><i class="mdi-content-add right"></i></a>
		</span>
	</div>
	<div class="col s1">
		&nbsp
	</div>
	<div class="col s3 center orange lighten-2">
		<span class="flow-text white-text"><bold>Module</bold><a style="color:white" href="#module_add" class="modal-trigger"><i class="mdi-content-add right"></i></a></span>
	</div>
	<div class="col s1">
		&nbsp
	</div>
	<div class="col s3 center orange lighten-2">
		<span class="flow-text white-text"><bold>Senzori</bold><a style="color:white" href="#senzori_add" class="modal-trigger"><i class="mdi-content-add right"></i></a></span>
	</div>
	</div>

<%
senzori=request.querystring("senzori")
if senzori<>"" then
  session("senzori")=senzori
else
  senzori=session("senzori")
end if

unit=request.querystring("unit")
if unit<>"" then
  session("unit")=unit
  session("senzori")="0"
  senzori="0"
  module="0"
  session("module")="0"
else
  unit=session("unit")
end if
if unit="" then unit="0"

module=request.querystring("module")
if module<>"" then
  session("module")=module
else
  module=session("module")
end if
if module="" then module="0"

action=request.querystring("action")
if action="delete_unit" then
	Set oConnection = Server.CreateObject("ADODB.Connection")
	oConnection.Open("DSN=refarm" )
	sql="DELETE FROM units WHERE id="+unit
	Set oRS = oConnection.Execute(sql)
	if oRs.state = 1 then
		oRS.Close
		Set oRS = Nothing
	end if
	if oConnection.state = 1 then
		oConnection.Close
		Set oConnection = Nothing
	end if
	response.redirect("index.asp?right=unitati")
end if

if action="delete_module" then
	Set oConnection = Server.CreateObject("ADODB.Connection")
	oConnection.Open("DSN=refarm" )
	sql="DELETE FROM modules WHERE id="+module
	Set oRS = oConnection.Execute(sql)
	if oRs.state = 1 then
		oRS.Close
		Set oRS = Nothing
	end if
	if oConnection.state = 1 then
		oConnection.Close
		Set oConnection = Nothing
	end if
	response.redirect("index.asp?unit="+unit)
end if

if action="delete_senzori" then
	Set oConnection = Server.CreateObject("ADODB.Connection")
	oConnection.Open("DSN=refarm" )
	sql="DELETE FROM sensors WHERE id="+request.querystring("senzori")
	Set oRS = oConnection.Execute(sql)
	if oRs.state = 1 then
		oRS.Close
		Set oRS = Nothing
	end if
	if oConnection.state = 1 then
		oConnection.Close
		Set oConnection = Nothing
	end if
	response.redirect("index.asp?module="+module)
end if

%>

<div class="col s3 center">
	<%

		Set oConnection = Server.CreateObject("ADODB.Connection")
		oConnection.Open("DSN=refarm" )
		Set oRS = oConnection.Execute("SELECT * FROM units")

		While Not oRS.EOF
	%>
		<div class="row">
			<%
			if unit<>Cstr(oRS("id")) then
			%>
			<a class="waves-effect waves-light btn-large orange lighten-2" style="width:100%" href="index.asp?unit=<%=oRS("id")%>"><%=oRS("name")%></a>
			<%else%>
			<a class="waves-effect waves-light btn-large orange" style="width:100%"><%=oRS("name")%>
				<i class="mdi-action-delete modal-trigger left" href="#unitati_delete"></i>
				<i class="mdi-image-edit modal-trigger right" href="#unitati_edit"></i>
			</a>
			<%end if%>
		</div>
	<%
		oRS.MoveNext
		Wend
		if oRs.state = 1 then
			oRS.Close
		end if
		Set oRS = Nothing
		if oConnection.state = 1 then
			oConnection.Close
		end if
		Set oConnection = Nothing
	%>
	</div>

	<div class="col s1">
		&nbsp
	</div>
	<div class="col s3 center">
		<%
		Set oConnection = Server.CreateObject("ADODB.Connection")
		oConnection.Open("DSN=refarm" )
		Set oRS = oConnection.Execute("SELECT * FROM modules WHERE unit=" + unit)
		if oRS.EOF=false then
		While Not oRS.EOF
	%>
		<div class="row">
			<%
			if module<>Cstr(oRS("id")) then
			%>
			<a class="waves-effect waves-light btn-large orange lighten-2" style="width:100%" href="index.asp?module=<%=oRS("id")%>"><%=oRS("name")%></a>
			<%else%>
			<a class="waves-effect waves-light btn-large orange" style="width:100%"><%=oRS("name")%>
			<i class="mdi-action-delete modal-trigger left" href="#module_delete"></i>
			<i class="mdi-image-edit modal-trigger right" href="#module_edit"></i>
			</a>
			<%end if%>
		</div>
	<%
		oRS.MoveNext
		Wend
		end if
		if oRs.state = 1 then
			oRS.Close
		end if
		Set oRS = Nothing
		if oConnection.state = 1 then
			oConnection.Close
		end if
		Set oConnection = Nothing
	%>
	</div>
	<div class="col s1">
		&nbsp
	</div>
	<div class="col s3 center">
		<%
		Set oConnection = Server.CreateObject("ADODB.Connection")
		oConnection.Open("DSN=refarm" )
		Set oRS = oConnection.Execute("SELECT * FROM sensors WHERE modules=" + module)
		if oRS.EOF=false then
		While Not oRS.EOF
	%>
		<div class="row">
			<%
			Dim oRS2
			Set oConnection2 = Server.CreateObject("ADODB.Connection")
			oConnection2.Open("DSN=refarm" )
			dim a
			a = Cstr(oRS("sensor_type"))
			Set oRS2 = oConnection.Execute("SELECT * FROM sensor_type WHERE id="+a)
			if oRS.EOF=false then
			if senzori<>Cstr(oRS("id")) then
			%>
				<a class="waves-effect waves-light btn-large orange lighten-2" style="width:100%" href="index.asp?senzori=
				<%

				if oRS.EOF=false then
					response.write(oRS("id"))
				end if
				%>"><%
				if oRS2.EOF = false then
					response.write(oRS2("name"))
				end if
			%>

			</a>
			<%else%>
				<a class="waves-effect waves-light btn-large orange" style="width:100%">
					<%
					if oRS2.EOF = false then
						response.write(oRS2("name"))
					end if

					%>
					<i class="mdi-action-delete modal-trigger left" href="#senzori_delete"></i>
					<i class="mdi-image-edit modal-trigger right" href="#senzori_edit"></i>
				</a>
			<%
			end if
			end if
			if oRs2.state = 1 then
				oRS2.Close
			end if
			Set oRS2 = Nothing
			if oConnection2.state = 1 then
				oConnection2.Close
			end if
			Set oConnection2 = Nothing
			%>
		</div>
	<%
		oRS.MoveNext
		Wend
		end if
		if oRs.state = 1 then
			oRS.Close
		end if
		Set oRS = Nothing
		if oConnection.state = 1 then
			oConnection.Close
		end if
		Set oConnection = Nothing
	%>
	</div>




<div id="unitati_add" class="modal" style="width:40%">
	<center>
    <div class="row" align="center">
  	<form class="col s12" action="unitati_add.asp?add" method="POST">
    	<div class="row">
      		<div class="input-field col s4">
        		<i class="mdi-action-account-circle prefix"></i>
        		<input name="nume" id="nume" type="text" class="validate">
        		<label for="nume">Denumire</label>
      		</div>
      	</div>
      	<div class="row">
      		<div class="input-field col s6">
      			<i class="mdi-action-account-circle prefix"></i>
        		<textarea name="desc" id="desc" class="materialize-textarea"></textarea>
        		<label for="desc">Descriere</label>
      		</div>
    	</div>
    	<div class="row">
    		<button class="btn green darken-2" type="submit" name="action">Trimite
    		<i class="mdi-content-send right"></i>
  			</button>
    	</div>
  	</form>
	</div>
	</center>
	</div>

<div id="unitati_delete" class="modal" style="width:40%">
	<center>
    	<div class="row" align="center">
  			<h4>Stergi unitatea?</h4>
  			<BR>
  			<a href="unitati.asp?action=delete_unit&unit=<%=unit%>">DA</a>&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;
  			<a href="javascript:$('#unitati_delete').closeModal();">NU</a>
  		</div>
	</center>
	</div>

<div id="unitati_edit" class="modal" style="width:40%">
	<%
	Set oConnection = Server.CreateObject("ADODB.Connection")
	oConnection.Open("DSN=refarm" )
	Set oRS = oConnection.Execute("SELECT * FROM units WHERE id=" + unit)
	%>
	<center>
    <div class="row" align="center">
  	<form class="col s12" action="unitati_edit.asp?unit=<%=unit%>" method="POST">
    	<div class="row">
      		<div class="input-field col s4">
        		<i class="mdi-action-account-circle prefix"></i>
        		<input name="nume" id="nume" type="text" class="validate" value="<%=oRS("name")%>">
        		<label for="nume">Denumire</label>
      		</div>
      	</div>
      	<div class="row">
      		<div class="input-field col s6">
      			<i class="mdi-action-account-circle prefix"></i>
        		<textarea name="desc" id="desc" class="materialize-textarea"><%=oRS("desc")%></textarea>
        		<label for="desc">Descriere</label>
      		</div>
    	</div>
    	<div class="row">
    		<button class="btn green darken-2" type="submit" name="action">Modifica
    		<i class="mdi-content-send right"></i>
  			</button>
    	</div>
  	</form>
	</div>
	</center>
	<%
	if oRs.state = 1 then
			oRS.Close
	end if
	Set oRS = Nothing
	if oConnection.state = 1 then
			oConnection.Close
	end if
	Set oConnection = Nothing
	%>
 </div>

<div id="module_add" class="modal" style="width:40%">
	<center>
    	<div class="row" align="center">
  			<form class="col s12" action="module_add.asp?unit=<%=unit%>" method="POST">
    			<div class="row">
      				<div class="input-field col s4">
        				<i class="mdi-action-account-circle prefix"></i>
        				<input name="nume" id="nume" type="text" class="validate">
        				<label for="nume">Denumire</label>
      					</div>
      				</div>
    			<div class="row">
    				<button class="btn green darken-2" type="submit" name="action">Trimite
    				<i class="mdi-content-send right"></i>
  					</button>
    				</div>
  				</form>
			</div>
		</center>
	</div>

 <div id="module_delete" class="modal" style="width:40%">
	<center>
    <div class="row" align="center">
  		<h4>Stergi modulul?</h4>
  		<BR>
  		<a href="unitati.asp?action=delete_module&module=<%=module%>">DA</a>
  		&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;
  		<a href="javascript:$('#module_delete').closeModal();">NU</a>
  	</div>
	</center>
	</div>

<div id="module_edit" class="modal" style="width:40%">
	<%
	Set oConnection = Server.CreateObject("ADODB.Connection")
	oConnection.Open("DSN=refarm" )
	Set oRS = oConnection.Execute("SELECT * FROM modules WHERE id=" + module)
	%>
	<center>
    <div class="row" align="center">
  	<form class="col s12" action="module_edit.asp?module=<%=module%>" method="POST">
    	<div class="row">
      		<div class="input-field col s4">
        		<i class="mdi-action-account-circle prefix"></i>
        		<input name="nume" id="nume" type="text" class="validate" value="<%=oRS("name")%>">
        		<label for="nume">Denumire</label>
      		</div>
      	</div>
    	<div class="row">
    		<button class="btn green darken-2" type="submit" name="action">Modifica
    		<i class="mdi-content-send right"></i>
  			</button>
    	</div>
  	</form>
	</div>
	</center>
	<%
	if oRs.state = 1 then
			oRS.Close
			Set oRS = Nothing
	end if
	if oConnection.state = 1 then
			oConnection.Close
			Set oConnection = Nothing
	end if
	%>
 </div>

<div id="senzori_add" class="modal" style="width:40%">
	<center>
    <div class="row" align="center">
    	 <ul class="collapsible collapsible-accordion">
    	 	<%
		Set oConnection = Server.CreateObject("ADODB.Connection")
		oConnection.Open("DSN=refarm" )
		Set oRS = oConnection.Execute("SELECT * FROM sensor_type")
		While Not oRS.EOF
		%>
      		<li class="bold"><a class="collapsible-header" style="font-size:20"><%=oRS("name")%></a>
        		<div class="collapsible-body">
          		<ul>
          			<%
          			Set oConnection2 = Server.CreateObject("ADODB.Connection")
					oConnection2.Open("DSN=refarm" )
					Set oRS2 = oConnection.Execute("SELECT * FROM sensor_models WHERE sensor_type="+Cstr(oRs("id")))
					While Not oRS2.EOF
					%>
					<form action="sensors_add.asp">
					<li>
						<input type="text" id="module" name="module" value="<%=module%>" hidden>
						<input type="text" id="sensor_model" name="sensor_model" value="<%=oRS2("id")%>" hidden>
						<input type="text" id="sensor_type" name="sensor_type" value="<%=oRS("id")%>" hidden>

						<div class="input-field col s3">
        					<input id="name" name="name" type="text" class="validate" disabled>
        					<label for="name"><%=oRS2("name")%></label>
      					</div>
						<%if oRS2("P1") = "on" then%>
						<div class="input-field col s1">
        					<input id="P1" name="P1" type="text" class="validate">
        					<label for="P1">P1</label>
      					</div>
						<%end if%>
            			<%if oRS2("P2") = "on" then%>
						<div class="input-field col s1">
        					<input id="P2" name="P2" type="text" class="validate">
        					<label for="P2">P2</label>
      					</div>
						<%end if%>
						<%if oRS2("P3") = "on" then%>
						<div class="input-field col s1">
        					<input id="P3" name="P3" type="text" class="validate">
        					<label for="P3">P3</label>
      					</div>
						<%end if%>
						<%if oRS2("P4") = "on" then%>
						<div class="input-field col s1">
        					<input id="P4" name="P4" type="text" class="validate">
        					<label for="P4">P4</label>
      					</div>
						<%end if%>
						<div class="row">
    						<button class="btn green darken-2" type="submit" name="action" style="margin:20px 0px 0px 0px">Trimite
    						<i class="mdi-content-send right"></i>
  							</button>
  						</div>

            		</li>
            		</form>
            		<%
            		oRS2.MoveNext
            		Wend
					if oRs2.state = 1 then
					oRS2.Close
					Set oRS2 = Nothing
					end if
					if oConnection2.state = 1 then
					oConnection2.Close
					Set oConnection2 = Nothing
					end if
					%>
          		</ul>
        		</div>
      		</li>
      		<%
      	oRS.MoveNext
		Wend
		if oRs.state = 1 then
			oRS.Close
			Set oRS = Nothing
		end if
		if oConnection.state = 1 then
			oConnection.Close
			Set oConnection = Nothing
		end if
		%>
      	</ul>



	</div>
	</center>
 </div>

<div id="senzori_delete" class="modal" style="width:40%">
	<center>
    <div class="row" align="center">
  		<h4>Stergi modulul?</h4>
  		<BR>
  		<a href="unitati.asp?action=delete_senzori&senzori=<%=senzori%>">DA</a>
  		&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;
  		<a href="javascript:$('#senzori_delete').closeModal();">NU</a>
  	</div>
	</center>
	</div>

<div id="senzori_edit" class="modal" style="width:40%">
	<center>
    <div class="row" align="center">
    	 <ul class="collapsible collapsible-accordion">
    	 	<%
		Set oConnection = Server.CreateObject("ADODB.Connection")
		oConnection.Open("DSN=refarm" )
		Set oRS = oConnection.Execute("SELECT * FROM sensor_type")
		While Not oRS.EOF
		%>
      		<li class="bold"><a class="collapsible-header" style="font-size:20"><%=oRS("name")%></a>
        		<div class="collapsible-body">
          		<ul>
          			<%
          			Set oConnection2 = Server.CreateObject("ADODB.Connection")
					oConnection2.Open("DSN=refarm" )
					Set oRS2 = oConnection.Execute("SELECT * FROM sensor_models WHERE sensor_type="+Cstr(oRs("id")))
					While Not oRS2.EOF
					%>
					<form action="sensors_add.asp">
					<li>
						<input type="text" id="module" name="module" value="<%=module%>" hidden>
						<input type="text" id="sensor_model" name="sensor_model" value="<%=oRS2("id")%>" hidden>
						<input type="text" id="sensor_type" name="sensor_type" value="<%=oRS("id")%>" hidden>

						<div class="input-field col s3">
        					<input id="name" name="name" type="text" class="validate" disabled>
        					<label for="name"><%=oRS2("name")%></label>
      					</div>
						<%if oRS2("P1") = "on" then%>
						<div class="input-field col s1">
        					<input id="P1" name="P1" type="text" class="validate">
        					<label for="P1">P1</label>
      					</div>
						<%end if%>
            			<%if oRS2("P2") = "on" then%>
						<div class="input-field col s1">
        					<input id="P2" name="P2" type="text" class="validate">
        					<label for="P2">P2</label>
      					</div>
						<%end if%>
						<%if oRS2("P3") = "on" then%>
						<div class="input-field col s1">
        					<input id="P3" name="P3" type="text" class="validate">
        					<label for="P3">P3</label>
      					</div>
						<%end if%>
						<%if oRS2("P4") = "on" then%>
						<div class="input-field col s1">
        					<input id="P4" name="P4" type="text" class="validate">
        					<label for="P4">P4</label>
      					</div>
						<%end if%>
						<div class="row">
    						<button class="btn green darken-2" type="submit" name="action" style="margin:20px 0px 0px 0px">Trimite
    						<i class="mdi-content-send right"></i>
  							</button>
  						</div>

            		</li>
            		</form>
            		<%
            		oRS2.MoveNext
            		Wend
					if oRs2.state = 1 then
					oRS2.Close
					Set oRS2 = Nothing
					end if
					if oConnection2.state = 1 then
					oConnection2.Close
					Set oConnection2 = Nothing
					end if
					%>
          		</ul>
        		</div>
      		</li>
      		<%
      	oRS.MoveNext
		Wend
		if oRs.state = 1 then
			oRS.Close
			Set oRS = Nothing
		end if
		if oConnection.state = 1 then
			oConnection.Close
			Set oConnection = Nothing
		end if
		%>
      	</ul>



	</div>
	</center>
 </div>

<script type="text/javascript">
$(document).ready(function(){
    // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
    $('.modal-trigger').leanModal();
  });
</script>
