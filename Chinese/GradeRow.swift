//
//  GradeRow.swift
//  Chinese
//
//  Created by Bingqian Wang on 7/3/23.
//

import SwiftUI

struct GradeRow: View {
    var chineseWord: ChineseWords
    var body: some View {
        HStack{
            Text(chineseWord.grade)
            Spacer()
            if chineseWord.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
        
    }
}

struct GradeRow_Previews: PreviewProvider {
    static var chineseWords = ModelData().chineseWords
    static var previews: some View {
        GradeRow(chineseWord: chineseWords[0])
    }
}
