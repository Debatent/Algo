import Foundation

//Type Position(Character?)
//position d'une piece
public protocol PositionProtocol{


    //init : -> Position
    //une position est soit un charactere alphabetique correspondant a une case sur le terrain ("a","b","c","d","e","f","g","h","i","j","k","l") (de "a" à "f", c'est le joueur 1 et de de "g" à "l" ,c'est le joueur 2) (avec "a" en bas à gauche et "l" en haut à droite)soit a vide si la piece est dans la reserve
    init(pos : (Character?))

	// getposcharacter: Position -> Character?
	// permet d'obtenir la lettre de cette position
	func getposcharacter()->Character?
}



//Type Position(Character?)
//position d'une piece
public struct Position : PositionProtocol{

    var char: Character?
    var correspondance: [Int]?

    //init : -> Position
    //une position est soit un charactere alphabetique correspondant a une case sur le terrain ("a","b","c","d","e","f","g","h","i","j","k","l") (de "a" à "f", c'est le joueur 1 et de de "g" à "l" ,c'est le joueur 2) (avec "a" en bas à gauche et "l" en haut à droite)soit a vide si la piece est dans la reserve
    init(pos : (Character?)) {
        switch pos {
            case "a":
                self.char = "a"
                self.correspondance = [0,0]
            case "b":
                self.char = "b"
                self.correspondance = [0,1]
            case "c":
                self.char = "c"
                self.correspondance = [0,2]
            case "d":
                self.char = "d"
                self.correspondance = [1,0]
            case "e":
                self.char = "e"
                self.correspondance = [1,1]
            case "f":
                self.char = "f"
                self.correspondance = [1,2]
            case "g":
                self.char = "g"
                self.correspondance = [2,0]
            case "h":
                self.char = "h"
                self.correspondance = [2,1]
            case "i":
                self.char = "i"
                self.correspondance = [2,2]
            case "j":
                self.char = "j"
                self.correspondance = [3,0]
            case "k":
                self.char = "k"
                self.correspondance = [3,1]
            case "l":
                self.char = "l"
                self.correspondance = [3,2]
            case nil:
                self.char = nil
                self.correspondance = nil
            default:
                self.char = nil
                self.correspondance  = nil

        }

	}
	func getposcharacter()->Character?{
		return self.char
	}

}
