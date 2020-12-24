//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Austin Hill on 12/23/20.
//

import SwiftUI



struct ContentView: View {
    
    var moves = ["Rock","Paper","Scissors"]
    @State private var currentMove = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var playerMove = 1
    @State private var playerScore = 0
    @State private var showAlart = false
    
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
  
            VStack(spacing: 20) {
                VStack{
                    Text("Current Score: \(playerScore)")
                    Text("Move: \(playerMove)")
                    Text("Apps Move: \(moves[currentMove])")
                    Text(shouldWin ? "You should win" : "You should lose")
                }
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
                
                ForEach(0 ..< 3){ number in
                    Button(action: {
                        self.buttonTap(number)
                    }) {
                        Text("\(moves[number])")
                            .foregroundColor(.black)
                            .padding()
                            .font(.largeTitle)
                            
                    }.background(Color.red)
                }
                Spacer()
            }
        
        }
        .alert(isPresented: $showAlart) {
            Alert(title: Text("Game Over"), message: Text("Total Score: \(playerScore)"), dismissButton: .default(Text("New Game")){
                newGame()
            })
            
        }
    }
    
     func buttonTap(_ number: Int){
        switch self.currentMove {
        case 0:
            if number == 1 {
                shouldWin ? self.win() : self.lose()
            } else
            if number == 2 {
                shouldWin ? self.lose() : self.win()
            } else {
                self.lose()
            }
        case 1:
            if number == 0 {
                shouldWin ? self.lose() : self.win()
            } else
            if number == 2 {
                shouldWin ? self.win() : self.lose()
            } else {
                self.lose()
            }
        case 2:
            if number == 0
            {
                shouldWin ? self.win() : self.lose()
            } else
            if number  == 1
            {
                shouldWin ? self.lose() : self.win()
            } else {
                self.lose()
            }
        default:
            Text("This is not possible")
          
        
        }
        playerMove += 1
        self.randomizeMove()
        if playerMove > 10 {
            showAlart.toggle()
        }
    }
    
    func win(){
        playerScore += 1
    }
    
    func lose(){
        playerScore -= 1
    }
    
    func randomizeMove() {
        currentMove = Int.random(in: 0...2)
        shouldWin = Bool.random()
        
    }
        
    func newGame() {
            playerMove = 1
            playerScore = 0
            randomizeMove()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
