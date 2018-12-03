import Foundation

protocol ProtocoleChampsDeBataille: Sequence {
    associatedtype IteratorChampsDeBatailleFront : IteratorProtocol where IteratorChampsDeBatailleFront.Element == ProtocolePosition 
    associatedtype IteratorChampsDeBatailleArriere : IteratorProtocol where IteratorChampsDeBatailleArriere.Element == ProtocolePosition 

    // Une position du champs de bataille
    var position: [ProtocolePosition] { get set } 

    // init: -> ChampsDeBataille
    // Création du champs de bataille avec 6 positions: 3 Fronts et 3 Arrières (vide)
    init()

    // sortir: ChampsDeBataille x Position
    // Supprime une carte du champs de bataille, et retourne la carte en question à partir d'une position
    // Pre: Position qui correspond à la position où est la carte que l'on veut supprimer du champs de bataille
    // Post: la carte que l'on veut supprimer du champs de bataille
    mutating func sortir(p: ProtocolePosition) -> ProtocoleCarte

    // poser: ChampsDeBataille x Carte x Position
    // Ajoute une carte au champs de bataille à partir d'une position, une carte ne peut être posé à l'arrière à moins 
    // qu'il y ait une carte posée au front correspondant, dans le cas échéant, la carte est posée au front. Si une carte est déjà présente à la position où
    // 
    // Pre: Carte qui correspond à la carte que l'on veut poser & Position qui correspond à la position à laquelle on veut poser la carte
    mutating func poser(c: ProtocoleCarte, p: ProtocolePosition) throws

    // deplacer: ChampsDeBataille x Position x Position
    // Déplace une carte présente sur le champs de bataille d'une position à une autre
    // Pre: Position de départ p1 correspondant à la position où la carte est placée &  position de fin p2 correspondant à la position où l'on veut placer la carte
    mutating func deplacer(p1: ProtocolePosition, p2: ProtocolePosition)

    // getCarte: -> Bool
    // Regarde si il y a une carte à cette position
    // Post: true si il y a une carte, false sinon
    func checkCarte() -> Bool


   // makeIterator : ChampsDeBataille -> ItFront
   // crée un itérateur sur la collection pour la parcourir dans l'ordre croissant des positions du front  
    func makeItFront() -> IteratorChampsDeBatailleFront

   // makeItArriere : ChampsDeBataille -> ItArriere
   // crée un itérateur sur la collection pour la parcourir dans l'ordre croissant des positions de l'arrière
    func makeItArriere() -> IteratorChampsDeBatailleArriere



}