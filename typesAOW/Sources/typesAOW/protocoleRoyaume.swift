import Foundation
import ProtocoleCarte

protocol ProtocoleRoyaume {

    // init: -> Royaume
    // Création du Royaume (vide)
    init()

    // voirSuivant: Royaume-> (Carte | Vide)
    // Renvoie la prochaine carte que l'on va tirer ou rien si le royaume est vide
    // Post: la première carte disponible dans le royaume
    func voirSuivant() -> ProtocoleCarte?

    // placer: Royaume x Carte -> Royaume
    // Place une carte dans le royaume
    // Pre: la carte que l'on veut placer dans le royaume
    mutating func placer(_c: ProtocoleCarte)

    //retirer: Royaume-> (Carte | Vide)
    // Retire une carte du royaume, ne renvoie rien si le royaume est vide
    // Post: la carte que l'on veut retirer du royaume
    mutating func retirer() -> ProtocoleCarte?

    // getnbSoldats: Royaume-> Int
    // Renvoie le nombre de soldats présents dans le royaume
    // Post: le nombre de soldats dans le royaume
    func getnbSoldats() -> Int

    // getnbArchers: Royaume-> Int
    // Renvoie le nombre d'archers présents dans le royaume
    // Post: le nombre d'archers dans le royaume
    func getnbArchers() -> Int

    // getnbGardes:Royaume -> Int
    // Renvoie le nombre de gardes présents dans le royaume
    // Post: le nombre de gardes dans le royaume
    func getnbGardes() -> Int

    // getnbCartes: Royaume-> Int
    // Renvoie le nombre de cartes dans le royaume
    // Post: le nombre de cartes dans le royaume
    func getnbCartes() -> Int

}
