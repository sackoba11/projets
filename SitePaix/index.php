<?php

    include('fb.php');

?>

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Site paix</title>
    <link rel="stylesheet" href="styles.css" />

</head>

<body>

    <!-- Navbar Section -->
    <nav class="navbar">
        <div class="navbar__container">

            <a href="#home" id="navbar__logo"><img src="images/Colombe-de-la-paix-image.jpg" alt="logo" width="50px" height="50px"></a>
            <a href="#home" id="text__logo"> <?php echo $lang['1']; ?> <br> <?php echo $lang['2']; ?> </a>
            <div class="navbar__toggle" id="mobile-menu">
                <span class="bar"></span>
                <span class="bar"></span>
                <span class="bar"></span>
            </div>
            <ul class="navbar__menu">
                <li class="navbar__item">
                    <a href="#home" class="navbar__links" id="home__page"><?php echo $lang['3']; ?> </a>
                </li>
                <li class="navbar__item">
                    <a href="#about" class="navbar__links" id="about__page"><?php echo $lang['4']; ?> </a>
                </li>
                <li class="navbar__item">
                    <a href="#services" class="navbar__links" id="Services__page"><?php echo $lang['5']; ?> </a>
                </li>
                <li class="navbar__btn">
                    <a href="inscription.php" class="button" id="signup"><?php echo $lang['6']; ?> </a>
                </li>
            </ul>
            <a href="index.php?lang=fr"><img src="logo/fr.png" alt="logo" width="25px" height="20px"> </a>
            <a href="index.php?lang=en"><img src="logo/en.jpg" alt="logo" width="25px" height="20px"></a>
        </div>
        
    </nav>

    <!--hero Section -->
    <div class="hero" id="home">
        <div class="hero__container">
            <h1 class="hero__heading"> <span><?php echo $lang['7']; ?></span></h1>
            <img src="images/accueil1.jpg" alt="images" width="500" height="450"><br>
            <p class="hero__description">
                <h1> <?php echo $lang['8']; ?></h1><br>
                <p><?php echo $lang['9']; ?><b><?php echo $lang['10']; ?></b> <?php echo $lang['11']; ?><b> Guémon</b><?php echo $lang['13']; ?>
                </p><br>
                <p><b><?php echo $lang['10']; ?></b> <?php echo $lang['15']; ?>.</p><br>
                <p><?php echo $lang['16']; ?></p><br>
                <p><?php echo $lang['17']; ?></p><br>

                <button class="main__btn"><a href="https://news.abidjan.net/articles/708471/cote-divoire-le-guemon-abritera-la-journee-nationale-de-la-paix-2022">Source</a></button>
        </div>
    </div>

    <!--About Section -->
    <div class="main" id="about">
        <div class="maint__container">
            <div class="main__img--container">
                <div class="main__img--card"> <img src="images/photo4.jpg" alt="image" width="500px" height="450px"></div>
            </div>
            <div class="main__content">
                <h1><?php echo $lang['18']; ?></h1>
                <p><?php echo $lang['19']; ?></p><br>
                <p><?php echo $lang['20']; ?></p><br>
                <p><?php echo $lang['21']; ?></p><br>
                <button class="main__btn"><a href="https://publicholidays.africa/ivory-coast/fr/national-peace-day/">Source</a></button>
            </div>
        </div>
    </div>

    <!--  Section Services -->
    <div class="services" id="services">
        <h1><?php echo $lang['5']; ?></h1>
        <div class="services__wrapper">
            <div class="services__card">
                <img src="images/2021.jpg" alt="image"><br>
                <h2><?php echo $lang['22']; ?><br> <?php echo $lang['23']; ?></h2>
                <p><?php echo $lang['24']; ?></p><br>
                <div class="services__btn"><a href="https://www.fratmat.info/article/216204/societe/25e-journee-nationale-de-la-paix-la-cote-divoire-se-rememore-sa-seconde-religion-dans-la-piete "><button><?php echo $lang['25']; ?></button></a></div>
            </div>
            <div class="services__card">
                <img src="images/photo2.jpg " alt="image"><br>
                <h2><?php echo $lang['26']; ?><br>
                <?php echo $lang['27']; ?></h2>
                <p><?php echo $lang['28']; ?><b> Mariatou Koné</b>.</p>
                <div class="services__btn"><a href="https://www.gouv.ci/_actualite-article.php?recordID=10604"><button><?php echo $lang['25']; ?></button></a></div>
            </div>
            <div class="services__card">
                <img src="images/photo3.jpeg" alt="image"><br>
                <h2><?php echo $lang['30']; ?><br>
                <?php echo $lang['31']; ?></h2>
                <p><?php echo $lang['32']; ?></p>
                    <div class="services__btn"><a href="https://www.gouv.ci/_grandossier.php?recordID=118"><button><?php echo $lang['25']; ?></button></a></div>
            </div>

        </div>
    </div>

    <!-- Features Section -->
    <div class="connexion" id="connecte">
        <div class="texte">
        <p>
            <?php
                 include_once('connexion.php');

                 $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

                 try{
    
                    $sql = "SELECT messages FROM `utilisateurs`";
                    $sth = $dbh->query($sql);
                    $result = $sth->fetchAll();
                    $nombre = count($result);
                    echo'<label for="nom"> Commentaires :'; echo'</label>';echo  $nombre;
                }catch (PDOException $e){
                    print "Erreur ! :" . $e->getMessage() ; "<br/>";
                }
 
           
            ?>

        </p>
            
            <h1><?php echo $lang['33']; ?></h1>
            <div class="lien "><button class="main__btn"><a href="inscription.html"> <?php echo $lang['34']; ?> </a></button></div>

        </div>
        <div class=commit>
            <?php
            //Inclusion du fichier contenant la connexion à la base
            try{
                  //La requête SQL

                    $sql = "SELECT nom,messages FROM utilisateurs ORDER BY id DESC Limit 4";
                    //Recherche des données
                    $sth = $dbh->query($sql);
                    // On voudrait les résultats sous la forme d’un tableau associatif
                    $result = $sth->fetchAll(PDO::FETCH_ASSOC);
                    //Affichage des résultats
   
                    foreach ($result as $row){
                        echo'<label for="nom"> <Strong> NOM : </Strong>' ;echo $row['nom'] ; echo'</label><br> ';
                        echo'<label> <Strong>Commentaires :</Strong> ';  echo $row['messages']; echo'</label> <br><hr>';
                    }
            }catch (PDOException $e){
                print "Erreur ! :" . $e->getMessage() ; "<br/>";
            }
            ?>
        </div>

    </div>

    <!---Footer Section-->
    <div class="footer__container ">
        <div class="footer__links ">
            <div class="footer__link--wrapper ">
                <div class="footer__link--items ">
                    <h2><?php echo $lang['35']; ?></h2>
                    <a href=" /">E-mail</a>
                    <a> 0555324247-0779887664</a>
                </div>
            </div>
            <div class="footer__link--wrapper ">
                <div class="footer__link--items ">
                    <h2><?php echo $lang['36']; ?></h2>
                    <a href="https://news.abidjan.net/photos/779819-politique-rencontre-entre-les-presidents-ouattara-bedie-et-gbagbo "> Sur la paix</a>
                    <a href="https://www.youtube.com/watch?v=wHIz0t3nZUE ">Videos</a>
                </div>
                <div class="footer__link--items ">
                    <h2><?php echo $lang['38']; ?></h2>
                    <a href="https://univ-cocody.ci/"><?php echo $lang['39']; ?></a>
                    <a href="https://www.enseignement.gouv.ci/">MESRS</a>
                </div>
            </div>

        </div>
        <section class="social__media ">
            <div class="social__media--wrap ">
                <P class="website__rights "><?php echo $lang['40']; ?></P>
                <div class="social__icons ">
                    <a href="http://www.facebook.com " data-toggle="tooltip " data-placement="top " title="Facebook "><img src="logo/Facebook.png " alt="image " width="30 " height="30 "></a>
                    <a href="http://www.instagram.com " data-toggle="tooltip " data-placement="top " title="Instagram "><img src="logo/Instagram.png " alt="image " width="25 " height="25 "></a>
                    <a href="http://www.linkedin.com " data-toggle="tooltip " data-placement="top " title="LinkedIn "><img src="logo/Linked.png " alt="image " width="25 " height="25 "></a>
                    <a href="http://www.twitter.com " data-toggle="tooltip " data-placement="top " title="Twitter "><img src="logo/Twitter.png " alt="image " width="25 " height="25 "></a>
                </div>
            </div>
        </section>
    </div>

    <script src="app.js "></script>
</body>

</html>