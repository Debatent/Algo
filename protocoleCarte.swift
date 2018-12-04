import Foundation

protocol ProtocoleCarte {

    // init : String -> (Carte | Vide)
    // création d'une carte à partir d'un String
    // Pre: String représente le nom de la carte que l'on veut créer :
    // RoiA(attaque: 1, defenseD: 4, defenseO: 4, porteeCac:  [1,1,1], porteeDist: [1,0,0])
    // RoiB(attaque: 1, defenseD: 5, defenseO: 4, porteeCac: [1,1,1], porteeDist: [0,0,0])
    // Soldat(attaque: Main.taille(), defenseD: 2, defenseO: 1, porteeCac: [1,0,0], porteeDist[0,0,0])
    // Garde(attaque: 1, defenseD: 3, defenseO: 2, porteeCac: [1,0,0], porteeDist: [0,0,0])
    // Archer(attaque: 1, defenseD: 2, defenseO: 1, porteeCac:[0,0,1], porteeDist[0,1,0])
    // sinon la création échoue
    init?(c: String)


    //Points d'attaque d'une carte
    var attaque: Int { get set }

    //Points de défense en position verticale d'une carte
    var defenseD: Int { get set }

    //Points de défense en position horizontale d'une carte
    var defenseO: Int { get set }

    //Portée d'attaque au corps à corps d'une carte, taille maxi : 3
    var porteeCac: [Bool] { get set }


    //Portée d'attaque à distance d'une carte,  taille maxi : 3
    var porteeDist: [Bool] { get set }

    //Position de la carte, 0 si verticale, 1 si horizontale (après attaque), 0 par défaut
    var estRetournee: Bool { get set }

    //Affiche le nom de la Carte
    func affichernom()-> String

    //Retourne les dégats qu'à subit une carte pendant 1 tour (est remis à 0 lorsque l'on redresse une carte)
    func degatsCumules() -> Int

    //Retourne la valeur de l'attaque
    func afficheattaque()-> Int

    //Retourne la valeur de la defense en position verticale
    func affichedefenseD()-> Int

    //Retourne la valeur de la defense en position horizontale
    func affichedefenseO()-> Int

    //Mode de la carte, 0 si verticale, 1 si horizontale
    func estRetournee()->Bool

    //Remet la carte en mode vertical (au début du tour), remet à 0 degatsCumules
    mutating func redresser()

    //Met la carte en mode horizontal (après attaque)
    mutating func retourner()


}
