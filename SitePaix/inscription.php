<?php

    include('fb.php');

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Site Paix</title>
    <link rel="stylesheet" href="inscription.css" />

</head>

<body>


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
                <li class="navbar__btn">
                    <a href="index.php" class="button" id="retour"><?php echo $lang['41']; ?></a>
                </li>
            </ul>
            <a href="inscription.php?lang=fr"><img src="logo/fr.png" alt="logo" width="25px" height="20px"> </a>
            <a href="inscription.php?lang=en"><img src="logo/en.jpg" alt="logo" width="25px" height="20px"></a>
        </div>
    </nav>
    <div class=" container">
        <div class="renseignement-box">
            <div class="left">

            </div>
            <div class="right">
                <form method="POST" action="envoyer.php">
                    <h2> Recommandation</h2>
                    nom:<input type="text" name="nom" class="field" placeholder="Votre Nom" required autofous> mail:
                    <input type="email" name="mail" class="field" placeholder="Votre adresse mail" required> message:
                    <textarea class="field" name="messages" placeholder="Votre Message"></textarea>
                    <button class="btn" type="submit">Envoyez</button>

                </form>
            </div>
        </div>
    </div>
    <script src="app.js "></script>
</body>

</html>