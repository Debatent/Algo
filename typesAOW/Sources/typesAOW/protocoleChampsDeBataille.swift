import Foundation


public protocol ProtocoleChampsDeBataille: Sequence {
    associatedtype ProtocoleCarte 
    associatedtype ProtocolePosition 
    associatedtype ProtocoleRoyaume 
    associatedtype IteratorChampsDeBataille : IteratorProtocol where IteratorChampsDeBataille.Element == ProtocolePosition
    associatedtype CDB2 : ProtocoleChampsDeBataille


    // init: -> ChampsDeBataille
    // Création du champs de bataille avec 6 positions: 3 Fronts et 3 Arrières (vide)
    init()

    // sortir: ChampsDeBataille x Position -> ChampsDeBataille x Carte
    // Supprime une carte du champs de bataille, et retourne la carte en question à partir d'une position
    // Pre: Position qui correspond à la position où est la carte que l'on veut supprimer du champs de bataille
    // Post: la carte que l'on veut supprimer du champs de bataille
    mutating func sortir(_ p: ProtocolePosition) -> ProtocoleCarte

    // poser: ChampsDeBataille x Carte x Position -> ChampsDeBataille
    // Ajoute une carte au champs de bataille à partir d'une position, une carte ne peut être posé à l'arrière à moins
    // qu'il y ait une carte posée au front correspondant, dans le cas échéant, la carte est posée au front. Si une carte est déjà présente à la position où
    // on veut poser la carte, l'ancienne carte est envoyé dans le Royaume, et la nouvelle Carte prend sa place
    // Pre: Carte qui correspond à la carte que l'on veut poser & Position qui correspond à la position à laquelle on veut poser la carte
    mutating func poser(_ c: ProtocoleCarte, _ p: ProtocolePosition, _ r: ProtocoleRoyaume) throws

    // deplacer: ChampsDeBataille x Int -> ChampsDeBataille
    // Déplace la carte présente sur le champs de bataille sur la colonne en parametre de l'arrière au front
    // Renvoie une erreur si la position à l'arrière est vide
    // Pre: 0<=colonne<=3
    mutating func deplacer(_ colonne: Int) throws

    // supprimer: ChampsDeBataille x position -> ChampsDeBataille
    // supprime la carte situé a la position _p1
    mutating func supprimer(_ p1: ProtocolePosition)

    // afficherposition: ChampsDeBataille x Bool x Int -> Position
    //renvoie la position du champs de bataille lié à ces coordonnés
    //Pre: 1<=colonne<=3
    func afficherposition(_ front: Bool, _ colonne: Int)->ProtocolePosition

    // estAportee: ChampsDeBataille x Position x ChampsDeBataille x Position -> Bool
    // à une position donnée et une position ciblée, au champs de bataille adverse, renvoie true si il y'a une carte à portée, false sinon.
    // Pre: Position de départ p1, ChampsDeBataille que l'on veut cibler, Position à attaquer p2
    // Post: true si il y a une carte a portée, false sinon
    func estAportee(_ p1: ProtocolePosition, _ C2: CDB2, _ p2: ProtocolePosition) -> Bool

   // makeIterator : ChampsDeBataille -> ItChampsDeBataille
   // crée un itérateur sur la collection pour la parcourir dans l'ordre croissant des positions du front
    func makeItFront() -> IteratorChampsDeBataille

    // estVide: ChampsDeBataille -> Bool
    // estVide: Renvoie true si le champs de bataille ne possède pas de carte
    func estVide()-> Bool


}
