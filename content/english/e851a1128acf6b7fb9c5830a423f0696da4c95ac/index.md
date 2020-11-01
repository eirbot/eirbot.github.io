---
title: "Espace membre"
description : "Espace utile pour les membres de l'association"
draft : false
image : "images/eirbot.webp"
bg_image : "images/banner.webp"

---

<html>
<!-- Début du compteur -->
<div id="EklaCompteur" style="border:0px solid #663300;
width:90%;
text-align:center;
margin: 0px auto;
padding:4px;
-moz-border-radius:10px;
-webkit-border-radius:10px;
border-radius:10px;">&nbsp;</div>
<script type="text/JavaScript">// <![CDATA[
//***********************************************************************************************
//  Compte à rebours dans Eklablog
//  Version 1.1
//  Auteur : -Thierry-
//  Blog : http://gerer-mon-blog.eklablog.fr/
//***********************************************************************************************
var idtimeEklaCompteur=0;
function EklaDisplayCompteurEklaCompteur() {
	// délais d'affichage
	var delais = 1;
	// Element contenant l'affichage
	var EklaCompteurAffiche=document.getElementById("EklaCompteur");
	// HTML d'affichage
	var html = "<span style=\"font-size: 20pt ; color: #41484c;\"><strong>Coupe de France de robotique dans :&nbsp;</strong></span><br /> <span style=\"color: #000000;\"><strong><span style=\"font-size: 24pt;\"><span style=\"color: #ffd700;\">[j]</span> <span style=\"color: #41484c;\">jours</span>&nbsp;</span></strong><span style=\"font-size: 24pt;\"><strong><span style=\"color: #ffd700;\">[h]</span> <span style=\"color: #41484c;\">heures</span> <span style=\"color: #ffd700;\">[m]</span> <span style=\"color: #41484c;\">minutes</span> <span style=\"color: #ffd700;\">[s]</span> <span style=\"color: #41484c;\">secondes</span></strong></span></span>" ;
	// HTML d'affichage si écoulé
	var htmlafter = "<strong>COUPE EN COURS&nbsp;</strong>" ;
	// Date / heure courante
	var date1 = new Date();
	// Date / heure de fin
	// Attention, le mois commence à 0 pour janvier
	var date2 = new Date (2020, 9, 28, 10, 0, 18);
	// Nombre de secondes entre les dates
	var nbsec = (date2 - date1) / 1000;
	// Nombre de secondes dans une journée
	var nbsecj = 24 * 3600;
	// Pour arrêt compteur si temps écoulé et pas de texte prévu
	var stopcpt=false;
	// Si négatif => temps écoulé
	if (nbsec <= 0) {
		nbsec=-nbsec;
		if (htmlafter!="") 
			{ html=htmlafter; }
		else
			{stopcpt=true;}
	}
	// Nombre de jours restants
	var j = Math.floor (nbsec / nbsecj);
	// Nombre d'heures restantes
	var h = Math.floor ((nbsec - (j * nbsecj)) / 3600);
	// Nombre de minutes restantes
	var m = Math.floor ((nbsec - ((j * nbsecj + h * 3600))) / 60);
	// Nombre de secondes restantes
	var s = Math.floor (nbsec - ((j * nbsecj + h * 3600 + m * 60)));
	// Si pas de texte après temps écoulé => on met tout à zéro
	if (stopcpt==true) {j=0;h=0;m=0;s=0}
	// Modification du HTML à afficher
	var html = html.replace("[j]",j);
	var html = html.replace("[h]",h);
	var html = html.replace("[m]",m);
	var html = html.replace("[s]",s);
	// Affichage
	if (EklaCompteurAffiche!=null) {EklaCompteurAffiche.innerHTML = html;}
	// Relance du compteur dans x millisecondes
	if (stopcpt==false) {idtimeEklaCompteur=setTimeout ("EklaDisplayCompteurEklaCompteur();", 1*1000);}
}
EklaDisplayCompteurEklaCompteur();
// ]]></script>
<!-- Fin du compteur -->
</html>

## <i class="fas fa-users"></i> Rapports de réunion

<div id="conteneur">
<div class="flip-card">
  <div class="flip-card-inner">
    <div class="flip-card-front">
    <p> Réunion du 30/07 </p>
    <img src="/images/loutre/loutre1.jpg" alt="loutre1" style="width:100px;height:100px;  clip-path:ellipse(50% 50%);">
    </div>
    <div class="flip-card-back">
    <p> </p>
    <p> </p>
<a href="/reunion/rapport1">Rapport</a>
    </div>
  </div>
</div>

<div class="flip-card">
  <div class="flip-card-inner">
    <div class="flip-card-front">
    <p> Réunion du 10/07 </p>
    <img src="/images/loutre/loutre2.jpg" alt="loutre2" style="width:100px;height:100px;  clip-path:ellipse(50% 50%);">
    </div>
    <div class="flip-card-back">
       <p> </p>
    <p> </p>
   <a href="/reunion/rapport2">Rapport</a>
    </div>
  </div>
</div>

<div class="flip-card">
  <div class="flip-card-inner">
    <div class="flip-card-front">
    <p> Réunion du 17/07 </p>
    <img src="/images/loutre/loutre3.jpeg" alt="loutre3" style="width:100px;height:100px;  clip-path:ellipse(50% 50%);">
    </div>
    <div class="flip-card-back">
    <p> </p>
    <p> </p>
      <a href="/reunion/rapport3">Rapport</a>
    </div>
  </div>
</div>
</div>

<div id="conteneur">
<div class="flip-card">
  <div class="flip-card-inner">
    <div class="flip-card-front">
    <p> Réunion du  01/10 </p>
    <img src="/images/loutre/loutre4.jpg" alt="loutre4"
    style="width:100px;height:100px;  clip-path:ellipse(50% 50%);">
    </div>
    <div class="flip-card-back">
    <p> </p>
    <p> </p>
<a href="/reunion/rapport4.pdf">Rapport</a>
    </div>
  </div>
</div>

<div class="flip-card">
  <div class="flip-card-inner">
    <div class="flip-card-front">
    <p> Réunion du 08/10 </p>
    <img src="/images/loutre/loutre5.jpg" alt="loutre5"
  style="width:100px;height:100px;clip-path:ellipse(50% 50%);">
    </div>
    <div class="flip-card-back">
       <p> </p>
    <p> </p>
   <a href="/reunion/rapport5">Rapport</a>
    </div>
  </div>
</div>

<div class="flip-card">
  <div class="flip-card-inner">
    <div class="flip-card-front">
    <p> Réunion du 15/10 </p>
    <img src="/images/loutre/loutre6.jpeg" alt="loutre6" style="width:100px;height:100px;  clip-path:ellipse(50% 50%);">
    </div>
    <div class="flip-card-back">
    <p> </p>
    <p> </p>
      <a href="/reunion/rapport6">Rapport</a>
    </div>
  </div>
</div>
</div>

<center>
<iframe src="https://calendar.google.com/calendar/embed?height=600&amp;wkst=1&amp;bgcolor=%23A79B8E&amp;ctz=Europe%2FParis&amp;src=NnIzdmVxdmhlc24wcDJmNWljcmxjbjBtaDhAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ&amp;color=%23E4C441&amp;showTitle=0&amp;showPrint=0&amp;showCalendars=0&amp;showTz=0" style="border-width:0" width="100%" height="600" frameborder="0" scrolling="no"></iframe>
</center>

## <i class="fas fa-boxes"></i> Inventaire
  
  
<div class="card-container">
<div class="card-deck flex-row flex-nowrap">
  <div class="card">
    <a href="/membre/inventaire"><img src="/images/inventaire.png"
                                        height="200 px" alt="Card image cap"></a>
    <a href="/membre/inventaire">
      <div class="card-body">
        <a href="inventaire"><h3 class="card-subalign-middle">Inventaire</h3></a>
      </div><!-- END CARD-BODY -->
    </a>
  </div><!-- END CARD -->
</div><!-- END CARD DECK -->

<div class="card-deck flex-row flex-nowrap">
  <div class="card">
    <a href="/membre/base"><img src="/images/inventaire2.png"
                                        height="200 px" alt="Card image cap"></a>
    <a href="/md/base">
      <div class="card-body">
        <a href="/md/base"><h3 class="card-sub align-middle">Base de données</h3></a>
      </div><!-- END CARD-BODY -->
    </a>
  </div><!-- END CARD -->
</div><!-- END CARD DECK -->
</div>

## <i class="far fa-lightbulb"></i> Chloé la boite à idées

Les <A Href="javascript:reponse()">réponses</A> à consulter pendant les réunions.

<center> <iframe
src="https://docs.google.com/forms/d/e/1FAIpQLSeTNMlyH-gTjlTePW8t9Mayarbn8PmStFqXd5Kq0pugYzbmRw/viewform?embedded=true"
width="640" height="520" frameborder="0" marginheight="0"
marginwidth="0">Chargement...</iframe> </center> 

## <i class="fas fa-hands-helping"></i> Registre des emprunts
Pour ajouter dire qu'un élement est rendu : [google
sheet](https://drive.google.com/open?id=1DmwQWuhUo6Ps9GUgL_ImfnbarlANhgQ7Pi4DN66-tjg)
<center>
<iframe
src="https://docs.google.com/forms/d/e/1FAIpQLSdaupkNOwUPXJMWVsYq3wbut_ox7AXW1EdRqMd-YuASE2N61g/viewform?embedded=true"
width="640" height="700" frameborder="0" marginheight="0"
marginwidth="0">Chargement…</iframe>
</center>

<!-- Archives des emprunts -->
<!-- <center> -->
<!-- <iframe -->
<!-- src="https://docs.google.com/spreadsheets/d/e/2PACX-1vTM_6L2EcLbey0WBFR3oABlXI79PxAj6-eIvcLdZnUeB0a_gDKs0lcZSURbDURh-n1_A4_MQC8p2uz0/pubhtml?gid=1368346675&amp;single=true&amp;widget=true&amp;headers=false" -->
<!-- width="770" height="500" frameborder="0" marginheight="0" margiwidth="0">Chargement...</iframe> -->
<!-- </center> -->

<!------------------->
<!-- SCRIPT DIVERS -->
<!------------------->

<script>  <!-- Pour gérer l'accès aux réponses --> 
function reponse()
{
  var date=new Date()
  var day=date.getDay()
  var hour=date.getHours()
  if(day==4){ <!-- 4 16 18 -->
    if(hour>=16){
      if(hour<=18){        window.open('https://docs.google.com/forms/d/1qxJ9jkGC-pUyV14EXjzay8483VbvkJmBMysq61KpiOE/edit#responses', '_blank');
    return true
  }}}
  alert("Nous ne sommes pas en réunion !")
}
</script>

<style>
.card-test {
    float:left;
    position: relative;
    margin-left:20px;
    width: 200px;
    background: #F5fafa;
}
.card-test .image {
    width: 100%;
    height: 100%;
    overflow: hidden;
}
.card-test .image img {
    width: 100%;
    transition: .5s;
}
.card-test:hover .image img {
    opacity: .5;
    transform: translateX(30%);/*100%*/
}
.card-test .details {
    position: relative;
    border-radius:10px 10px;
    background: #41484c;
    transition: .5s;
    transform-origin: left;
    transform: perspective(2000px) rotateY(-90deg);
}
.card-test:hover .details {
    transform: perspective(2000px) rotateY(0deg);
}
.card-test .details .center {
    padding: 20px;
    border-radius:10px 10px;
    text-align: center;
    background: #41484c;
    position: absolute;
    top: -100px ;
    transform: translateY(-50%);
}
.card-test .details .center h1 {
    margin: 0;
    padding: 0;
    color: #e5e539;
    text-transform: uppercase;
}
.card-test .details .center h1 span {
    font-size: 14px;
    color: #262626;
}
.card-test .details .center p {
    margin: 10px 0;
    padding: 0;
    color: white;
}
/* The flip card container - set the width and height to whatever you want. We have added the border property to demonstrate that the flip itself goes out of the box on hover (remove perspective if you don't want the 3D effect */
.flip-card {
  background-color: transparent;
  width: 300px;
  height: 200px;
  position: relative;
  float: left;
  perspective: 1000px; /* Remove this if you don't want the 3D effect */
}

/* This container is needed to position the front and back side */
.flip-card-inner {
  position: relative;
  width: 100%;
  height: 100%;
  text-align: center;
  transition: transform 0.8s;
  transform-style: preserve-3d;
}

/* Do an horizontal flip when you move the mouse over the flip box container */
.flip-card:hover .flip-card-inner {
  transform: rotateY(180deg);
}

/* Position the front and back side */
.flip-card-front, .flip-card-back {
  position: absolute;
  width: 100%;
  height: 100%;
  -webkit-backface-visibility: hidden; /* Safari */
  backface-visibility: hidden;
}

/* Style the front side (fallback if image is missing) */
.flip-card-front {
  background-color: #F5FAFA;
  color: black;
}

/* Style the back side */
.flip-card-back {
  background-color: #222729;
  color: #FFD700;
  transform: rotateY(180deg);
  border-radius:10px 10px ;
}

.card-container{
  width:100%;
  float: left ;
}

.card-body{
  width:80%;
  padding-left:10px;
  margin-top:10px;
  transition:.3s;
  -webkit-transition:.3s;
}

.card-deck{
  float:left;
margin-bottom:3.2rem;
margin-left:0.5rem;
    overflow-x: auto;
    -webkit-overflow-scrolling: touch;
}

.front-deck{
  padding-top:12rem;
}

.card{
  margin-right:16px;
  border:none;
  flex: 0 0 auto;
}

.card .card-body:first-of-type{
  border-top:0px;

}
a { 
color: #e5e539;}

</style>
