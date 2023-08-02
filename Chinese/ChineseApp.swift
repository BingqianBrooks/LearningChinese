//
//  ChineseApp.swift
//  Chinese
//
//  Created by Bingqian Wang on 6/28/23.
//

import SwiftUI

@main
struct ChineseApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            //ContentView()
            NavigatorView().environmentObject(modelData)
        }
    }
}
