//
//  ContentView.swift
//  SwiftUI_UI
//
//  Created by ng on 2020/6/1.
//  Copyright © 2020 ngarihealth. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var isShowing = true
    @State var isPresented  = false
    let data = ["狗蛋","马屁"]
    
    var body: some View {
//        Text("Hello, World!")
        NavigationView{
            VStack{
//                Divider()
//                //开关
                Toggle(isOn: $isShowing){
                    Text("开关_Toggle:\(self.isShowing == true ? "开":"关")")
                }.frame(width: 200,height: 50,alignment: .center)
                Divider()
//                //导航跳转
                NavigationLink(destination: WebViewPage()) {
                    Text("导航跳转到另一个界面")
                }
                Divider()
                Button(action: {
//                    self.isPresented = true
                    
                }) {
                    Text("alert")
                }
                .alert(isPresented: $isPresented) { () -> Alert in
                    Alert(title: Text("这是个提示框"), message: Text("提示消息"), dismissButton: .cancel())
                }

                
                Divider()
                //Group  用于集合多个视图，对 Group 设置的属性，将作用于每个子视图。
                Group{
                    Text("group 1")
                    Text("group 2")
                }.foregroundColor(.red)
                Group{
                    Text("group 1")
                    Text("group 2")
                }.foregroundColor(.yellow)
                Group{
                    Text("group 1")
                    Text("group 2")
                }.foregroundColor(.green)
                Divider()
                
//                List {
//                    Section(header: Text("section_headerView_title_0"), footer: Text("footer_view_title_0")) {
//                        ForEach(0..<2) {
//                            Text("list cell \($0)")
//                        }
//                    }
//                    Section(header: Text("section_headerView_title_1"), footer: Text("footer_view_title_1")) {
//                        ForEach(0..<2) {
//                            Text("list cell \($0)")
//                        }
//                    }
//
//                }.listStyle(GroupedListStyle.init())
                
                
            }.navigationBarTitle(Text("基本控件学习"), displayMode: .large)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
