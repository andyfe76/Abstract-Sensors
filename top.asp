<nav class="top-nav green darken-2" style="height:133px;">
  <div class="container" style="padding-top:30px;">
    <div class="nav-wrapper"><a style="font-size:30"><%
    response.write(navtext)
    %></a>
    </div>
  </div>
</nav>

 <%if session("username")<>"" then%>
  <a href="#" data-activates="slide-out" class="button-collapse btn-floating btn-large right tooltipped orange lighten-2" data-tooltip="Setari" style="margin:-30px 25px 0px 0px"><i class="large mdi-navigation-menu"></i></a>
<%else%>
  <a href="#" data-activates="slide-out" class="button-collapse btn-floating btn-large right tooltipped orange lighten-2" data-tooltip="Setari" style="margin:-30px 25px 0px 0px"><i class="large mdi-navigation-menu"></i></a>
<%end if%>
