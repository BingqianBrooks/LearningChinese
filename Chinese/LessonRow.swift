//
//  LessonRow.swift
//  Chinese
//
//  Created by Bingqian Wang on 7/18/23.
//

import SwiftUI

struct LessonRow: View {
    var lesson: Lessons
    var body: some View {
        HStack{
            Text(lesson.lesson)
            Spacer()
            if lesson.isLesFavorite {
                Image(systemName: "theatermasks.fill")
                    .foregroundColor(.red)
            }
        }
        
    }
}

struct LessonRow_Previews: PreviewProvider {
    static var chineseWords = ModelData().chineseWords
    static var previews: some View {
        LessonRow(lesson: chineseWords[0].lessons[0])
    }
}
