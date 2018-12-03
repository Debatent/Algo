import Foundation

protocol ProtocoleMain : Sequence {
    associatedtype IteratorMain : IteratorProtocol where IteratorMain.Element == ProtocoleCarte

    // init: -> Main
    // Création de la main (vide)
    init()

    // taille: -> Int
    // Retourne le nombre de cartes dans la main
    // Post: le nombre de cartes dans la main
    func taille() -> Int

    // ajouter: Main x Carte 
    // Ajoute une carte à la main
    // Pre: Une Carte
    mutating func ajouter(c: ProtocoleCarte)

    // retirer: Main x String
    // Retire une carte de la main
    // Pre: le nom de la carte que l'on veut retirer
    // Post: la carte que l'on veut retirer
    mutating func retirer(c: String) -> ProtocoleCarte

    // afficher: -> String
    // Affiche la première carte présente dans la main
    // Post: le nom de la carte
    func afficher() -> String    //à définir

   // makeIterator : Main -> ItMain
   // crée un itérateur sur le collection pour itérer avec for in. L'itération se fait dans l'ordre de tirage des cartes    
    func makeIterator() -> IteratorMain
}