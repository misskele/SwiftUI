//
//  ContentView.swift
//  SwiftUI_TabView+NavigationView
//
//  Created by ng on 2020/6/3.
//  Copyright © 2020 ngarihealth. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var index = 0
    let imgs = ["hot","recommend","search","tag","setting"]
    
    var body: some View {
        TabView (selection: $index){
            //            ForEach (0..<imgs.count){item in
            //                NavigationView{
            //                    Text("navigation\(item)")
            //                    .navigationBarTitle("Title_\(item)")
            //                    }
            //                .tabItem{
            //                    Image(self.imgs[item])
            //                    Text("tabItem\(item)")
            //                }
            //            .tag(item)
            //            }
            NavigationView{
                ZStack{
                    Rectangle().foregroundColor(.red)
                    Text("0")
                    .navigationBarTitle("Title_0")
                }
                
            }
            .tabItem{
                Image("hot")
                Text("tabItem0")
            }
            .tag(0)
            
            NavigationView{
                ZStack{
                    Rectangle().foregroundColor(.orange)
                    Text("1")
                        .navigationBarTitle("Title_1")
                }
            }
            .tabItem{
                Image("recommend")
                Text("tabItem1")
            }
            .tag(1)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
