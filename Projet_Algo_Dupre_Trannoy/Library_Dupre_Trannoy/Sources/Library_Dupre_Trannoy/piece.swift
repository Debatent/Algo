import Foundation

//Type Piece(joueur, nom, Position)
//chaque piece est associee a son joueur, son nom et sa position
public protocol PieceProtocol{
    associatedtype Position : PositionProtocol
    
    //init : -> Piece
    //creation des pieces, initialisees avec le joueur auquel il appartient, le nom et la position de la piece
    init(joueur : Int, nom : String, pos : Position)
        
    //joueurPiece : Piece -> Int
    //retourne le joueur auquel la piece appartient
    //Pre : piece existante
    //Post : retourne le joueur soit 1, soit 2
    func joueurPiece() -> Int

    //nomPiece : Piece -> String
    //retourne le nom d'une piece 
    //Pre : piece existante
    //Post : retourne soit koropokkuru, kitsune, tanuki, kodama ou kodama samourai
    func nomPiece() -> String

    //positionPiece : Piece -> ( Position | Vide )
    //retourne la positon d'une piece 
    //Pre : piece existante
    //Post : retourne vide si la piece est dans la reserve, un charactere correspondant a sa position sinon
    func positionPiece() -> Position?

    //deplacementPossible : Piece x Position -> Bool
    //precise si le deplacement d'une piece a une position est possible par rapport a son nom
    //elle peut se deplacer que d'un case par tour
    //il ne faut pas que se soit hors des limites du plateau, sur la case d'une piece alliee ou un deplacement non permis par la piece
    //en prenant comme repere les points cardinaux, les mouvements autorises pour chaque piece sont les suivants
    //koropokkuru : dans les huits directions
    //kitsune : Nord-Ouest, Nord-Est, Sud-Est, Sud-Ouest
    //tanuki : Nord, Sud, Est, Ouest
    //kodama : Nord
    //kodama samurai : Ouest, Nord-Ouest, Nord, Nord-Est, Est, Sud
    //Pre : piece existante et position existante sur le plateau
    //Post : retourne True si deplacement possible, False sinon
    func deplacementPossible(position : Position) -> Bool

    //deplacer : Piece x Position -> Piece
    //déplace la pièce à la position donnée
    //si la case est occupée par un ennemi, faire capturer de la piece de l'ennemi
    //Pré : déplacementPossible(Piece,Position)=True
    //Post : Renvoi la piece avec sa nouvelle position
    mutating func deplacer(position : Position)
        
    //capturer : Piece -> Piece
    //changement de proprietaire et modifier la position de la piece à vide
    //Pré : Piece existente sur le plateau
    //Post : Position(piece) -> Vide
    //si "kodama samourai" capturé, il redevient "kodama" 
    mutating func capturer()

    //parachuter : Piece x Position -> Piece
    //place une piece de la réserve sur le plateau
    //Pré : piece existente et dans la réserve et position sur le plateau
    //Post : piece existente sur plateau
    mutating func parachuter(position : Position)

    //estDansZoneAdverse : Piece -> Bool
    //savoir si une piece est dans la zone adverse, les 3 cases les plus eloignes de chaque joueurs
    //Pré : piece existente sur plateau
    //Post : True si la piece est dans la zone adverse, False sinon
    func estDansZoneAdverse() -> Bool

    //transformation : Piece -> Piece
    //transforme un kodama en kodama samouraï
    //pré: nom(piece)="kodama" et position(piece)!=Vide
    //Post: nom(piece)=kodama samouraï
    mutating func transformation()

}


//Type Piece(joueur, nom, Position)
//chaque piece est associee a son joueur, son nom et sa position
public struct Piece {
    associatedtype Position : Position
    associatedtype Partie : Partie

    var joueur : Int
    var nom : String
    var pos : Position

    
    //init : -> Piece
    //creation des pieces, initialisees avec le joueur auquel il appartient, le nom et la position de la piece
    public init(_ joueur : Int, _ nom : String, _ pos : Position?) {     
        self.joueur = joueur
        self.nom = nom
        self.pos = pos  
    }
        
    //joueurPiece : Piece -> Int
    //retourne le joueur auquel la piece appartient
    //Pre : piece existante
    //Post : retourne le joueur soit 1, soit 2
    public func joueurPiece() -> Int {
        return self.joueur
    }

    //nomPiece : Piece -> String
    //retourne le nom d'une piece 
    //Pre : piece existante
    //Post : retourne soit koropokkuru, kitsune, tanuki, kodama ou kodama samourai
    func nomPiece() -> String {
        return self.nom
    }

    //positionPiece : Piece -> ( Position | Vide )
    //retourne la positon d'une piece 
    //Pre : piece existante
    //Post : retourne vide si la piece est dans la reserve, un charactere correspondant a sa position sinon
    func positionPiece() -> Position? {
        for char in ("abcdefghijkl") {
            if char == Character(self.pos.char){
                return self.pos.char
            } else {
                return nil
            }
        }
    }

    //deplacementPossible : Piece x Position -> Bool
    //precise si le deplacement d'une piece a une position est possible par rapport a son nom
    //elle peut se deplacer que d'un case par tour
    //il ne faut pas que se soit hors des limites du plateau, sur la case d'une piece alliee ou un deplacement non permis par la piece
    //en prenant comme repere les points cardinaux, les mouvements autorises pour chaque piece sont les suivants
    //koropokkuru : dans les huits directions
    //kitsune : Nord-Ouest, Nord-Est, Sud-Est, Sud-Ouest
    //tanuki : Nord, Sud, Est, Ouest
    //kodama : Nord
    //kodama samurai : Ouest, Nord-Ouest, Nord, Nord-Est, Est, Sud
    //Pre : piece existante et position existante sur le plateau
    //Post : retourne True si deplacement possible, False sinon
    func deplacementPossible(_ position : Position) -> Bool {

    }

    //deplacer : Piece x Position -> Piece
    //déplace la pièce à la position donnée
    //si la case est occupée par un ennemi, faire capturer de la piece de l'ennemi
    //Pré : déplacementPossible(Piece,Position)=True
    //Post : Renvoi la piece avec sa nouvelle position
    mutating func deplacer(position : Position) {
        if (deplacementPossible(position) && !(Partie.piecePosition(position))) {
            self.pos.char = position.char
            self.pos.correspondance = position.correspondance

        } else if (deplacementPossible(position)) {
            Partie.piecePosition(position).capturer()            
        }
    }
        
    //capturer : Piece -> Piece
    //changement de proprietaire et modifier la position de la piece à vide
    //Pré : Piece existente sur le plateau
    //Post : Position(piece) -> Vide
    //si "kodama samourai" capturé, il redevient "kodama" 
    mutating func capturer() {
        self.pos.char = nil
        self.pos.correspondance = nil
        self.joueur = Partie.joueurActif()
        if (self.nom == "kodama samourai") {   
            self.nom = "kodama"                 
        }        
    }

    //parachuter : Piece x Position -> Piece
    //place une piece de la réserve sur le plateau
    //Pré : piece existente et dans la réserve et position sur le plateau
    //Post : piece existente sur plateau
    mutating func parachuter(position : Position)

    //estDansZoneAdverse : Piece -> Bool
    //savoir si une piece est dans la zone adverse, les 3 cases les plus eloignes de chaque joueurs
    //Pré : piece existente sur plateau
    //Post : True si la piece est dans la zone adverse, False sinon
    func estDansZoneAdverse() -> Bool

    //transformation : Piece -> Piece
    //transforme un kodama en kodama samouraï
    //pré: nom(piece)="kodama" et position(piece)!=Vide
    //Post: nom(piece)=kodama samouraï
    mutating func transformation()

}

