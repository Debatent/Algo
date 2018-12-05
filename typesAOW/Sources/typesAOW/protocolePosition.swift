import Foundation

protocol ProtocolePosition { 
    
    // init: -> Carte | Vide
    // Création d'une position (Front ou Arrière et colonne 1 , 2 ou 3)
    init()
    
    // Initialisé à 1 si Front, 0 sinon
    var front: Bool { get set }  
    // Représente les colonnes du champs de bataille, ne peut prendre que les valeurs 1,2,3
    var colonne : Int { get set }        

    // afficher: -> Carte
    // Retourne la carte placée à une position, ou renvoie vide si il n'y a pas de carte placée à cette position
    // Post: la carte que l'on veut afficher
    func afficher() -> ProtocoleCarte? 

    // estFront: -> Bool
    // Retourne True si la Position est Front, False si elle est Arrière
    // Post: un booléen 1 si Front 0 sinon
    func estFront() -> Bool

    // getColonne: -> Int
    // Retourne la colonne de la position
    // Post: la colonne correspondant à la position (1,2,3)
    func getColonne() -> Int

}