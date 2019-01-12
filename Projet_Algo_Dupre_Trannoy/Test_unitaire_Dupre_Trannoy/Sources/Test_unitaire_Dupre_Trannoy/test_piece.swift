import Library_Dupre_Trannoy

func joueurPieceTest() -> String{
    var piece1 : Piece = Piece(1, "kitsune", "a")
    var piece2 : Piece = Piece(2, "kitsune", "a")
    var piece3 : Piece = Piece(3, "kitsune", "a")
    var retour1 = piece1.joueurPiece()
    var retour2 = piece2.joueurPiece()
    var retour3 = piece3.joueurPiece()

    if (retour1 == 1) || (retour1 == 2) {
        print("Le test joueurPiece est passé")
    }
    else{
        print("Le test joueurPiece n'est pas passé")
        nberreur=nberreur+1
    }

    if (retour2 == 1) || (retour2 == 2) {
        print("Le test joueurPiece est passé")
    }
    else{
        print("Le test joueurPiece n'est pas passé")
        nberreur=nberreur+1
    }

    if (retour3 == 1) || (retour3 == 2) {
        print("Le test joueurPiece n'est pas passé")
        nberreur=nberreur+1
    }
    else{
        print("Le test joueurPiece est passé")
    }
}

func nomPieceTest() -> String{
    var piece1 : Piece = Piece(1, "kodama", "a")
    var retour1 = piece1.nomPiece()
    var piece2 : Piece = Piece(1, "kitsune", "a")
    var retour2 = piece2.nomPiece()
    var piece3 : Piece = Piece(1, "kodama samourai", "a")
    var retour3 = piece3.nomPiece()
    var piece4 : Piece = Piece(1, "koropokkuru", "a")
    var retour4 = piece4.nomPiece()
    var piece5 : Piece = Piece(1, "tanuki", "a")
    var retour5 = piece5.nomPiece()
    var piece6 : Piece = Piece(1, "inexistant", "a")
    var retour6 = piece6.nomPiece()

    if (retour1 != "kodama") || (retour1 != "kitsune") || (retour1 != "kodama samourai") || (retour1 != "koropokkuru") || (retour1 != "tanuki"){
        print("Le test nomPiece est passé")
    }
    else{
        print("Le test nomPiece n'est pas passé")
        nberreur+=1
    }

    if (retour2 != "kodama") || (retour2 != "kitsune") || (retour2 != "kodama samourai") || (retour2 != "koropokkuru") || (retour2 != "tanuki"){
        print("Le test nomPiece est passé")
    }
    else{
        print("Le test nomPiece n'est pas passé")
        nberreur+=1
    }

    if (retour3 != "kodama") || (retour3 != "kitsune") || (retour3 != "kodama samourai") || (retour3 != "koropokkuru") || (retour3 != "tanuki"){
        print("Le test nomPiece est passé")
    }
    else{
        print("Le test nomPiece n'est pas passé")
        nberreur+=1
    }

    if (retour4 != "kodama") || (retour4 != "kitsune") || (retour4 != "kodama samourai") || (retour4 != "koropokkuru") || (retour4 != "tanuki"){
        print("Le test nomPiece est passé")
    }
    else{
        print("Le test nomPiece n'est pas passé")
        nberreur+=1
    }

    if (retour5 != "kodama") || (retour5 != "kitsune") || (retour5 != "kodama samourai") || (retour5 != "koropokkuru") || (retour5 != "tanuki"){
        print("Le test nomPiece est passé")
    }
    else{
        print("Le test nomPiece n'est pas passé")
        nberreur+=1
    }

    if (retour6 != "kodama") || (retour6 != "kitsune") || (retour6 != "kodama samourai") || (retour6 != "koropokkuru") || (retour6 != "tanuki"){
        print("Le test nomPiece n'est pas passé")
        nberreur+=1
    }
    else{
        print("Le test nomPiece est passé")
    }
}

func positionPieceTest() -> Position{
    var piece1 : Piece = Piece(1, "kodama", "e")
    var retour1 = piece1.positionPiece()
    var piece2 : Piece = Piece(1, "kodama", "z")
    var retour2 = piece2.positionPiece()

    for char in ("abcdefjkl"){
        if char == Character(retour1){
            print("Le test positionPiece est passé")
        }
        else{
            print("Le test positionPiece n'est pas passé")
            nberreur+=1
        }
    }

    for char in ("abcdefjkl"){
        if char == Character(retour2){nberreur+=1
            print("Le test positionPiece n'est pas passé")
            nberreur+=1
        }
        else{
            print("Le test positionPiece est passé")
        }
    }
}

func deplacementPossibleTest(position : Position) -> Bool{
    var piece1 : Piece = Piece(1, "koropokkuru", "e")
    var pos1 : Position = "d"
    var retour1 = piece1.deplacementPossible(pos1)
    var pos2 : Position = "l"
    var retour2 = piece1.deplacementPossible(pos2)
    var pos3 : Position = "z"
    var retour3 = piece1.deplacementPossible(pos2)

    if retour1{
        print("Le test deplacementPossible est passé")
    }
    else{
        print("Le test deplacementPossible n'est pas passé")
            nberreur+=1
    }

    if !retour2{
        print("Le test deplacementPossible est passé")
    }
    else{
        print("Le test deplacementPossible n'est pas passé")
            nberreur+=1
    }

    if !retour3{
        print("Le test deplacementPossible est passé")
    }
    else{
        print("Le test deplacementPossible n'est pas passé")
            nberreur+=1
    }
}

func deplacerTest(position : Position){
    var piece1 : Piece = Piece(1, "koropokkuru", "e")
    var pos1 : Position = "d"
    var retour1 = piece1.deplacer(position : pos1)
    var piece2 : Piece = Piece(1, "koropokkuru", "e")
    var pos2 : Position = "z"
    var retour2 = piece1.deplacer(position : pos2)

    if retour1 == Piece(1, "koropokkuru", "d"){
        print ("Le test deplacer() est passé")
    }
    else{
        print("Le test deplacer() n'est pas passé")
        nberreur+=1
    }

    if retour2 == Piece(1, "koropokkuru", "z"){
        print ("Le test deplacer() n'est pas passé")
        nberreur+=1
    }
    else{
        print("Le test deplacer() est passé")
    }
}

func capturerTest(){
    var piece1 : Piece = Piece(1, "kodama", "a")
    var retour1 = piece1.capturer()
    var piece2 : Piece = Piece(1, "kodama samourai", "a")
    var retour2 = piece2.capturer()
    var piece3 : Piece = Piece(1, "kitsune", nil)
    var retour3 = piece3.capturer()

    if (retour1 == Piece(2, "kodama", nil)){
        print("Le test capturer() est passé")
    }
    else{
        print("Le test capturer() n'est pas passé")
        nberreur+=1
    }

    if (retour2 == Piece(2, "kodama", nil)){
        print("Le test capturer() est passé")
    }
    else{
        print("Le test capturer() n'est pas passé")
        nberreur+=1
    }

    if (retour2 == Piece(2, "kodama", nil)){
        print("Le test capturer() n'est pas passé")
        nberreur+=1
    }
    else{
        print("Le test capturer() est passé")
    }
}

func parachuterTest(){
    var piece1 : Piece = Piece(1, "kodama", nil)
    var pos1 : Position = "d"
    var retour1 = piece1.parachuter(position : pos1)
    var piece2 : Piece = Piece(1, "kodama", nil)
    var pos2 : Position = "z"
    var retour2 = piece1.parachuter(position : pos2)

    if (retour1 == Piece(1, "kodama", "d")){
        print ("Le test parachuter() est passé")
    }
    else{
        print("Le test parachuter() n'est pas passé")
        nberreur+=1
    }

    if (retour2 == Piece(1, "kodama", "z")){
        print ("Le test parachuter() n'est pas passé")
        nberreur+=1
    }
    else{
        print("Le test parachuter() est passé")
    }
}

func estDansZoneAdverseTest() -> Bool{
    var piece1 : Piece = Piece(1, "kodama", "k")
    var retour1 = piece1.estDansZoneAdverse()
    var piece2 : Piece = Piece(1, "kodama", "a")
    var retour2 = piece2.estDansZoneAdverse()
    var piece3 : Piece = Piece(1, "kodama", "z")
    var retour3 = piece2.estDansZoneAdverse()

    if retour1{
        print("Le test estDansZoneAdverse() est passé")
    }
    else{
        print ("Le test estDansZoneAdverse() n'est pas passé")
        nberreur+=1
    }

    if !retour2{
        print("Le test estDansZoneAdverse() est passé")
    }
    else{
        print ("Le test estDansZoneAdverse() n'est pas passé")
        nberreur+=1
    }

    if !retour3{
        print("Le test estDansZoneAdverse() est passé")
    }
    else{
        print ("Le test estDansZoneAdverse() n'est pas passé")
        nberreur+=1
    }
}

func transformationTest() -> Bool{
    var piece1 : Piece = Piece(1, "kodama", "l")
    var retour1 = piece1.transformation()
    var piece2 : Piece = Piece(1, "kitsune", "l")
    var retour2 = piece2.transformation()
    var piece3 : Piece = Piece(1, "kodama", "a")
    var retour3 = piece3.transformation()

    if retour1 == Piece(1, "kodama samourai", "l"){
        print("Le test transformation() est passé")
    }
    else{
        print ("Le test transformation() n'est pas passé")
        nberreur+=1
    }

    if retour2 == Piece(1, "kodama samourai", "l"){
        print("Le test transformation() n'est pas passé")
        nberreur+=1
    }
    else{
        print ("Le test transformation() est passé")
    }

    if retour3 == Piece(1, "kodama samourai", "a"){
        print("Le test transformation() n'est pas passé")
        nberreur+=1
    }
    else{
        print ("Le test transformation() est passé")
    }
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
