import Foundation
import ProtocoleCarte

protocol ProtocolePioche {

    // init: -> Pioche
    // Création de la pioche composée de 9 soldats, 6 gardes, 5 archers déposés aléatoirement
    init() 

    // piocher: -> Carte | Vide
    // Retourne une carte 
    // Post: la carte que l'on pioche
    func piocher() -> ProtocoleCarte?

    // getnbCartes: -> Int
    // Renvoie le nombre de cartes présentes dans la pioche
    // Post: le nombre de cartes dans la pioche
    func getnbCartes() -> Int

}
