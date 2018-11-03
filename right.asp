<ul class="collapsible collapsible-accordion">
      <li class="bold"><a class="collapsible-header<%if rightnav="unitati" then%> active<%end if%>" style="font-size:20">Setari</a>
        <div class="collapsible-body">
          <ul>
            <li<%if rightnav="unitati" then%> class="active"<%end if%>><a href="index.asp?right=unitati">Unitati</a></li>
            <li<%if rightnav="senzori" then%> class="active"<%end if%>><a href="index.asp?right=senzori">Senzori</a></li>
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

    <script type="text/javascript">
$('.collapsible').collapsible();
    </script>