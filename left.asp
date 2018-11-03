<ul id="nav-mobile" class="side-nav fixed left-aligned">
  <div class="logo">
    <a id="logo-container" class="brand-logo" style="height:100px;">
    </a>
  </div>
  
  <div class="divider"></div>

  <li class="bold <%if session("nav")="about" then%> active orange lighten-2<%end if%>">
    <a href="index.asp?nav=about" class="white-text" style="font-size:20">
      About
    </a>
  </li>

  <li class="no-padding">
    <ul class="collapsible collapsible-accordion">
      <li class="bold"><a class="collapsible-header<%if nav="css1" or nav="css2" then%> active<%end if%>" style="font-size:20">Unitati</a>
        <div class="collapsible-body">
          <ul>
            <li<%if nav="css1" then%> class="active"<%end if%>><a href="index.asp?nav=css1">Color1</a></li>
            <li<%if nav="css2" then%> class="active"<%end if%>><a href="index.asp?nav=css2">Color2</a></li>
          </ul>
        </div>
      </li>


      <li class="bold"><a class="collapsible-header<%if nav="css3" or nav="css4" then%> active<%end if%>">CSS1</a>
        <div class="collapsible-body">
          <ul>
            <li<%if nav="css3" then%> class="active"<%end if%>><a href="index.asp?nav=css3">Color1</a></li>
            <li<%if nav="css4" then%> class="active"<%end if%>><a href="index.asp?nav=css4">Color2</a></li>
          </ul>
          </div>
      </li>
    </ul>
  </li>
</ul>