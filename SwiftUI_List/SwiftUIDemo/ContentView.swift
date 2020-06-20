//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by ng on 2020/5/28.
//  Copyright © 2020 ngarihealth. All rights reserved.
//https://www.jianshu.com/p/2713f904a405

import SwiftUI

struct Person {
    let name : String
    let heigh : Int
}
struct ContentView: View {
    //state 关键字
    //当 State 更新的时候，view将重新校验UI，并且更新自身
    //从原理上说，我们只要改变了 view 里面被关键词 @State 修饰的属性，
    //整个 view 的 body 就会被重新渲染。//https://www.jianshu.com/p/aace56356aa7
    @State var dataArr:[Person] = [Person.init(name: "1号", heigh: 170),
                                   Person.init(name: "2号", heigh: 180),
                                   Person.init(name: "3号", heigh: 190)
    ]
    @State var showDetails = true
    
    var body: some View {
        NavigationView{
            //id表示每条数据唯一标识,数据源之间不可重复,不然会覆盖重复显示的
            List(dataArr,id: \.name){ data in
                HStack {
                    Text("姓名:" + data.name)
                    Text("身高:" + String(data.heigh)).foregroundColor(.red)
                }
            }.navigationBarTitle(Text("表格"))
                .navigationBarItems(
                    leading: Button(action: {self.showDetails.toggle()}, label:{Text(self.showDetails ? "Hide" : "show")}),
                    trailing: Button(
                        action: addPerson,
                        label: {
                            Text("Add")
                    }
                    )
            )
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
