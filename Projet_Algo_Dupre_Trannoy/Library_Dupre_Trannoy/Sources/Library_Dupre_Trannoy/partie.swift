import Foundation

//Type Partie(Position)
public protocol PartieProtocol: Sequence{
    associatedtype position: PositionProtocol
    associatedtype piece: PieceProtocol
    associatedtype iteratorpartie: IteratorProtocol where iteratorpartie.Element == Piece

    //init : -> Partie
    //creation de la partie, une partie est une collection de pieces
    init()

    //partieGagnee : -> (Int | Vide)
    //savoir si la partie est gagnee et par qui
    //Pre : la partie n'est pas gagnee
    //Post : renvoie 1 si la partie est gagnee par le joueur 1; 2 si elle est gagnee par le joueur 2
    //la partie est gagnee si un roi est dans la reserve ou si un roi est dans la zone adverse depuis plus d'un tour
    //Post : renvoie Vide si la partie n'est pas gagnee, sinon 1 ou 2 selon qui a gagnee
    func partieGagnee() -> Int?

    //caseEstVide : Position -> Bool
    //précise si une case donnée est occupée ou vide
    //Pré : position existente sur le plateau
    //Post : renvoie True si case vide, False sinon
    func caseEstVide(_ pos : position) -> Bool

    //piecePosition : Position -> (Piece | Vide)
    //fonction qui a une position donnée sur le plateau renvoie la piece correspondante
    //Pre : position sur le plateau du joueur actif
    //Post : renvoie la piece à la position donnée si la piece appartient au joueuractif() sinon Vide si la position n'a pas de piece ou si elle n'appartient pas au joueur actif
    func piecePosition(_ pos : position) -> piece?

    //pieceNom : String -> (Piece | Vide)
    //a partir du nom d'une piece dans la reserve renvoie la Piece correspondante
    //Pre : nom d'une piece dans la reserve du joueur actif
    //Post : renvoie la piece avec le nom donné si la piece appartient au joueuractif() sinon Vide si le nom n'a pas de piece dans la reserve ou si elle n'appartient pas au joueur actif
    func pieceNom(_ nom : String) -> piece?

    //joueurActif : -> Int
    //au premier tour de jeu c'est le joueur 1 qui commence puis a chaque tour ca s'alterne
    //Pre : la partie n'est pas terminee
    //Post : renvoie 1 ou 2
    func joueurActif() -> Int

    //listepiece: ->[Piece]
    //Renvoie la liste des pieces de la partie
    func listepiece() -> [piece]

    //changementJoueur : Int -> Int
    //Pre : joueurActif() = 1 ou 2
    //Post : renvoie 1 si le joueur etait 2 et inversement
    mutating func changementJoueur(_ joueurActif : Int) -> Int

    // makeIterator : Partie -> ItPartie
    // crée un itérateur sur le collection pour itérer avec for in. itère sur les positions de la partie.
    mutating func makeIterator() -> iteratorpartie

}







public struct Partie: PartieProtocol{
    public typealias piece = Piece
    public typealias position = Position
    public typealias iteratorpartie = IteratorPartie
    private var quijoue: Int
    var pieceplateau:[Piece]


    //init : -> Partie
    //creation de la partie, une partie est une collection de pieces
    public init(){
        self.quijoue = 1
        self.pieceplateau = [Piece(1, "kitsune", Position("a")),
        Piece(1, "koropokkuru", Position("b")), Piece(1, "tanuki", Position("c")),
        Piece(1, "kodama", Position("e")), Piece(2, "kodama", Position("h")),
        Piece(2, "tanuki", Position("j")), Piece(2, "koropokkuru", Position("k")), Piece(2, "kitsune", Position("l")),
        Piece(1, "kodoma samourai", nil), Piece(2, "kodoma samourai", nil)]
    }

    //partieGagnee : -> (Int | Vide)
    //savoir si la partie est gagnee et par qui
    //Pre : la partie n'est pas gagnee
    //Post : renvoie 1 si la partie est gagnee par le joueur 1; 2 si elle est gagnee par le joueur 2
    //la partie est gagnee si un roi est dans la reserve ou si un roi est dans la zone adverse depuis plus d'un tour
    //Post : renvoie Vide si la partie n'est pas gagnee, sinon 1 ou 2 selon qui a gagnee
    public func partieGagnee() -> Int?{
        var comp1 = 0
        var comp2 = 0
        var it = self.makeIterator()
        while let a = it.next(){
            if a.nomPiece() == "koropokkuru"{
                if a.joueurPiece() == 1{
                    comp1 += 1
                }
                else{
                    comp2 += 1
                }
            }
        }
        if comp1 == 2{
            return 1
        }
        else if comp2 == 2{
            return 2
        }
        else{
            return nil
        }
    }

    //caseEstVide : Position -> Bool
    //précise si une case donnée est occupée ou vide
    //Pré : position existente sur le plateau
    //Post : renvoie True si case vide, False sinon
    public func caseEstVide(_ pos : Position) -> Bool{
        var reponse: Bool = true
        var it = self.makeIterator()
        while let a = it.next(){
            if let b = a.positionPiece(){
                if pos.char == b.char {
                    reponse = false
                }             
            }
        }
        return reponse
    }

    //piecePosition : Position -> (Piece | Vide)
    //fonction qui a une position donnée sur le plateau renvoie la piece correspondante
    //Pre : position sur le plateau du joueur actif
    //Post : renvoie la piece à la position donnée si la piece appartient au joueuractif() sinon Vide si la position n'a pas de piece ou si elle n'appartient pas au joueur actif
    public func piecePosition(_ pos : Position) -> Piece?{
        var it = self.makeIterator()
        while let a = it.next(){
            if a.joueurPiece() == self.joueurActif() {

                if let b = a.positionPiece(){
                    if b.char == pos.char{
                        return a
                    
                    }
                }
            }
        }
        return nil
    }

    //pieceNom : String -> (Piece | Vide)
    //a partir du nom d'une piece dans la reserve renvoie la Piece correspondante
    //Pre : nom d'une piece dans la reserve du joueur actif
    //Post : renvoie la piece avec le nom donné si la piece appartient au joueuractif() sinon Vide si le nom n'a pas de piece dans la reserve ou si elle n'appartient pas au joueur actif
    public func pieceNom(_ nom : String) -> Piece?{
        var it = self.makeIterator()
        while let a = it.next(){
            if a.nomPiece() == nom{
                if a.joueurPiece() == self.joueurActif(){
                    return a
                }
            }
        }
        return nil
    }

    //joueurActif : -> Int
    //au premier tour de jeu c'est le joueur 1 qui commence puis a chaque tour ca s'alterne
    //Pre : la partie n'est pas terminee
    //Post : renvoie 1 ou 2
    public func joueurActif() -> Int{
        return self.quijoue
    }

    //listepiece: ->[Piece]
    //Renvoie la liste des pieces de la partie
    public func listepiece() -> [Piece]{
        return self.pieceplateau
    }

    //changementJoueur : Int -> Int
    //Pre : joueurActif() = 1 ou 2
    //Post : renvoie 1 si le joueur etait 2 et inversement
    public mutating func changementJoueur(_ joueurActif : Int) -> Int{
        let a:Int = 3 - self.quijoue
        self.quijoue = a
        return a
    }

    // makeIterator : Partie -> ItPartie
    // crée un itérateur sur le collection pour itérer avec for in. itère sur les positions de la partie.
    public func makeIterator() -> IteratorPartie{
        return IteratorPartie(self)

    }
}






public struct IteratorPartie: IteratorProtocol{
    fileprivate let par: Partie
    fileprivate var indice: Int



    public init(_ p: Partie){
        self.indice = 0
        self.par = p
    }


    public mutating func next() -> Piece?{
        let a = self.par.listepiece()
        if indice >= a.count{
            return nil
        }
        else{
            let b = a[indice]
            self.indice += 1
            return b
        }
    }
}
