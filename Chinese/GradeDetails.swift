//
//  GradeDetails.swift
//  Chinese
//
//  Created by Bingqian Wang on 7/9/23.
//

import SwiftUI

struct GradeDetails: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesLessonOnly = false
    var gradeIdx: Int
    var filteredLessons: [Lessons] {
        modelData.chineseWords[gradeIdx].lessons.filter{
            lesson in (!showFavoritesLessonOnly || lesson.isLesFavorite)
            }
        }
    
    var body: some View {
        NavigationView{
            List {
                Toggle(isOn: $showFavoritesLessonOnly){
                    Text("Challenging Lesson Only")
                }
                
                ForEach(filteredLessons) { lesson in
                    NavigationLink{
                        LessonDetails(lesson:lesson, gradeIdx: gradeIdx)
                    } label: {
                        LessonRow(lesson: lesson)
                        
                    }
                }
            }.navigationTitle("Lessons")
            .navigationBarTitleDisplayMode(.inline)
                
        }
        
    }
}

struct GradeDetails_Previews: PreviewProvider {
    //static let modelData = ModelData()
    static var chineseWords = ModelData().chineseWords
    static var previews: some View {
        //GradeDetails(chineseWord: chineseWords[0]).environmentObject(ModelData())
        GradeDetails(gradeIdx: 0).environmentObject(ModelData())
    }
}
