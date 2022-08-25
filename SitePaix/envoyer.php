<?php
 include_once('connexion.php');

 $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

 try{
    $nom = $_POST['nom'];
    $mail = $_POST['mail'];
    $messages = $_POST['messages'];
    $sql = "INSERT INTO `utilisateurs`(`nom`,`mail`,`messages`) VALUES ('$nom','$mail','$messages')";
    $dbh->exec($sql);

 }catch (PDOException $e){
    print "Erreur ! :" . $e->getMessage() ; "<br/>";
    }

    include_once('index.php');
?>