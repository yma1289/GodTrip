<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  </div>
</div>

<footer class="w3-container w3-center w3-opacity w3-margin-bottom">
<div class="w3-middle w3-padding-16">
	<p>Copyright &copy; 2023 God trip</p>
  <i class="fa fa-facebook-official w3-hover-opacity"></i>
  <i class="fa fa-instagram w3-hover-opacity"></i>
  <i class="fa fa-snapchat w3-hover-opacity"></i>
  <i class="fa fa-pinterest-p w3-hover-opacity"></i>
  <i class="fa fa-twitter w3-hover-opacity"></i>
  <i class="fa fa-linkedin w3-hover-opacity"></i>
</div>
</footer>

<script>
//Tabs
function openLink(evt, linkName) {
var i, x, tablinks;
x = document.getElementsByClassName("myLink");
for (i = 0; i < x.length; i++) {
  x[i].style.display = "none";
}
tablinks = document.getElementsByClassName("tablink");
for (i = 0; i < x.length; i++) {
  tablinks[i].className = tablinks[i].className.replace(" w3-red", "");
}
document.getElementById(linkName).style.display = "block";
evt.currentTarget.className += " w3-red";
}

</script>

</body>
</html>

