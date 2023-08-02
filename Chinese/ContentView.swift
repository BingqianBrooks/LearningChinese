//
//  ContentView.swift
//  Chinese
//
//  Created by Bingqian Wang on 6/28/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack() {
            Image("一pic")

            VStack(alignment: .leading) {
                Text("一")
                    .font(.largeTitle)
                Text("  ")
                HStack {
                    Text("Grade 1")
                        .font(.subheadline)
                        .foregroundColor(.primary)
                    Spacer()
                    Text("Lesson 1")
                        .font(.subheadline)
                        .foregroundColor(.black)
                }
                Divider()
                Text("   ")
                Text("Phrases:")
                    .font(.headline)
                Text("Phrases go here:")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
