import XCTest
@testable import ProtocoleCarte 
@testable import ProtocoleChampsDeBataille 
@testable import ProtocoleCimetiere 
@testable import ProtocoleMain 
@testable import ProtocolePioche 
@testable import ProtocolePosition
@testable import ProtocoleRoyaume

final class ProtocoleCarteTests: XCTestCase {

	func testInit() {
		var carte = ProtocoleCarte("Roi A")
		XCTAssertEqual(1, carte.afficheattaque())
		XCTAssertEqual(4, carte.affichedefenseD())
		XCTAssertEqual(4, carte.affichedefenseO())
		XCTAssertEqual([true,true,true], carte.porteeCac)
		XCTAssertEqual([true,false,false], carte.porteeDist)
	}

	func testaffichernom() {
		var carte = ProtocoleCarte("Roi A")
		XCTAssertEqual("Roi A", carte.affichernom())
	}

	func testdegatsCumules() {
		var carte1 = ProtocoleCarte(nom: "Garde")
		carte1.ajoutDegats(1)
		carte1.ajoutDegats(1)
		XCTAssertEqual(2, carte1.degatsCumules())
		
	}

	func testestRetournee() {
		var carte1 = ProtocoleCarte("Garde")
		carte1.redresser()
		XCTAssertEqual(true, carte1.estRetournee())
		carte1.retourner()
		XCTAssertEqual(false, carte1.estRetournee())
	}	

	func testAjoutDegat() {
		var carte1 = ProtocoleCarte("Garde")
		carte1.ajoutDegat(2)
		XCTAsserEqual(1, carte1.affichedefenseD)
		carte1.ajoutDegat(500)
		XCTAsserEqual(0, carte1.affichedefenseD)
	}

	func testRetourner() {
		var carte = ProtocoleCarte("Garde")
		carte.retourner()
		XCTAsserEqual(true, carte.estRetournee())
	}

	func testRedresser() {
		var carte = ProtocoleCarte("Garde")
		carte.retourner()
		carte.ajoutDegat(2)
		carte.redresser()
		XCTAsserEqual()
	}

}

final class ProtocoleChampsDeBatailleTests: XCTestCase {
	
	func testInit() {
		C1 = ProtocoleChampsDeBataille()
		let i = 0
		let erreur = 0
		for unePosition in C1.position {
			let posF = "F"+i
			let posA = "A"+i
			if unePosition.estFront() {
				if !(posF == unePosition.front + unePosition.getColonne()) {
					erreur +=1		
				}  
			} else {
				if !(posA == unePosition.front + unePosition.getColonne()) {
					erreur +=1
				}
			}
			i += 1
		}
		XCTAssertEqual(0, erreur)
	}

	func testSortir() {
		C1 = ProtocoleChampsDeBataille()
		carte = ProtocoleCarte("soldat")
		p1 = ProtocolePosition(true, 1)
		C1.poser(c: carte, p: p1)	
		let carte1 = C1.sortir(p1)
		XCTAssertEqual(false, C1.checkCarte(p1))
		XCTAssertEqual(carte, carte1)
		XCTAssertEqual("Exception", checkCarte(ProtocolePosition(false,1)))
	}
	
	func testPoser() {
		C1 = ProtocoleChampsDeBataille()
		carte = ProtocoleCarte("soldat")
		p1 = ProtocolePosition(false, 1)	
		C1.poser(c: carte, p: p1) //Impossible de la placer à l'arrière car il n'y a pas de carte, elle est donc placée au front.
		XCTAssertEqual(true, C1.checkCarte(ProtocolePosition(true,1))
		C1.poser(c: ProtocoleCarte("soldat"), ProtocolePosition(false,1))
		XCTAssertEqual(false, C1.checkCarte(ProtocolePosition(false,1))
		XCTAsserEqual(false, C1.checkCarte(ProtocolePosition(false,0)))
	}

	func testDeplacer() {
		C1 = ProtocoleChampsDeBataille()
		carte1 = ProtocoleCarte("soldat")
		carte2 = ProtocoleCarte("soldat")
		p1 = ProtocolePosition(false, 1)	
		p2 = ProtocolePosition(true, 1)
		C1.poser(carte1, p1)
		C1.poser(carte2, p2)
		carte1.ajouterDegats(12)
		C1.supprimer(p1)
		C1.deplacer(1)
		XCTAssertEqual(true, C1.checkCarte(p1))
		XCTAssertEqual(false, C1.checkCarte(p2))
	}

	func testSupprimer() {
		C1 = ProtocoleChampsDeBataille()
		carte = ProtocoleCarte("soldat")
		p1 = ProtocolePosition(true, 1)	
		C1.poser(carte, p1)
		C1.supprimer(p1)
		XCTAssertEqual(false, C1.checkCarte(p1))		
	}

	func testestAportee() {
		C1 = ProtocoleChampsDeBataille()
		C2 = ProtocoleChampsDeBataille()
		carte = ProtocoleCarte("soldat")
		p1 = ProtocolePosition(true, 1)
		p2 = ProtocolePosition(true, 1)	
		C1.poser(carte, p1)
		C2.poser(carte, p2)
		XCTAssertEqual(true,C1.estAportee(p1, C2, p2))
	}

	func testestVide() {
		C1 = ProtocoleChampsDeBataille()
		XCTAssertEqual(true, C1.estVide())
		C1.poser(ProtocoleCarte("soldat"), ProtocolePosition(true,1))
		XCTAssertEqual(false, C1.estVide())
	}

}


final class ProtocoleCimetiereTests: XCTestCase {
	
	func testInit() {
		C = ProtocoleCimetiere()
		XCTAssertEqual(true, C.estVide())
	}

	func testAjouter() {
		C = ProtocoleCimetiere()
		carte = ProtocoleCarte("soldat")
		C.ajouter(carte)
		XCTAssertEqual(false, C.estVide())
	}
}

final class ProtocoleMainTests: XCTestCase {
	
	func testInit() {
		M = ProtocoleMain()
		XCTAssertEqual(false, M.taille())
	}

	func testAjouter() {
		M = ProtocoleMain()
		carte = ProtocoleCarte("soldat")
		M.ajouter(carte)
		XCTAssertEqual(carte, M.afficher())
	}

	func testRetirer() {
		M = ProtocoleMain()
		carte = ProtocoleCarte("soldat")
		M.ajouter(carte)
		let c = M.retirer("soldat")
		XCTAssertEqual(carte, c)
	}

	func testAfficher() {
		M = ProtocoleMain()
		carte = ProtocoleCarte("soldat")
		M.ajouter(carte)
		XCTAssertEqual(carte, M.afficher())		
	}
}

final class ProtocolePiocheTest: XCTestCase {

	func testInit() {
		P = ProtocolePioche()
		XCTAssertEqual(20, P.getnbCartes())
	}

	func testPiocher() {
		P = ProtocolePioche()
		let carte = P.piocher()
		XCTAssertEqual(ProtocoleCarte, carte)
	}

	func testgetnbCartes() {
		P = ProtocolePioche()
		XCTAssertEqual(20, P.getnbCartes())
	}
}

final class ProtocolePositionTest: XCTestCase {
	
	func testInit() {
		p = ProtocolePosition()
		carte = ProtocoleCarte
	}

	func testAfficher() {
		p = ProtocolePosition()
		p.front = true
		p.colonne = 1
		XCTAsserEqual(false, p.afficher())
		C1 = ProtocoleChampsDeBataille()
		C1.poser(ProtocoleCarte("soldat"), p)
		XCTAssertEqual(true, p.afficher())
		
	}

	func testEstFront() {
		p = ProtocolePosition()
		p.front = 1
		p.colonne = 1	
		XCTAssertEqual(true, p.estFront())	
	}

	func testgetColonne() {
		p = ProtocolePosition()
		p.front = 1
		p.colonne = 1
		XCTAssertEqual(true, p.getColonne())
	}
	
}

final class ProtocoleRoyaume(): XCTestCase {
	
	func testInit() {
		R = ProtocoleRoyaume()
		XCTAssertEqual(0, R.getnbCartes())
	}
	
	func testVoirSuivant() {
		R = ProtocoleRoyaume()
		XCTAssertEqual(nil, R.VoirSuivant())
		carte = ProtocoleCarte("soldat")
		R.placer(carte)
		XCTAssertEqual(carte, R.VoirSuivant())
		
	}

	func testPlacer() {
		R = ProtocoleRoyaume()
		R.placer(c: ProtocoleCarte("soldat"))
		XCTAssertEqual(ProtocoleCarte("soldat"), R.VoirSuivant())
	}

	func testRetirer() {
		R = ProtocoleRoyaume()
		R.placer(c: ProtocoleCarte("soldat")
		XCTAssertEqual(ProtocoleCarte("soldat"), R.retirer())
		XCTAssertEqual(false, R.getnbCartes())
	}

	func getnbArchers() {
		R = ProtocoleRoyaume()
		R.placer(ProtocoleCarte("archer")
		R.placer(ProtocoleCarte("archer")
		XCTAssertEqual(2, R.getnbArchers())
	}

	func getnbGardes() {
		R = ProtocoleRoyaume()
		R.placer(ProtocoleCarte"garde")
		R.placer(ProtocoleCarte"garde")
		XCTAssertEqual(2, R.getnbGardes())
	}

	func getnbSoldats() {
		R = ProtocoleRoyaume()
		R.placer(ProtocoleCarte"soldat")
		R.placer(ProtocoleCarte"soldat")
		XCTAssertEqual(2, R.getnbSoldats())
	}

	func getnbCartes() {
		R = ProtocoleRoyaume()
		R.placer(ProtocoleCarte"soldat")
		R.placer(ProtocoleCarte"soldat")
		R.placer(ProtocoleCarte"garde")
		R.placer(ProtocoleCarte"garde")
		XCTAssertEqual(4, R.getnbCartes())
	}


final class typesAOWTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(typesAOW().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
