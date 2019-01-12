import Library_Dupre_Trannoy

func caseEstVideTest(){
    var p : Partie = Partie()
    var pos1 : Position = "c"
    var pos2 : Position = "z"
    var pos3 : Position = "b"
    var piece1 : Piece = Piece(1,"kodama","c")
    var nberreur = 0
    
    if p.caseEstVide(position : pos2) == true{
        print("le test n'est pas passé")
            nberreur+=1}
    else{
        print("le test est passé")
        }
    
    if p.caseEstVide(position : pos1) == true{
        print("le test est passé")}
    else{
        print("le test n'est pas passé")
        nberreur+=1
    }
  
    if p.caseEstVide(position: pos3) == true{
        print("le test est passé")}
    else{
        print("le test n'est pas passé")
        nberreur+=1
    }
    return nberreur

}

func piecePositionTest(){
    var nberreur = 0
    var partie : Partie = Partie()
    var pos1 : Position = "a"
    var pos2 : Position = "b"
    var pos3 : Position = "z"
    var pos4 : Position = "c"
    var piece1 : Piece = Piece(1,"kodama","a")
    var piece2 : Piece = Piece(2,"kodama","b")
  
    if partie.piecePosition(position : pos1) == piece1{
        print("le test est passé")}
    else{
        print("le test n'est pas passé")
        nberreur+=1
    }
   
    if (partie.piecePosition(position : pos2) == piece2)||(partie.piecePosition(position : pos2) == nil){
        print("le test n'est pas passé")
        nberreur+=1}

    else{
        print("le test est passé")
    }
 
    if partie.piecePosition(position : pos3) != nil{
        print("le test n'est pas passé")
        nberreur+=1}
    else{
        print("le test est passé")
    }

    if partie.piecePosition(position : pos4) != nil{
        print("le test n'est pas passé")
        nberreur+=1}
    else{
        print("le test est passé")
    
    }

    return nberreur
}

func pieceNomTest(){
    var nberreur = 0
    var partie : Partie = Partie()
    var piece1 : Piece = Piece(1,"kodama",nil)
    var piece2 : Piece = Piece(1,"kodama","a")
    var nom1 : String = "kodama"
    var nom2 : String = "kitsune"
    var nom3 : String = "atfef"
    
    if partie.pieceNom(nom : nom1) != piece1{
        print("le test n'est pas passé")
        nberreur+=1}
    else{
        print("le test est passé")
    }

    if partie.pieceNom(nom : nom2) != nil{
        print("le test n'est pas passé")
        nberreur+=1}
    else{
        print("le test est passé")
    }

    if partie.pieceNom(nom : nom3) == piece2{
        print("le test n'est pas passé")
        nberreur+=1}
    else{
        print("le test est passé")
    }

    return nberreur
}

func joueurActifTest(){
    var nberreur = 0
    var partie : Partie = Partie()
    if (partie.joueurActif() != 1) || (partie.joueurActif() != 2){
        print("le test n'est pas passé")
        nberreur+=1}
    else{
        print("le test est passé")
    }

    return nberreur
}

func changementJoueurTest(){
    var nberreur = 0
    var partie : Partie = Partie()
    var joueur1 : Int = 1
    var joueur2 : Int = 2
    var joueur3 : Int = 3

    if partie.changementJoueur(joueurActif : joueur1) != 2{
        print("le test n'est pas passé")
        nberreur+=1}
    else{
        print("le test est passé")
    }

    if partie.changementJoueur(joueurActif : joueur2) != 1{
        print("le test n'est pas passé")
        nberreur+=1}
    else{
        print("le test est passé")
    }

    if (partie.changementJoueur(joueurActif : joueur3) == 1) || (partie.changementJoueur(joueurActif : joueur3) == 2){
        print("le test n'est pas passé")
        nberreur+=1
    }
    
    return nberreur

}

