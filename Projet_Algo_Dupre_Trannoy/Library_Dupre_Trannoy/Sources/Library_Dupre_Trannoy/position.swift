import Foundation

//Type Position(Character?)
//position d'une piece
public protocol PositionProtocol{
	

    //init : -> Position
    //une position est soit un charactere alphabetique correspondant a une case sur le terrain soit a vide si la piece est dans la reserve
    init(pos : (Character?))

}
