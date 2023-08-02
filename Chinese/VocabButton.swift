//
//  VocabButton.swift
//  Chinese
//
//  Created by Bingqian Wang on 7/15/23.
//

import SwiftUI

struct VocabButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Show Challenging", systemImage: isSet ? "theatermasks.fill" : "theatermasks")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .red : .gray)
        }
    }
}

struct VocabButton_Previews: PreviewProvider {
    static var previews: some View {
        VocabButton(isSet: .constant(true))
    }
}
