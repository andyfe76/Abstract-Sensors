<%
on error resume next 
%>

<div class="row">
	<div class="col s3 center orange lighten-2">
		<span class="flow-text white-text"><bold>Tipuri senzori</bold><a style="color:white" href="#tipuri_add" class="modal-trigger"><i class="mdi-content-add right"></i></a></span> 
	</div>
	<div class="col s1">
		&nbsp
	</div>
	<div class="col s3 red center orange lighten-2">
		<span class="flow-text white-text"><bold>Modele senzori</bold><a style="color:white" href="#modele_add" class="modal-trigger"><i class="mdi-content-add right"></i></a></span>
	</div>
</div>

<%
tipuri=request.querystring("tipuri")
if tipuri<>"" then
  session("tipuri")=tipuri
else
  tipuri=session("tipuri")
end if
if tipuri = "" then tipuri="0"

modele=request.querystring("modele")
if modele<>"" then
  session("modele")=modele
else
  modele=session("modele")
end if
if modele="" then modele="0"

%>

	<div class="col s3 center">
	<%
		
		Set oConnection = Server.CreateObject("ADODB.Connection") 
		oConnection.Open("DSN=refarm" ) 
		Set oRS = oConnection.Execute("SELECT * FROM sensor_type")
		if oRS.EOF=false then
		While Not oRS.EOF
	%>	
		<div class="row">
			<%
			if tipuri<>Cstr(oRS("id")) then
			%>
			<a class="waves-effect waves-light btn-large orange lighten-2" style="width:100%" href="index.asp?tipuri=<%=oRS("id")%>"><%=oRS("name")%></a>
			<%else%>
			<a class="waves-effect waves-light btn-large orange" style="width:100%"><%=oRS("name")%>
				<i class="mdi-action-delete modal-trigger left" href="#tipuri_delete"></i>
				<i class="mdi-image-edit modal-trigger right" href="#tipuri_edit"></i>
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
		Set oRS = oConnection.Execute("SELECT * FROM sensor_models WHERE sensor_type="+tipuri)
		if oRS.EOF = false then
		While Not oRS.EOF
	%>	
		<div class="row">
			<%
			if modele<>Cstr(oRS("id")) then
			%>
			<a class="waves-effect waves-light btn-large orange lighten-2" style="width:100%" href="index.asp?modele=<%=oRS("id")%>"><%=oRS("name")%></a>
			<%else%>
			<a class="waves-effect waves-light btn-large orange" style="width:100%"><%=oRS("name")%>
				<i class="mdi-action-delete modal-trigger left" href="#modele_delete"></i>
				<i class="mdi-image-edit modal-trigger right" href="#modele_edit"></i>
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




<div id="modele_add" class="modal" style="width:40%">
	<center>
    <div class="row" align="center">
  	<form class="col s12" action="sensors_models_add.asp?tipuri=<%=tipuri%>" method="POST">
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
			<div class="input-field col s6">
        		<i class="mdi-action-account-circle prefix"></i>
        		<input name="txt" id="txt" type="text" class="validate" disabled>
        		<label for="txt">Selecteaza PIN folositi de senzor</label>
      		</div>
      	</div>
    	<div class="row" style="margin:0px 0px 0px 60px">
    		<p>
    			<input type="checkbox" name="pin1" id="pin1" />
    			<label for="pin1">PIN 1</label>
    		</p>
    		<p>
    			<input type="checkbox" name="pin2" id="pin2" />
    			<label for="pin2">PIN 2</label>
    		</p>
    		<p>	
    			<input type="checkbox" name="pin3" id="pin3" />
    			<label for="pin3">PIN 3</label>
    		</p>
    		<p>
    			<input type="checkbox" name="pin4" id="pin4" />
    			<label for="pin4">PIN 4</label>
  			</p>
    	</div>
    	<BR>
    	<div class="row">
    		<button class="btn green darken-2" type="submit" name="action">Trimite
    		<i class="mdi-content-send right"></i>
  			</button>
    	</div>
  	</form>
	</div>
	</center>
  	</div>

<div id="modele_delete" class="modal" style="width:40%">
	<center>
    	<div class="row" align="center">
  			<h4>Stergi modelul?</h4>
  			<BR>
  			<a href="sensors_delete.asp?modele=<%=modele%>">DA</a>&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;
  			<a href="javascript:$('#modele_delete').closeModal();">NU</a>
  		</div>
	</center>
  	</div>


 <div id="modele_edit" class="modal" style="width:40%">
 	<%
	Set oConnection = Server.CreateObject("ADODB.Connection") 
	oConnection.Open("DSN=refarm" ) 
	Set oRS = oConnection.Execute("SELECT * FROM sensor_models WHERE id=" + modele)
	%>
	<center>
    <div class="row" align="center">
  	<form class="col s12" action="sensors_edit.asp?modele=<%=modele%>" method="POST">
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
			<div class="input-field col s6">
        		<i class="mdi-action-account-circle prefix"></i>
        		<input name="txt" id="txt" type="text" class="validate" disabled>
        		<label for="txt">Selecteaza PIN folositi de senzor</label>
      		</div>
      	</div>
      	<div class="row" style="margin:0px 0px 0px 60px">
    		<p>
    			<input type="checkbox" name="p1" id="p1"<%if oRS("P1")="on" then%> checked="checked"<%end if%> />
    			<label for="p1">PIN 1</label>
    		</p>
    		<p>
    			<input type="checkbox" name="p2" id="p2"<%if oRS("P2")="on" then%> checked="checked"<%end if%> />
    			<label for="p2">PIN 2</label>
    		</p>
    		<p>
    			<input type="checkbox" name="p3" id="p3"<%if oRS("P3")="on" then%> checked="checked"<%end if%> />
    			<label for="p3">PIN 3</label>
    		</p>
    		<p>
    			<input type="checkbox" name="p4" id="p4"<%if oRS("P4")="on" then%> checked="checked"<%end if%> />
    			<label for="p4">PIN 4</label>
    		</p>
   		</div>
   		<BR>
    	<div class="row">
    		<button class="btn green darken-2" type="submit" name="action">Trimite
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



<div id="tipuri_add" class="modal" style="width:40%">
	<center>
    <div class="row" align="center">
  	<form class="col s12" action="sensor_type_add.asp" method="POST">
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

<div id="tipuri_delete" class="modal" style="width:40%">
	<center>
    	<div class="row" align="center">
  			<h4>Stergi unitatea?</h4>
  			<BR>
  			<a href="sensor_type_delete.asp?type=<%=tipuri%>">DA</a>&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;
  			<a href="javascript:$('#tipuri_delete').closeModal();">NU</a>
  		</div>
	</center>
  	</div>

<div id="tipuri_edit" class="modal" style="width:40%">
	<%
	Set oConnection = Server.CreateObject("ADODB.Connection") 
	oConnection.Open("DSN=refarm" ) 
	Set oRS = oConnection.Execute("SELECT * FROM sensor_type WHERE id=" + tipuri)
	%>
	<center>
    <div class="row" align="center">
  	<form class="col s12" action="sensor_type_edit.asp?type=<%=tipuri%>" method="POST">
    	<div class="row">
      		<div class="input-field col s4">
        		<i class="mdi-action-account-circle prefix"></i>
        		<input name="nume" id="nume" type="text" class="validate" value="<%=oRS("name")%>">
        		<label for="nume">Denumire</label>
      		</div>
      	</div>
    	<div class="row">
    		<button class="btn green darken-2" type="submit" name="action">Modufica
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


<script type="text/javascript">
$(document).ready(function(){
    // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
    $('.modal-trigger').leanModal();
  });
</script>