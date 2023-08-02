//
//  TransView.swift
//  Chinese
//
//  Created by Bowen Kan on 7/31/23.
//

import SwiftUI

struct TransView: View {
    var src: String
    
    var body: some View {
        Text(Translator.translate_request(ctent:src))
    }
}

struct TransView_Previews: PreviewProvider {
    static var previews: some View {
        TransView(src: "测试")
    }
}
