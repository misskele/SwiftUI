//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by ng on 2020/5/28.
//  Copyright © 2020 ngarihealth. All rights reserved.
//

import SwiftUI

struct Person {
    let name : String
    let heigh : Int
}
struct ContentView: View {
    
    @State var dataArr:[Person] = [Person.init(name: "1号", heigh: 170),
                   Person.init(name: "2号", heigh: 180),
                   Person.init(name: "3号", heigh: 190)
    ]
    
    var body: some View {
        NavigationView{
            //id表示每条数据唯一标识,数据源之间不可重复,不然会覆盖重复显示的
            List(dataArr,id: \.name){ data in
                HStack {
                    Text("姓名:" + data.name)
                    Text("身高:" + String(data.heigh)).foregroundColor(.red)
                }
            }.navigationBarTitle(Text("表格").foregroundColor(.red), displayMode: .inline)
                .navigationBarItems(trailing: Button(action: addPerson, label: {Text("Add")}))
        }
    }
    func addPerson() {
        if let p = dataArr.randomElement() {//获取一个随机元素
            dataArr.append(p)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
