//main
func inputint(_a: String,_valmin, _valmax)->Int{
    var choix = true
    while choix{
        print (\(_a))
        let b = readLine()
        try? int(a){
            let c = int(a)
            if c >= _valmin && c <= _valmax{
                choix = false
            }
        }
    }
    return c
}

func input_J1_main()->String{
    var choix = true
    while choix{
        print ("Choisissez une carte dans votre main, J1")
        let b = readLine()
        for i in main1{
            if i.afficher == b{
                choix = false
            }
        }
    }
    return b
}

func input_J2_main()->String{
    var choix = true
    while choix{
        print ("Choisissez une carte dans votre main, J2")
        let b = readLine()
        for i in main2{
            if i.afficher == b{
                choix = false
            }
        }
    }
    return b
}


var main1 = ProtocoleMain()
var main2 = ProtocoleMain()
var pioche1 = ProtocolePioche ()
var pioche2 = ProtocolePioche ()
var royaume1 = ProtocoleRoyaume()
var royaume2 = ProtocoleRoyaume()
var champsdebataille1 = ProtocoleChampsDeBataille()
var champsdebataille2 = ProtocoleChampsDeBataille()

var nom: String

var choix:bool = true
while choix {
    var a=input("J1, choisissez le Roi A ou B (tapez A pour le Roi A et B pour le roi B)")
    if a == "A" || a == "a"{
        var roi1 = ProtocoleCarte("ROIA")
        var roi2 = ProtocoleCarte("ROIB")
        main1.ajouter(roi1)
        main2.ajouter(roi2)
        choix = false
    }
    else if a == "B" || a == "b"{
        var roi1 = ProtocoleCarte("ROIB")
        var roi2 = ProtocoleCarte("ROIA")
        main1.ajouter(roi1)
        main2.ajouter(roi2)
        choix = false
    }
    else{
        print("Veuillez tapez A ou B")
    }
}
var c:ProtocoleCarte

for i in 1...3{
    c = pioche1.piocher()
    guard c is Carte else{throw Probleme}
    main1.ajouter(c)
}

for i in 1...3{
    c = pioche2.piocher()
    guard c is Carte else{throw Probleme}
    main2.ajouter(c)
}

c = pioche1.piocher()
guard c is Carte else{throw Probleme}
royaume1.placer(c)

c = pioche2.piocher()
guard c is Carte else{throw Probleme}
royaume2.placer(c)

for i in main1{
    print(i.afficher())
}

a = input_J1_main()
c=main1.retirer(a)

var b = inputint("choisissez une colonne (1 ou 2 ou 3), J1", 1, 3)
var pos=Position(c,true, b)
champsdebataille1.poser(pos)

a = input_J2_main()
c=main2.retirer(a)

b = input("choisissez une colonne (1 ou 2 ou 3), J2", 1, 3)
pos=ProtocolePosition(c,true, b)
champsdebataille2.poser(pos)

var jeu=true
var tourdeJ1=true
var attaque: bool
while jeu{
    attaque = true
    if tourdeJ1{
        let d=pioche1.piocher()
        if var c=d
            main1.ajouter(c)
            for i in champsdebataille1{
                if var carte=i{
                    i.redresser()

                }
            }
            print ("Main de J1")
            for i in main1{
                print(i.afficher)
            }
            for e in champsdebataille1{


            }
            for e in champsdebataille2{

            }


            let action = inputint("0: Ne rien faire, 1: Déployer une unité, 2: Attaquer, J1",0 ,2)

            if action == 1{//Premier choix: deployer une unité
                a = input_J1_main()
                c = main1.retirer(a)

                b = inputint("choisissez une colonne (1 ou 2 ou 3); J1",1,3)

                let col:Int = b

                b = inputint("0: arriere, 1: front; J1",0,1)

                if b==0{
                    let front: Bool = false
                }
                else{
                    let front: Bool = true
                }
                pos=ProtocolePosition(front, col)
                do try champsdebataille1.poser(c,pos){}
                catch{
                    let f=champsdebataille1.retirer(pos)
                    royaume1.placer(f)
                    champsdebataille1.poser(c,pos)
                }
            }
            else if action == 2 {
                while attaque{
                    print ("Champs de bataille de J1")
                    for i in champsdebataille1{
                        if var c = i.afficher{
                            if !c.estRetournee{
                                print (c.affichernom())
                                print ("Est Front:"\i.estfront())
                                print ("Colonne:"i.getColonne())
                            }
                        }
                    }
                    print ("Champs de bataille de J2")
                    for i in champsdebataille2{
                        if var c = i.afficher{
                            print (c.affichernom())
                            print ("Est Front:"\i.estfront())
                            print ("Colonne:"\i.getColonne())
                            print ("A attaqué:"\c.estRetournee())
                        }
                    }
                    b = inputint("choisissez une unité qui va attaquer: colonne (1 ou 2 ou 3) ou tapez 0 pour arreter l'attaque; J1",0,3)
                    if b != 0{
                        col = b
                        b = inputint("0: arriere, 1: front; J1",0,1)
                        if b == 0{
                            front = false
                        }
                        else{
                            front = true
                        }
                        pos1=ProtocolePosition(front, col)
                        b = inputint("choisissez l'unité cible: colonne (1 ou 2 ou 3)",1,3)
                        col = b
                        b = inputint("0: arriere, 1: front",0,1)
                        if b == 0{
                            front = false
                        }
                        else{
                            front = true
                        }
                        
                    }
                }
            }
        }
    }
}