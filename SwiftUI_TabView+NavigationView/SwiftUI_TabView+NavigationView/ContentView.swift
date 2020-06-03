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
    var body: some View {
//        Text("Hello, World!")
        TabView (selection: $index){
            Text("tabBar")
                .tabItem {
                    Text("Bar0")
            }
            Text("tabBar")
                .tabItem {
                    Text("Bar1")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
