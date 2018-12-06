import Foundation
import ProtocoleCarte

protocol ProtocoleCimetiere {

    // init: -> Cimetiere
    // Création du cimetière (vide)
    init()

    // ajouter: Cimetiere x Carte -> Cimetiere
    // Ajoute une carte au cimetière
    // Pre: Carte qui représente la carte qu'on ajoute au cimetière
    mutating func ajouter(_c: ProtocoleCarte)
}
