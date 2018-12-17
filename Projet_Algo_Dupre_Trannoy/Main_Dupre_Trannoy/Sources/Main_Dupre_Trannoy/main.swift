import Foundation
import piece
import partie
import position

//creer une partie avec tous les pions en place sur le plateau
//on imagine une matrice 4x3 on place une piece kistsune a la position 4x1, koropokkuru en 4x2, tanuki en 4x3 et kodama en 3x2 pour le joueur 1
//retourner le plateau et faire de meme pour led pieces du joueur 2
//la reserve est vide pour les deux joueurs
//le joueur 1 commence la partie au tour d'apres le joueur change
//chaque case est nomee avec un charactere alphabetique different
//nous partons de la case 4x3 que l'on nomme 'a' de gauche a droite et de bas en haut jusqu'a la case 1x3 que l'on nomme 'l'
creerPartie()
var partie = Partie()
var kitsune1 : Piece = Piece(1, "kitsune", "a")
var koropokkuru1 : Piece = Piece(1, "koropokkuru", "b")
var tanuki1 : Piece = Piece(1, "tanuki", "c")
var kodama1 : Piece = Piece(1, "kodama", "e")
var kodama2 : Piece = Piece(2, "kodama", "h")
var tanuki2 : Piece = Piece(2, "tanuki", "j")
var koropokkuru2 : Piece = Piece(2, "koropokkuru", "k")
var kitsune2 : Piece = Piece(2, "kitsune", "l")

var pieceActive : Piece
var pieceAdverse : Piece

while !(let p = partie.partieGagnee()) {
    print("Tour du joueur " + String(partie.joueuractif()))
    //deux possibilites pour le joueur : il bouge une piece ou il en parachute une
    print("Entrez 'parachuter' ou 'deplacer' : ")
    var choix = readLine()
    while choix == nil || (choix != "Deplacer"  && choix != "Parachuter"){
        print("Choix non possible")
        choix = readLine()
    }

    if (choix == "deplacer"){
        //il choisit une position pos1 avec sa piece dessus
        print("Entrez la positon d'une piece à déplacer (lettre de l'alphabet) : ")
        var pos1 = readLine()
        while !(pos1 is Character) || (partie.piecePosition(pos1).joueur = joueuractif()){
            print("Position non possible")
            pos1 = readLine()
        } //s'arrete quand pos1 est un charactere et la piece appartient au joueur actif
        //il choisit une position pos2 ou il veut la deplacer
        print("Entrez la position a deplacer (lettre de l'alphabet) : ")
        var pos2 = readLine()
        while pos2 is Character{
            print("Position non possible")
            pos2 = readLine()
        }

        pieceActive = partie.piecePosition(position : pos1)
        if pieceActive.deplacementPossible(position : pos2)
            if !partie.caseEstVide(position : pos2){
                pieceAdverse = partie.piecePosition(position : pos2)
                //capture la piece adverse
                pieceAdverse.capturer
            }
            //on change la position de la piece
            pieceActive.deplacer(position : pos2)
            //si piece est dans zone adverse et kodama alors transformation
            if pieceActive.estDansZoneAdverse{
                pieceActive.transformation
            }
        }    
    }

    if (choix == "parachuter"){
        //il choisit la piece à parachuter
        print("Entrez la piece à parachuter : ")
        var nom = readLine()
        while (((nom != "kodama") && (nom != "kitsune") && (nom != "kodama samourai") && (nom != "koropokkuru") && (nom != "tanuki")) || (partie.piecePosition(pos1).joueur = joueuractif())){
            print("Nom incorrect")
            nom = readLine()
        } //arret : le nom correspond et la piece appartient au joueur actif
        //il choisit une position posp ou il veut la parachuter
        print("Entrez la position a parachuter (lettre de l'alphabet) : ")
        var posP = readLine()
        while posP is Character{
            print("Position non possible")
            if !partie.caseEstVide(position : posP){
                print("Case non vide")
            }
            posP = readLine()
        }

        var piecePara.pieceNom(nom : nom)
        piecePara.parachuter(position : posP)
    }
}

print("Joueur " + String(partie.partieGagnee()) + " a gagné")