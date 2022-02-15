//
//  SettingsMenuController.swift
//  MiniSpaceJourney Extension
//
//  Created by Daniil Popov on 6/18/19.
//  Copyright © 2019 Daniil Popov. All rights reserved.
//

import WatchKit
import UIKit
import SwiftUI


class SettingsMenuController: WKInterfaceController {
    @State var showFull : Bool = false
    @State var testFull : Bool = false
    @State var showHappy : Bool = false
    @State var testHappy : Bool = false
        
    var body: some View {
        Button(action: {
            self.testFull.toggle()
            self.showFull = true
        }) {
            Text("Feed Me🍽")
        }
        .sheet(isPresented: self.$showFull) {
            FullView(testVar: self.$testFull)
        }
        Button(action: {
            self.testHappy.toggle()
            self.showHappy = true
        }) {
            Text("Play with Me⚽️")
        }
        .sheet(isPresented: self.$showHappy) {
            HappyView(testVar: self.$testHappy)
        }
    }
    
}
struct FullView: View {
    @Binding var testFull: Bool
        
    var body: some View {
        if self.testFull {
            Text("True")
        } else {
            Text("False")
        }
    }
}

struct Happyview: View {
    @Binding var testHappy: Bool
        
    var body: some View {
        if self.testHappy {
            Text("True")
        } else {
            Text("False")
        }
    }
}

