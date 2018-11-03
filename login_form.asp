<ul id="slide-out" class="side-nav full">
    <%if session("username")="" then%>
    <form  class="col s12" action="login.asp" method="POST">
      <BR>
      <div class="input-field  blue-text">
        <i class="mdi-action-face-unlock prefix"></i>
        <input id="username" name="username" type="text">
        <label for="username"><font size=2px>utilizator</font></label>
      </div>
      <div class="input-field  blue-text">
        <i class="mdi-communication-vpn-key prefix"></i>
        <input id="password" name="password" type="password">
        <label for="password">parola</label>
      </div>
      <button class="btn waves-effect waves-light right" type="submit" value="Submit">Intra<i class="mdi-content-send right"></i>
      </button>
    </form>
    <%else%>
        <div class="top-nav green darken-2" style="height:133px">
          <span class="white-text" >&nbsp;
            <a class="btn-large tooltipped white-text orange lighten-2" data-tooltip="Setari utilizator" style="margin-left:25px;margin-right:25px;margin-top:10px;">
              <i class="mdi-action-perm-identity left" ></i><%=Session("username")%></a>
          </span>
        </div>
    <%end if%> 


 
    <!--#include file="right.asp"-->



   <%if session("username")<>"" then%>
   <a href="login.asp?logoff" class="btn-large btn-floating tooltipped right orange lighten-2" style="margin-right:25px" data-tooltip="Deconectare"><i class="mdi-action-settings-power" style="margin:1px 0px 0px -14px"></i></a> 
   <%end if%>

  </ul> 

