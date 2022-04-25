//
//  ContentView.swift
//  Shared
//
//  Created by Jardel Urban on 19/04/22.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["✈️", "🚀", "🛸", "🛰", "🚁", "🛩", "🛶", "⛵️", "🚤", "🛥", "🏎", "🏍", "🚂", "🚃"]
    @State var emojiCount = 3
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
        .foregroundColor(Color.orange)
    }
    
    var remove: some View {
        Button {
            if emojiCount > 1 { emojiCount -= 1 }
        } label: {
            Image(systemName: "minus.square.fill")
        }
    }
    
    var add: some View {
        Button {
            if emojiCount < emojis.count { emojiCount += 1 }
        } label: {
            Image(systemName: "plus.square.fill")
        }
    }
    
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = false

    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20)
        ZStack {
            if (isFaceUp) {
                shape.fill(Color.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(Font.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.portraitUpsideDown)
        ContentView()
            .preferredColorScheme(.light)
    }
}
