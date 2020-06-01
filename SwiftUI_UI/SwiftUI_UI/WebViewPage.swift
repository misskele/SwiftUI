//
//  WebViewPage.swift
//  SwiftUI_UI
//
//  Created by ng on 2020/6/1.
//  Copyright © 2020 ngarihealth. All rights reserved.
//

import SwiftUI
import WebKit

struct WebViewPage: UIViewRepresentable {

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let req = URLRequest(url: URL(string: "https://cn.bing.com/")!)
        uiView.load(req)
    }
}

struct WebViewPage_Previews: PreviewProvider {
    static var previews: some View {
        WebViewPage()
    }
}
