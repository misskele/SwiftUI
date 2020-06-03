//
//  ContentView.swift
//  Swift_UI_TabView
//
//  Created by ng on 2020/6/3.
//  Copyright © 2020 ngarihealth. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var index = 0
    let imgs = ["hot","recommend","search","tag","setting"]

    var body: some View {
        TabView(selection: $index) {
            ForEach(0..<imgs.count) {item in
                contentView(index: item)
                .tabItem {
                    Image(self.imgs[item])
                    Text("\(item)")
                }
            .tag(item)
            }
        }
    }
}

struct contentView :View {
    var index : Int

    var body: some View{
        ZStack{
            Rectangle().foregroundColor(.orange)
            VStack{
                Text("\(index)")
                    .foregroundColor(.white)
                    .font(.system(size: 100, design: .rounded))
                    .bold()
                Image("icon")
                    .resizable()
                    .frame(width: 200, height: 200)
            }
        }
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
