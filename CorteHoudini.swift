print(); print()
print("***Array e FOR para fazer um CORTE HOUDINI***");


//monta o baralho
var indexCards : [String] = []
var deck : [String] = []
let suitTypes : [String] = ["♠", "♥", "♦", "♣"]

for i in 0..<suitTypes.count {
    print (suitTypes[i])
} 


let numSuit = suitTypes.count
print ("-Num. de Naipes \(numSuit)")

print ()
for i  in 2...10 {
    let index = String(i)
    indexCards.append(index)
}
indexCards.insert("A", at: 0)
indexCards.append("J")
indexCards.append("Q")
indexCards.append("K")
 
print (indexCards)
print ("-Num. de Índices \(indexCards.count)")


print ()
for i in suitTypes {
    for j in indexCards {
        deck.append("\(j)\(i)")
    }
}
print (deck)
print ("-Num. de cartas \(deck.count)\n")

//fim monta baralho 


//início de funções 


//Retira uma carta do baralho. 
//Devolve a carta retirada
//Devolve o resto do baralho
func takeAnyCard(deck: [String]) -> (deck: [String], card: String) {
    
    // Gera um índice aleatório (baralho de 52 cartas) entre 0 (primeira carta) e deck.count - 1. ( última carta -> index 51).
    
    var index = Int.random(in: 0...(deck.count - 1))
    
    let card = deck[index]
    var deckAux = deck
    deckAux.remove(at: index)
        
    return (deckAux,card)
}

let exDeckCard = takeAnyCard (deck: deck)
print ("Carta: \(exDeckCard.card)")
print ("Deck: \n\(exDeckCard.deck) ")
print (exDeckCard.deck.count)


//devolve uma pilha com n cartas
//deviolve uma pilha com o resto do braralho
func take_nCards(deck: [String], nCards: Int) -> (pile_nCards: [String], pileRest: [String]) {
    
    var pile_nCards : [String] = []
    var pileRest : [String] = []
    
    if nCards>0 && nCards<deck.count {
        
        pile_nCards = Array(deck[0...nCards-1])
        pileRest = Array(deck[nCards...deck.count-1])
    } else if nCards == 0 {
        pileRest = Array(deck[0...deck.count-1])
    } else if nCards == deck.count {
        pile_nCards = Array(deck[0...deck.count-1])
    }
    
    return (pile_nCards,pileRest)
}

let exDeck_nCards = take_nCards (deck: deck, nCards: 10)

print ("\nPilha nCards: \(exDeck_nCards.pile_nCards)")
print (exDeck_nCards.pile_nCards.count)

print ("\nPilha resto: \(exDeck_nCards.pileRest)")
print (exDeck_nCards.pileRest.count)



func insertOneCardFirstPosition(deck: [String], card: String) -> [String] {
    
    var deckAux = deck
    
    if deck.count < 52 {
        deckAux.insert(card, at: 0)
        
    } 
    
    return (deckAux)
}

func insertOneCardLastPosition(deck: [String], card: String) -> [String] {
    
    var deckAux = deck
    
    if deck.count < 52 {
        deckAux.append(card)
    } 
    
    return (deckAux)
}


//recebe um deck 
//devolver uma pilha as cartas de índice par (Even)
//devolver uma pilha as cartas de índice impar (Odd)

func takeEvenPileAndOddPile(deck: [String]) -> (EvenPile: [String], OddPile: [String]) {
    
    var EvenPile : [String] = []
    var OddPile : [String] = []
    
    
    for i in 0...deck.count-1 {
        //Nesse caso o primerio índice (0) é impar pois seria a primeira carta do baralho
        if (i+1) % 2 == 0 {
            EvenPile.append(deck[i])
        } else {
            OddPile.append(deck[i])
        }
    }
    
    return (EvenPile,OddPile)
}



print("\nSeleciona 3 cartas do baralho")

var selectedCards : [String] = []
for _ in 1 ... 3 {
    let result = takeAnyCard(deck: deck)
    selectedCards.append(result.card)
    deck = result.deck
}



print("\nCartas selecionadas: \(selectedCards)")
print("\nDeck sem as cartas selecionadas: \(deck)")

print("\nMontamos uma pilha com 10 cartas")

var pileA = Array(deck[0...9])
print("\nPilha A - \n\(pileA)")

print("\nMontamos uma pilha com 15 cartas")

var pileB = Array(deck[10...24])
print("\nPilha B - \n\(pileB)")

print("\nMontamos uma pilha com 15 cartas")

var pileC = Array(deck[25...39])
print("\nPilha C - \n\(pileC)")

print("\nMontamos uma pilha com 9 cartas")

var pileD = Array(deck[40...48])
print("\nPilha D - \n\(pileD)")


print("Agora inserimos as 3 cartas escolhidas nas pilhas de 10, 15 e 15, respectivamente.")

pileA = insertOneCardLastPosition(deck: pileA, card: selectedCards[0])
pileB = insertOneCardLastPosition(deck: pileB, card: selectedCards[1])
pileC = insertOneCardLastPosition(deck: pileC, card: selectedCards[2])

print("\nNova Pilha A - \n\(pileA)")
print("\nNova Pilha B - \n\(pileB)")
print("\nNova Pilha C - \n\(pileC)")

print("\nJuntamos as 4 pilhas, na seguinte ordem:\n Pilha de 11 <- Pilha de 16 (segunda) <- Pilha de 16 (primeira) <- Pilha de 9.")

var newDeck : [String] = pileA + pileC + pileB + pileD

print("\nNovo deck - \n\(newDeck)")

print("\nO deck é agora percorrido em ordem reversa.")

newDeck = newDeck.reversed()

print("\nDeck reverso - \n\(newDeck)")

var evenCards : [String] = []
var oddCards : [String] = []
var finalPile : [String] = []

func getEvenPile(deck: [String]) -> [String] {
    var evenPile : [String] = []
    for i in 0...(deck.count-1){
        if (i+1)%2 == 0{
            evenPile.append(deck[i])
        }
    }
    return evenPile
}

func getOddPile(deck: [String]) -> [String] {
    var oddPile : [String] = []
    for i in 0...(deck.count-1){
        if (i+1)%2 == 1{
            oddPile.append(deck[i])
        }
    }
    return oddPile
}

evenCards = getEvenPile(deck: newDeck)

print("\nNova pilha com ímpares descartados = \n\(evenCards)")

evenCards = getEvenPile(deck: evenCards)

print("\nNova pilha com ímpares descartados novamente = \n\(evenCards)")

oddCards = getOddPile(deck: evenCards)

print("\nNova pilha com pares descartados = \n\(oddCards)")

finalPile = getEvenPile(deck: oddCards)

print("\nPilha final com ímpares descartados novamente = \n\(finalPile)")

print("\nCartas selecionadas inicialmente: \n\(selectedCards)")
