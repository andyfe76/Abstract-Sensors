 <html>
    <head>
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="css/ghpages-materialize.css"  media="screen,projection"/>
    </head>

    <body>
      <!--Import jQuery before materialize.js-->
      <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>


<%

nav=request.querystring("nav")
if nav<>"" then
  session("nav")=nav
else
  nav=session("nav")
end if

rightnav=request.querystring("right")
if rightnav<>"" then
  session("right")=rightnav
  if rightnav="unitati" then navtext="Configurare unitati"
    if rightnav="senzori" then navtext="Configurare senzori"
else
  rightnav=session("right")
end if

%>


<header>
<!--#include file="top.asp"-->
<!--#include file="left.asp"-->
</header>


<main>
<div style="margin-left:30px">
  <div class="row">
    <div class="col s12 m9 l10">
      <div>
        <div id="grid-container" class="section scrollspy">
          <%if rightnav="unitati" then%>
          <!--#include file="unitati.asp"-->
          <%end if%>
          <%if rightnav="senzori" then%>
          <!--#include file="senzori.asp"-->
          <%end if%>
        <!--#include file="login_form.asp"-->

        </div>
      </div>
    </div>
  </div>
</div>
</main>



   <script type="text/javascript">
      $(".button-collapse").sideNav({edge: 'right'});

      $(document).ready(function(){
        $('.tooltipped').tooltip({"delay": 50});
      });
      </script>

    </body>
  </html>
