//
//  FavriateButton.swift
//  Chinese
//
//  Created by Bingqian Wang on 7/18/23.
//

import SwiftUI

struct FavriateButton: View {
    @Binding var isFavSet: Bool
    
    var body: some View {
        Button {
            isFavSet.toggle()
        } label: {
            Label("Show Favriate", systemImage: isFavSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isFavSet ? .yellow : .gray)
        }
    }
}

struct FavriateButton_Previews: PreviewProvider {
    static var previews: some View {
        FavriateButton(isFavSet: .constant(true))
    }
}
