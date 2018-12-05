import typesAOW
//main
func inputint(_a: String,_valmin:Int, _valmax:Int)->Int{
    var choix = true
    while choix{
        print (\(_a))
        let b = readLine()
        try? int(b){
            let c = int(b)
            if c >= _valmin && c <= _valmax{
                choix = false
            }
        }
    }
    return c
}

func input_main(main:ProtocoleMain, J:String )->String{
    var choix = true
    while choix{
        print (J)
        print ("Choisissez une carte dans votre main")
        let b = readLine()
        for i in main{
            if i.afficher == b{
                choix = false
            }
        }
    }
    return b
}



func choixposition(carte:ProtocoleCarte, champs:ProtocoleChampsDeBataille, J:String){
    var b: Int
    b = inputint("Choisissez une colonne (1 ou 2 ou 3), " + J,1,3)

    let col:Int = b

    b = inputint("0: arriere, 1: front, ",0,1)

    if b==0{
        let front: Bool = false
    }
    else{
        let front: Bool = true
    }
    let pos = champs.afficherposition(front, col)
    champs.poser(c,pos)
}

func poserfront(carte: ProtocoleCarte, champs:ProtocoleChampsDeBataille, J:String){
    print("La carte sera placée au front")
    let col:Int = inputint("Choisissez une colonne (1 ou 2 ou 3), " + J,1,3)
    let front: Bool = true
    let pos = champs.afficherposition(front, col)
    champs.poser(c,pos)
}

func champsdebattaillevide(royaume: ProtocoleRoyaume, J: String){
    var c: ProtocoleCarte
    let
    if c = royaume2.retirer(){
        print (c.affichernom)
        poserfront(carte = c, champs = champsdebataille2, J = J)

    }
    else{
        print("Royaume vide, " + J)
        a=input_J2_main()
        c=main2.retirer(a)
        poserfront(carte = c, champs = champsdebataille2, J = J)
}







var main1 = ProtocoleMain()
var main2 = ProtocoleMain()
var pioche1 = ProtocolePioche ()
var pioche2 = ProtocolePioche ()
var royaume1 = ProtocoleRoyaume()
var royaume2 = ProtocoleRoyaume()
var champsdebataille1 = ProtocoleChampsDeBataille()
var champsdebataille2 = ProtocoleChampsDeBataille()
var cimetiere1 = ProtocoleCimetiere()
var cimetiere2 = ProtocoleCimetiere()


var a: String
var nom: String
var pos1: ProtocolePosition()
var pos2: ProtocolePosition()
var c:ProtocoleCarte()
var positionaportee: Bool
var b: Int

var choix:Bool = true
while choix {
    print (""J1, choisissez le Roi A ou B (tapez A pour le Roi A et B pour le roi B)"")
    a=readLine()
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

a = input_main(main = main1, J = "J1")
c=main1.retirer(a)
poserfront(carte = c, champs = champsdebataille1, J = "J1")

a = input_main(main = main2, J = "J2")
c=main2.retirer(a)
poserfront(carte = c, champs = champsdebataille2, J = "J2")


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
                if var carte = i.afficher{
                    i.redresser()

                }
            }
            print ("Main de J1")
            for c in main1{
                print(c.affichernom)
            }
            for e in champsdebataille1{


            }
            for e in champsdebataille2{

            }


            let action = inputint("0: Ne rien faire, 1: Déployer une unité, 2: Attaquer, J1",0 ,2)

            if action == 1{//Premier choix: deployer une unité
                a = input_J1_main()
                c = main1.retirer(a)
                pos1 = choixposition(champs = champsdebataille1, J = "J1")
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
                    b = inputint("1: attaquer, 0:pour arreter l'attaque; J1",0,1)
                    if b == 1{

                        pos1 = choixposition(champs = champsdebataille1, J = "J1")
                        for i in champsdebataille2{
                            if c = i.afficher{
                                if champsdebataille1.estAportee(p1 = pos1,C2 = champsdebataille2, p2 = i){
                                    print (c.affichernom())
                                    print ("Est Front:"\i.estfront())
                                    print ("Colonne:"\i.getColonne())
                                    print ("A attaqué:"\c.estRetournee())
                                    ennemivalable.append[i]
                                }
                            }

                        }
                        print("Choisissez la cible de l'attaque")
                        pos2 = choixposition(champs = champsdebataille1, J = "J1")

                        positionaportee = false//Verifie si la coordonné entré par l'utilisateur est une position valide
                        for i in ennemivalable{
                            if i == pos2{
                                positionaportee = true
                            }
                        }
                        if positionaportee{
                            c = pos2.afficher()
                            unite = pos1.afficher()


                            if c.degatsCumules == 0{
                                if c.estRetournee{//unité adverse avait deja attaqué
                                    if unite.afficheattaque >= c.affichedefenseO{
                                        if unite.afficheattaque == c.affichedefenseO{
                                            c=champsdebataille2.retirer(pos2)
                                            royaume1.placer(c)
                                        }
                                        else{
                                            c=champsdebataille2.retirer(pos2)
                                            cimetiere2.ajouter(c)
                                        }
                                        try? champsdebataille2.deplacer(pos2.getColonne())
                                        if c.affichernom == "RoiA" or c.affichernom == "RoiB"{
                                            print("Le Roi est mort")
                                            jeu = false
                                        }
                                        else if champsdebataille2.estVide(){
                                            print("Champs de bataille vide, J2")
                                            if c = royaume2retirer(){
                                                print (c.affichernom)
                                                poserfront(carte = c, champs = champsdebataille2, J = "J2")

                                            }
                                            else{
                                                print("Royaume vide, J2")
                                                a = input_J2_main()
                                                c = main2.retirer(a)
                                                poserfront(carte = c, champs = champsdebataille2, J = "J2")
                                            }
                                        }
                                    }
                                    else {
                                        c.ajoutdegat(unite.attaque)
                                        champsdebataille2.supprimer(pos2)
                                        champsdebataille2.poser(c,pos2)
                                    }
                                }
                                else {//Unité adverse a attaqué
                                    if unite.afficheattaque >= c.affichedefenseD{// si l'unité se fait retirer du champs de bataille
                                        if unite.afficheattaque == c.affichedefenseD{
                                            c=champsdebataille2.retirer(pos2)
                                            c.redresser()
                                            royaume1.placer(c)
                                        }
                                        else{
                                            c=champsdebataille2.retirer(pos2)
                                            cimetiere2.ajouter(c)
                                        }
                                        try? champsdebataille2.deplacer(pos2.getColonne())
                                        if c.affichernom == "RoiA" or c.affichernom == "RoiB"{
                                            print("Le Roi est mort")
                                            jeu = false
                                        }
                                        else if champsdebataille2.estVide(){// conscription
                                            print("Champs de bataille vide, J2")
                                            if c = royaume2retirer(){
                                                print (c.affichernom)
                                                poserfront(carte = c, champs = champsdebataille2, J = "J2")

                                            }
                                            else{
                                                print("Royaume vide, J2")
                                                a=input_J2_main()
                                                c=main2.retirer(a)
                                                poserfront(carte = c, champs = champsdebataille2, J = "J2")
                                            }
                                        }
                                    }
                                    else {//L'unité adverse ne meurt pas
                                        c.ajoutdegat(unite.attaque)
                                        champsdebataille2.supprimer(pos2)
                                        champsdebataille2.poser(c,pos2)
                                    }
                                }
                            }



                            else {//L'unité adverse s'est deja fait attaquer
                                if c.estRetournee{//unité adverse avait deja attaqué
                                    if (unite.afficheattaque + c.degatsCumules) >= c.affichedefenseO{
                                        c=champsdebataille2.retirer(pos2)
                                        cimetiere2.ajouter(c)

                                        try? champsdebataille2.deplacer(pos2.getColonne())//Deplace l'unite a l'arriere sur le front

                                        if c.affichernom == "RoiA" or c.affichernom == "RoiB"{
                                            print("Le Roi est mort")
                                            jeu = false
                                        }
                                        else if champsdebataille2.estVide(){
                                            print("Champs de bataille vide, J2")
                                            if c = royaume2retirer(){
                                                print (c.affichernom)
                                                poserfront(carte = c, champs = champsdebataille2, J = "J2")

                                            }
                                            else{
                                                print("Royaume vide, J2")
                                                a=input_J2_main()
                                                c=main2.retirer(a)
                                                poserfront(carte = c, champs = champsdebataille2, J = "J2")
                                            }
                                        }
                                    }
                                    else {
                                        c.ajoutdegat(unite.attaque)
                                        champsdebataille2.supprimer(pos2)
                                        champsdebataille2.poser(c,pos2)
                                    }
                                }
                                else {//Unité adverse a attaqué

                                    if (unite.afficheattaque + c.degatsCumules) >= c.affichedefenseD{// si l'unité se fait retirer du champs de bataille
                                        c=champsdebataille2.retirer(pos2)
                                        cimetiere2.ajouter(c)

                                        try? champsdebataille2.deplacer(pos2.getColonne())
                                        if c.affichernom == "RoiA" or c.affichernom == "RoiB"{
                                            print("Le Roi est mort")
                                            jeu = false
                                        }
                                        else if champsdebataille2.estVide(){// conscription
                                            print("Champs de bataille vide, J2")
                                            if c = royaume2.retirer(){
                                                print (c.affichernom)
                                                poserfront(carte = c, champs = champsdebataille2, J = "J2")

                                            }
                                            else{
                                                print("Royaume vide, J2")
                                                a=input_J2_main()
                                                c=main2.retirer(a)
                                                poserfront(carte = c, champs = champsdebataille2, J = "J2")
                                            }
                                        }
                                    }
                                    else {//L'unité adverse ne meurt pas
                                        c.ajoutdegat(unite.attaque)
                                        champsdebataille2.supprimer(pos2)
                                        champsdebataille2.poser(c,pos2)
                                    }
                                }
                            }
                            //on dit que cette unité a attaqué
                            unite.retourner()
                            champsdebataille1.supprimer(pos1)
                            champsdebataille1.ajouter(unite,pos1)

                        }
                        b = inputint("0: ne pas placer d'unité dans le royaume, 1: placer une unité",0,1)
                        if main1.taille()>=6 || b == 1{

                        }
                    }
                }
            }
        }
    }
}
