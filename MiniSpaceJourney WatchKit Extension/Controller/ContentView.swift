//
//  ContentView.swift
//  MiniSpaceJourney WatchKit Extension
//
//  Created by 정한라 on 2022-02-12.
//  Copyright © 2022 Daniil Popov. All rights reserved.
//

import SwiftUI
import WebKit

struct GifImage: UIViewRepresentable {
    private let name: String
    
    init(_ name: String) {
        self.name = name
    }
    func makeUIView(context: Context) -> WKWebVeiw {
        let webView = WKWebView()
        let url = Bundle.main.url(forResource: String?, withExtension: "gif")
        let data = try! Data(contentsOf: url)
        webView.load(
        data,
        mimeType:"image/gif",
        characterEncodingName: "UTF-8",
        baseURL: url?.deletingLastPathComponent()
        )
        return webView
    }
}
