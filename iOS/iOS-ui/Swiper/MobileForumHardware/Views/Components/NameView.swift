//
//  NameView.swift
//  MobileForumHardware
//
//  Created by Armand Kamffer on 2020/05/04.
//  Copyright © 2020 Armand Kamffer. All rights reserved.
//

import SwiftUI

struct NameView: View {
    let name: String
    let age: Int
    let gender: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Text("\(name), \(age)")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            Text(gender)
                .font(.system(size: 16))
                .fontWeight(.regular)
                .foregroundColor(.white)
        }
        .padding()
    }
}

struct NameView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NameView(name: "Piet Pompies", age: 20, gender: "Male")
                .environment(\.colorScheme, .light)
                .previewDisplayName("Light mode")
                .padding()
            
            NameView(name: "Piet Pompies", age: 20, gender: "Male")
                .environment(\.colorScheme, .dark)
                .previewDisplayName("Dark mode")
                .padding()
                .background(Color.black)
        }.previewLayout(.sizeThatFits)
    }
}
