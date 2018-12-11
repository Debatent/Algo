import Foundation


public protocol ProtocolePosition {

    // init: -> Position
    // Création d'une position Vide (Front ou Arrière et colonne 1 , 2 ou 3) True = front False = Arrière
    // col ne peut prendre que les valeurs 1,2 ou 3, et correspond aux colonnes du champs de bataille
    // pre: bool x Int -> Position
    init(_ pos: Bool, _ col: Int)



    // afficher: Position -> Carte
    // Retourne la carte placée à une position, ou renvoie vide si il n'y a pas de carte placée à cette position
    // Post: la carte que l'on veut afficher ou Vide
    func afficher() -> ProtocoleCarte?

    // estFront: Position-> Bool
    // Retourne True si la Position est Front, False si elle est Arrière
    // Post: un booléen 1 si Front 0 sinon
    func estFront() -> Bool

    // getColonne: Position-> Int
    // Retourne la colonne de la position
    // Post: la colonne correspondant à la position (1,2,3)
    func getColonne() -> Int

}
