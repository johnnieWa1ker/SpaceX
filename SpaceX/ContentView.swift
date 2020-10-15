//
//  ContentView.swift
//  SpaceX
//
//  Created by Johnnie Walker on 10/8/20.
//  Copyright © 2020 Johnnie Walker. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var networkController: NetworkController
    
    var body: some View {
        NavigationView {
            RocketsView(rockets: networkController.rockets)
        }
        .onAppear(perform: networkController.fetchRockets)
    }
}
