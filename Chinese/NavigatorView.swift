//
//  LessonView.swift
//  Chinese
//
//  Created by Bingqian Wang on 7/3/23.
//

import SwiftUI

struct NavigatorView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = true
    
    var filteredGrades: [ChineseWords] {
        modelData.chineseWords.filter { grade in
                (!showFavoritesOnly || grade.isFavorite)
            }
        }
    var body: some View {
        NavigationView{
            List{
                Toggle(isOn: $showFavoritesOnly){
                    Text("Favorites Grade Only")
                }
                ForEach(filteredGrades) { grade in
                    NavigationLink{
                        GradeDetails(gradeIdx: grade.id)
                    } label: {
                        GradeRow(chineseWord: grade)
                    }
                }
            }.navigationTitle("请选择年级")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct NavigatorView_Previews: PreviewProvider {
    static var previews: some View {
        NavigatorView().environmentObject(ModelData())
    }
}
