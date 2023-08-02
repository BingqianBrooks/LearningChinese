//
//  LessonDetails.swift
//  Chinese
//
//  Created by Bingqian Wang on 7/13/23.
//

import SwiftUI
import Foundation

struct LessonDetails: View {
    @EnvironmentObject var modelData: ModelData
    static var chineseWords = ModelData().chineseWords
    var lesson: Lessons
    var gradeIdx: Int
    var lessonIndex : Int{
        modelData.chineseWords[gradeIdx].lessons.firstIndex(where: { $0.id == lesson.id })!
    }
    //var ob = Translator()
    var body: some View {
        VStack {
            HStack{
                Text(modelData.chineseWords[gradeIdx].lessons[lessonIndex].lesson)
                    .font(.title2)
                VocabButton(isSet: $modelData.chineseWords[gradeIdx].lessons[lessonIndex].isLesFavorite)
            }
            Divider()
            VStack(alignment: .leading){
                Text("字:")
                    .font(.title)
                NavigationView{
                    List{
                        ForEach(modelData.chineseWords[gradeIdx].lessons[lessonIndex].word.components(separatedBy: " "), id: \.self) { word in
                                NavigationLink{
                                    Text(word).font(.title3)
                                } label: {
                                    Text(word).font(.title3)
                                }
                        }
                    }
                }
                Divider()
                Text("词:")
                    .font(.title)
                NavigationView{
                    List{
                        ForEach(modelData.chineseWords[gradeIdx].lessons[lessonIndex].phrases.components(separatedBy: " "), id: \.self) { phrase in
                            NavigationLink{
                                Text(phrase).font(.title3)
                                TransView(src: phrase)
                            } label: {
                                Text(phrase).font(.title3)
                            }
                        }
                    }
                }
            }
            Spacer()
        }
        .padding()
    }
}

struct LessonDetails_Previews: PreviewProvider {
    static let modelData = ModelData()
    //static let transModel = ModelTrans()
    static var chineseWords = ModelData().chineseWords
    static var previews: some View {
        LessonDetails(lesson: chineseWords[3].lessons[0], gradeIdx: 0).environmentObject(modelData)
    }
}
