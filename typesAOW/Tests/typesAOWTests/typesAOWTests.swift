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
		var carte = ProtocoleCarte(nom: "Roi A")
		XCTAssertEqual(1, carte.afficheattaque())
		XCTAssertEqual(4, carte.affichedefenseD())
		XCTAssertEqual(4, carte.affichedefenseO())
		XCTAssertEqual([1,1,1], carte.porteeCac)
		XCTAssertEqual([1,0,0], carte.porteeDist)
	}

	func testaffichernom() {
		var carte = ProtocoleCarte(nom: "Roi A")
		XCTAssertEqual("Roi A", carte.affichernom())
	}

	func testdegatsCumules() {
		var carte1 = ProtocoleCarte(nom: "Garde")
		carte1.ajoutDegats(1)
		carte1.ajoutDegats(1)
		XCTAssertEqual(2, carte1.degatsCumules())
		
	}

	func testestRetournee() {
		var carte1 = ProtocoleCarte(nom: "Garde")
		carte1.redresser()
		XCTAssertEqual(1, carte1.estRetournee())
		carte1.retourner()
		XCTAssertEqual(0, carte1.estRetournee())
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
		p1 = ProtocolePosition(1, 1)
		C1.poser(c: carte, p: p1)	
		let carte1 = C1.sortir(p1)
		XCTAssertEqual(0, C1.checkCarte(p1))
		XCTAssertEqual(carte, carte1)
		//cas où exception
	}
	
	func testPoser() {
		C1 = ProtocoleChampsDeBataille()
		carte = ProtocoleCarte("soldat")
		p1 = ProtocolePosition(0, 1)	
		C1.poser(c: carte, p: p1) //Impossible de la placer à l'arrière car il n'y a pas de carte, elle est donc placée au front.
		XCTAssertEqual(1, C1.checkCarte(ProtocolePosition(1,1))
		C1.poser(c: ProtocoleCarte("soldat"), ProtocolePosition(0,1))
		XCTAssertEqual(1, C1.checkCarte(ProtocolePosition(0,1))
		//cas où exception 
	}

	func testDeplacer() {
		C1 = ProtocoleChampsDeBataille()
		carte1 = ProtocoleCarte("soldat")
		carte2 = ProtocoleCarte("soldat")
		p1 = ProtocolePosition(1, 1)	
		p2 = ProtocolePosition(0, 1)
		C1.poser(c: carte1, p: p1)
		C1.poser(c: carte2, p: p2)
		carte1.ajouterDegats(12)
		C1.supprimer(p1: p1)
		C1.deplacer(colonne: 1)
		XCTAssertEqual(1, C1.checkCarte(p1))
		XCTAssertEqual(0, C1.checkCarte(p2))
	}

	func testSupprimer() {
		C1 = ProtocoleChampsDeBataille()
		carte = ProtocoleCarte("soldat")
		p1 = ProtocolePosition(1, 1)	
		C1.poser(c: carte, p: p1)
		C1.supprimer(p1: p1)
		XCTAssertEqual(0, C1.checkCarte(p1))		
	}

	func testestAportee() {
		C1 = ProtocoleChampsDeBataille()
		C2 = ProtocoleChampsDeBataille()
		carte = ProtocoleCarte("soldat")
		p1 = ProtocolePosition(1, 1)
		p2 = ProtocolePosition(1, 1)	
		C1.poser(c: carte, p: p1)
		C2.poser(c: carte, p: p2)
		XCTAssertEqual(1,C1.estAportee(p1: p1, C2: C2, p2: p2))
	}

	func testestVide() {
		C1 = ProtocoleChampsDeBataille()
		XCTAssertEqual(1, C1.estVide())
		C1.poser(ProtocoleCarte("soldat"), ProtocolePosition(1,1))
		XCTAssertEqual(0, C1.estVide())
	}

}


final class ProtocoleCimetiereTests: XCTestCase {
	
	func testInit() {
		C = ProtocoleCimetiere()
		XCTAssertEqual(1, C.estVide())
	}

	func testAjouter() {
		C = ProtocoleCimetiere()
		carte = ProtocoleCarte("soldat")
		C.ajouter(c: carte)
		XCTAssertEqual(0, C.estVide())
	}
}

final class ProtocoleMainTests: XCTestCase {
	
	func testInit() {
		M = ProtocoleMain()
		XCTAssertEqual(0, M.taille())
	}

	func testAjouter() {
		M = ProtocoleMain()
		carte = ProtocoleCarte("soldat")
		M.ajouter(c: carte)
		XCTAssertEqual(carte, M.afficher())
	}

	func testRetirer() {
		M = ProtocoleMain()
		carte = ProtocoleCarte("soldat")
		M.ajouter(c: carte)
		let c = M.retirer("soldat")
		XCTAssertEqual(carte, c)
	}

	func testAfficher() {
		M = ProtocoleMain()
		carte = ProtocoleCarte("soldat")
		M.ajouter(c: carte)
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
		
	}

	func testAfficher() {
		p = ProtocolePosition()
		p.front = 1
		p.colonne = 1
		XCTAsserEqual(0, p.afficher())
		C1 = ProtocoleChampsDeBataille()
		C1.poser(c: ProtocoleCarte("soldat"), p: p)
		XCTAssertEqual(1, p.afficher())
		
	}

	func testEstFront() {
		p = ProtocolePosition()
		p.front = 1
		p.colonne = 1	
		XCTAssertEqual(1, p.estFront())	
	}

	func testgetColonne() {
		p = ProtocolePosition()
		p.front = 1
		p.colonne = 1
		XCTAssertEqual(1, p.getColonne())
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
		R.placer(c: carte)
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
		XCTAssertEqual(0, R.getnbCartes())
	}

	func getnbArchers() {
		R = ProtocoleRoyaume()
		R.placer(c: ProtocoleCarte("archer")
		R.placer(c: ProtocoleCarte("archer")
		XCTAssertEqual(2, R.getnbArchers())
	}

	func getnbGardes() {
		R = ProtocoleRoyaume()
		R.placer(c: ProtocoleCarte"garde")
		R.placer(c: ProtocoleCarte"garde")
		XCTAssertEqual(2, R.getnbGardes())
	}

	func getnbSoldats() {
		R = ProtocoleRoyaume()
		R.placer(c: ProtocoleCarte"soldat")
		R.placer(c: ProtocoleCarte"soldat")
		XCTAssertEqual(2, R.getnbSoldats())
	}

	func getnbCartes() {
		R = ProtocoleRoyaume()
		R.placer(c: ProtocoleCarte"soldat")
		R.placer(c: ProtocoleCarte"soldat")
		R.placer(c: ProtocoleCarte"garde")
		R.placer(c: ProtocoleCarte"garde")
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
