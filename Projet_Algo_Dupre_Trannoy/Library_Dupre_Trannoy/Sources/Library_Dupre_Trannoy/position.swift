import Foundation

//Type Position(Character?)
//position d'une piece
public protocol PositionProtocol{
	

    //init : -> Position
    //une position est soit un charactere alphabetique correspondant a une case sur le terrain ("a","b","c","d","e","f","g","h","i","j","k","l") (de "a" à "f", c'est le joueur 1 et de de "g" à "l" ,c'est le joueur 2) (avec "a" en bas à gauche et "l" en haut à droite)soit a vide si la piece est dans la reserve
    init(pos : (Character?))

}
