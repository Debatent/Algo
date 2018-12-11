import Foundation


public protocol ProtocoleMain : Sequence {
    associatedtype IteratorMain : IteratorProtocol where IteratorMain.Element == ProtocoleCarte

    // init: -> Main
    // Création de la main (vide)
    init()

    // taille: Main -> Int
    // Retourne le nombre de cartes dans la main
    // Post: le nombre de cartes dans la main
    func taille() -> Int

    // ajouter: Main x Carte -> Main
    // Ajoute une carte à la main
    // Pre: Une Carte
    mutating func ajouter(_ c: ProtocoleCarte)

    // retirer: Main x String-> Carte x Main
    // Retire une carte de la main
    // Pre: le nom de la carte que l'on veut retirer
    // Post: la carte que l'on veut retirer
    mutating func retirer(_ c: String) -> ProtocoleCarte

   // makeIterator : Main -> ItMain
   // crée un itérateur sur le collection pour itérer avec for in. L'itération se fait dans l'ordre de tirage des cartes
    func makeIterator() -> IteratorMain
}
