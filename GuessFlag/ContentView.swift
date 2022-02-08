//
//  ContentView.swift
//  GuessFlag
//
//  Created by Shreemit on 28/01/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAns = Int.random(in: 0 ... 3)
    @State private var score = 0
	@State private var gameOver = false
	@State private var noOfTriees = 1
    var body: some View {
        ZStack {
            //			LinearGradient(gradient: Gradient(colors: [.blue,.black]), startPoint: .top, endPoint: .bottom)
            RadialGradient(stops:
                [.init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.25),
                 .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.45),
                ],
                center: .top, startRadius: 50, endRadius: 700)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)

                VStack(spacing: 20) {
                    VStack {
                        Text("Tap the correct flag of ")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAns])
                            .font(.largeTitle.weight(.semibold))
                    }

                    ForEach(0 ..< 4) { number in
                        Button {
                            flagTapped(number)
							noOfTriees += 1
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
								.cornerRadius(30)
                                .shadow(radius: 5)
						}
					}
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 30)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                Spacer()
                Spacer()
                Text("Score: \(score)")
                    .font(.largeTitle.bold())
                Spacer()
            }.padding()
        }.alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
		.alert("", isPresented: $gameOver) {
			Button("Reset Game",action: resetGame)
		} message: {
			Text("Final Score \(score)")
		}
    }

    func flagTapped(_ number: Int) {
		if noOfTriees == 8 {
			gameOver = true
		}
		else {
			if number == correctAns { scoreTitle = "Correct"; score += 1 }
			else { scoreTitle = "Incorrect" }
			showingScore = true
		}
    }

    func askQuestion() {
        countries = countries.shuffled()
        correctAns = Int.random(in: 0 ... 2)
    }
	
	func resetGame() {
		askQuestion()
		noOfTriees = 0
		score = 0
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
