import Library_Dupre_Trannoy

func memeposition(_ pos1: Position?,_ pos2: Position?) -> Bool{
    if pos1 == nil && pos2 == nil{
        return true
    }
    else{
        if let a = pos1{
            if let b = a.getposcharacter(){
                if let c = pos2{
                    if let d = c.getposcharacter(){
                        return b == d
                    }
                }
            }
        }
        return false
    }
}

func memepiece(_ piece1:Piece,_ piece2:Piece) -> Bool{
    if piece1.nomPiece() == piece2.nomPiece(){
        if piece1.joueurPiece() == piece2.joueurPiece(){
            if memeposition(piece1.positionPiece(), piece2.positionPiece()){
                return true
            }
        }
    }
    return false
}

func caseEstVideTest() -> Int{
    let pos1 : Position = Position("c")
    let pos2 : Position = Position("z")
    let pos3 : Position = Position("b")
    let piece1 : Piece = Piece(1,"kodama",Position("c"))
    let p : Partie = Partie([piece1])!
    var nberreur = 0
    
    if p.caseEstVide(pos2){
        print("le test n'est pas passé")
            nberreur += 1}
    else{
        print("le test est passé")
        }
    
    if p.caseEstVide(pos1){
        print("le test est passé")}
    else{
        print("le test n'est pas passé")
        nberreur += 1
    }
  
    if p.caseEstVide(pos3){
        print("le test est passé")}
    else{
        print("le test n'est pas passé")
        nberreur += 1
    }
    return nberreur

}

func piecePositionTest() -> Int{
    var nberreur = 0
    let pos1 : Position = Position("a")
    let pos2 : Position = Position("b")
    let pos3 : Position = Position("z")
    let pos4 : Position = Position("c")
    let piece1 : Piece = Piece(1,"kodama",Position("a"))
    let piece2 : Piece = Piece(2,"kodama",Position("b"))
    let partie : Partie = Partie([piece1, piece2])!


    if memepiece(partie.piecePosition(pos1)!, piece1){
        print("le test est passé")}
    else{
        print("le test n'est pas passé")
        nberreur += 1
    }
   
    if memepiece(partie.piecePosition(pos2)!,piece2) || (partie.piecePosition(pos2) == nil){
        print("le test n'est pas passé")
        nberreur += 1}

    else{
        print("le test est passé")
    }
 
    if partie.piecePosition(pos3) != nil{
        print("le test n'est pas passé")
        nberreur += 1}
    else{
        print("le test est passé")
    }

    if partie.piecePosition(pos4) != nil{
        print("le test n'est pas passé")
        nberreur += 1 }
    else{
        print("le test est passé")
    
    }

    return nberreur
}

func pieceNomTest() -> Int{
    var nberreur = 0
    let piece1 : Piece = Piece(1,"kodama",nil)
    let piece2 : Piece = Piece(1,"kodama",Position("a"))
    let nom1 : String = "kodama"
    let nom2 : String = "kitsune"
    let nom3 : String = "atfef"
    let partie : Partie = Partie([piece1, piece2])!

    
    if let a = partie.pieceNom(nom1){
        if let b = a.positionPiece(){
            if b.getposcharacter() != nil{
                print("le test n'est pas passé")
                nberreur += 1
            }
            else{
                print("le test est passé")
            }
        }
    } 
        


    if let a = partie.pieceNom(nom2){
        if let _ = a.positionPiece(){
            print("le test n'est pas passé")
            nberreur += 1
        }
        else{
            print("le test est passé")
            
        }
    }   

    if let a = partie.pieceNom(nom3){
        if let _ = a.positionPiece(){
            print("le test n'est pas passé")
            nberreur += 1
        }
        else{
            print("le test est passé")
            
        }

    }
    
    return nberreur
}

func joueurActifTest() -> Int{
    var nberreur = 0
    let partie : Partie = Partie()
    if (partie.joueurActif() != 1) || (partie.joueurActif() != 2){
        print("le test n'est pas passé")
        nberreur+=1}
    else{
        print("le test est passé")
    }

    return nberreur
}

func changementJoueurTest() -> Int{
    var nberreur = 0
    var partie : Partie = Partie()
    let joueur1 : Int = 1
    let joueur2 : Int = 2
    let joueur3 : Int = 3

    if partie.changementJoueur(joueur1) != 2{
        print("le test n'est pas passé")
        nberreur+=1}
    else{
        print("le test est passé")
    }

    if partie.changementJoueur(joueur2) != 1{
        print("le test n'est pas passé")
        nberreur+=1}
    else{
        print("le test est passé")
    }

    if (partie.changementJoueur(joueur3) == 1) || (partie.changementJoueur(joueur3) == 2){
        print("le test n'est pas passé")
        nberreur+=1
    }
    
    return nberreur

}

