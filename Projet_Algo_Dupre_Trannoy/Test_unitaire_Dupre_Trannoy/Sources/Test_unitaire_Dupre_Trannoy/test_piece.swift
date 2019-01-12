import Library_Dupre_Trannoy

func joueurPieceTest() -> Int{
    let piece1 : Piece = Piece(1, "kitsune", Position("a"))
    let piece2 : Piece = Piece(2, "kitsune", Position("a"))
    let piece3 : Piece = Piece(3, "kitsune", Position("a"))
    let retour1 = piece1.joueurPiece()
    let retour2 = piece2.joueurPiece()
    let retour3 = piece3.joueurPiece()
    var nberreur: Int = 0

    if (retour1 == 1) || (retour1 == 2) {
        print("Le test joueurPiece est passé")
    }
    else{
        print("Le test joueurPiece n'est pas passé")
        nberreur = nberreur + 1
    }

    if (retour2 == 1) || (retour2 == 2) {
        print("Le test joueurPiece est passé")
    }
    else{
        print("Le test joueurPiece n'est pas passé")
        nberreur = nberreur + 1
    }

    if (retour3 == 1) || (retour3 == 2) {
        print("Le test joueurPiece n'est pas passé")
        nberreur = nberreur + 1
    }
    else{
        print("Le test joueurPiece est passé")
    }
    return nberreur
}

func nomPieceTest() -> Int{
    let piece1 : Piece = Piece(1, "kodama", Position("a"))
    let retour1 = piece1.nomPiece()
    let piece2 : Piece = Piece(1, "kitsune", Position("a"))
    let retour2 = piece2.nomPiece()
    let piece3 : Piece = Piece(1, "kodama samourai", Position("a"))
    let retour3 = piece3.nomPiece()
    let piece4 : Piece = Piece(1, "koropokkuru", Position("a"))
    let retour4 = piece4.nomPiece()
    let piece5 : Piece = Piece(1, "tanuki", Position("a"))
    let retour5 = piece5.nomPiece()
    let piece6 : Piece = Piece(1, "inexistant", Position("a"))
    let retour6 = piece6.nomPiece()
    var nberreur: Int = 0

    if (retour1 != "kodama") || (retour1 != "kitsune") || (retour1 != "kodama samourai") || (retour1 != "koropokkuru") || (retour1 != "tanuki"){
        print("Le test nomPiece est passé")
    }
    else{
        print("Le test nomPiece n'est pas passé")
        nberreur += 1
    }

    if (retour2 != "kodama") || (retour2 != "kitsune") || (retour2 != "kodama samourai") || (retour2 != "koropokkuru") || (retour2 != "tanuki"){
        print("Le test nomPiece est passé")
    }
    else{
        print("Le test nomPiece n'est pas passé")
        nberreur += 1
    }

    if (retour3 != "kodama") || (retour3 != "kitsune") || (retour3 != "kodama samourai") || (retour3 != "koropokkuru") || (retour3 != "tanuki"){
        print("Le test nomPiece est passé")
    }
    else{
        print("Le test nomPiece n'est pas passé")
        nberreur += 1
    }

    if (retour4 != "kodama") || (retour4 != "kitsune") || (retour4 != "kodama samourai") || (retour4 != "koropokkuru") || (retour4 != "tanuki"){
        print("Le test nomPiece est passé")
    }
    else{
        print("Le test nomPiece n'est pas passé")
        nberreur += 1
    }

    if (retour5 != "kodama") || (retour5 != "kitsune") || (retour5 != "kodama samourai") || (retour5 != "koropokkuru") || (retour5 != "tanuki"){
        print("Le test nomPiece est passé")
    }
    else{
        print("Le test nomPiece n'est pas passé")
        nberreur += 1
    } 

    if (retour6 != "kodama") || (retour6 != "kitsune") || (retour6 != "kodama samourai") || (retour6 != "koropokkuru") || (retour6 != "tanuki"){
        print("Le test nomPiece n'est pas passé")
        nberreur += 1
    }
    else{
        print("Le test nomPiece est passé")
    }
    return nberreur
}

func positionPieceTest() -> Int{
    let piece1 : Piece = Piece(1, "kodama", Position("e"))
    let retour1 = piece1.positionPiece()
    let piece2 : Piece = Piece(1, "kodama", Position("z"))
    let retour2 = piece2.positionPiece()
    var nberreur: Int = 0

    for char in ("abcdefjkl"){
	if let a = retour1 {
	    if let b = a.getposcharacter() {
	        if char == b{
                    print("Le test positionPiece est passé")
                }
                else{
                    print("Le test positionPiece n'est pas passé")
                    nberreur += 1
                }
    	    }	    
	}        
    }

    for char in ("abcdefjkl"){
	if let a = retour2 {
	    if let b = a.getposcharacter() {
	        if char == b{
                    print("Le test positionPiece n'est pas passé")
                    nberreur += 1
                }
                else{
                    print("Le test positionPiece est passé")
                }
    	    } 
	} 
    }

    return nberreur
}

func deplacementPossibleTest() -> Int{
    let partie : Partie = Partie()
    let piece1 : Piece = Piece(1, "koropokkuru", Position("e"))
    let pos1 : Position = Position("d")
    let retour1 = piece1.deplacementPossible(pos1, partie)
    let pos2 : Position = Position("l")
    let retour2 = piece1.deplacementPossible(pos2, partie)
    let pos3 : Position = Position("z")
    let retour3 = piece1.deplacementPossible(pos3, partie)
    var nberreur: Int = 0

    if retour1{
        print("Le test deplacementPossible est passé")
    }
    else{
        print("Le test deplacementPossible n'est pas passé")
            nberreur += 1
    }

    if !retour2{
        print("Le test deplacementPossible est passé")
    }
    else{
        print("Le test deplacementPossible n'est pas passé")
            nberreur += 1
    }

    if !retour3{
        print("Le test deplacementPossible est passé")
    }
    else{
        print("Le test deplacementPossible n'est pas passé")
            nberreur += 1
    }
    return nberreur
}

func deplacerTest() -> Int{
    let partie: Partie = Partie()
    var piece1 : Piece = Piece(1, "koropokkuru", Position("e"))
    let res1 : Piece = Piece(1, "koropokkuru", Position("d"))
    let pos1 : Position = Position("d")
    piece1.deplacer(pos1, partie)
    var piece2 : Piece = Piece(1, "koropokkuru", Position("e"))
    let pos2 : Position = Position("z")
    let res2 : Piece = Piece(1, "koropokkuru", Position("z"))
    piece2.deplacer(pos2, partie)
    var nberreur: Int = 0

    if let a = piece1.positionPiece() , let c = res1.positionPiece() {
		if let b = a.getposcharacter() , let d = c.getposcharacter() {
			if b == d {
			    print ("Le trest deplacer() est passé")
			} else {
				print("Le test deplacer() n'est pas passé")
				nberreur += 1
    		}
		}
	}
    
   
    if let a = piece2.positionPiece() , let c = res2.positionPiece() {
		if let b = a.getposcharacter() , let d = c.getposcharacter() {
			if b == d {
				print("Le test deplacer() n'est pas passé")
				nberreur += 1
			} else {
				print("Le test deplacer() est passé")
    		}
		}
    } 
    return nberreur
}

func capturerTest() -> Int{
    let partie: Partie = Partie()
    var piece1 : Piece = Piece(1, "kodama", Position("a"))
    piece1.capturer(partie)
    var piece2 : Piece = Piece(1, "kodama samourai", Position("a"))
    piece2.capturer(partie)
    var piece3 : Piece = Piece(1, "kitsune", nil)
    piece3.capturer(partie)
	let res: Piece = Piece(2, "kodama", nil)
    var nberreur: Int = 0

    if piece1.joueurPiece() == res.joueurPiece() && piece1.nomPiece() == res.nomPiece() {
		if let _ = piece1.positionPiece(), let _ = res.positionPiece() {
			print("Le test capturer() n'est pas passé")
       		nberreur += 1
		} else {
			print("Le test capturer() est passé")
		}
	}

	if piece2.joueurPiece() == res.joueurPiece() && piece2.nomPiece() == res.nomPiece() {
		if let _ = piece2.positionPiece(), let _ = res.positionPiece() {
			print("Le test capturer() n'est pas passé")
       		nberreur += 1
		} else {
			print("Le test capturer() est passé")
		}
	}
    

	if piece3.joueurPiece() == res.joueurPiece() && piece3.nomPiece() == "kitsune" {
		if let _ = piece2.positionPiece(), let _ = res.positionPiece() {
			print("Le test capturer() n'est pas passé")
       		nberreur += 1
		} else {
			print("Le test capturer() est passé")
		}
	}

    return nberreur
}

func parachuterTest() -> Int{
    var piece1 : Piece = Piece(1, "kodama", nil)
    let pos1 : Position = Position("d")
    piece1.parachuter(pos1)
    var piece2 : Piece = Piece(1, "kodama", nil)
    let pos2 : Position = Position("z")
    piece2.parachuter(pos2)
    var nberreur: Int = 0

	if let a = piece1.positionPiece() {
		if let b = a.getposcharacter() {
			if b == "d" {
				print ("Le test parachuter() est passé")			
			} else {
		   		print("Le test parachuter() n'est pas passé")
		    	nberreur += 1
   			 }
		} 
	}

	if let _ = piece2.positionPiece() {
		print ("Le test parachuter() n'est pas passé")
        nberreur += 1
	} else {
		print("Le test parachuter() est passé")
	}

    return nberreur
}

func estDansZoneAdverseTest() -> Int{
    let piece1 : Piece = Piece(1, "kodama", Position("k"))
    let retour1 = piece1.estDansZoneAdverse()
    let piece2 : Piece = Piece(1, "kodama", Position("a"))
    let retour2 = piece2.estDansZoneAdverse()
    let piece3 : Piece = Piece(1, "kodama", Position("z"))
    let retour3 = piece3.estDansZoneAdverse()
    var nberreur: Int = 0

    if retour1{
        print("Le test estDansZoneAdverse() est passé")
    }
    else{
        print ("Le test estDansZoneAdverse() n'est pas passé")
        nberreur += 1
    }

    if !retour2{
        print("Le test estDansZoneAdverse() est passé")
    }
    else{
        print ("Le test estDansZoneAdverse() n'est pas passé")
        nberreur += 1
    }

    if !retour3{
        print("Le test estDansZoneAdverse() est passé")
    }
    else{
        print ("Le test estDansZoneAdverse() n'est pas passé")
        nberreur += 1 
    }
    return nberreur
}

func transformationTest() -> Int{
    var piece1 : Piece = Piece(1, "kodama", Position("l"))
    piece1.transformation()
    var piece2 : Piece = Piece(1, "kitsune", Position("l"))
    piece2.transformation()
    var piece3 : Piece = Piece(1, "kodama", nil)
    piece3.transformation()
    var nberreur: Int = 0

    if piece1.nomPiece() == "kodama samourai" {
        print("Le test transformation() est passé")
    }
    else {
        print ("Le test transformation() n'est pas passé")
        nberreur += 1
    }

    if piece2.nomPiece() == "kodama samourai" {
        print("Le test transformation() n'est pas passé")
        nberreur += 1
    }
    else{
        print ("Le test transformation() est passé")
    }

    if piece3.nomPiece() == "kodama samourai" {
        print("Le test transformation() n'est pas passé")
        nberreur += 1
    }
    else{
        print ("Le test transformation() est passé")
    }
    return nberreur
}

/*
var nberreur : Int = 0
nberreur+=joueurPieceTest()
nberreur+=nomPieceTest()
nberreur+=positionPieceTest()
nberreur+=deplacementPossibleTest()
nberreur+=deplacerTest()
nberreur+=capturerTest()
nberreur+=parachuterTest()
nberreur+=estDansZoneAdverseTest()
nberreur+=transformationTest()
*/
