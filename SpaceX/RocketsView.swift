//
//  SpaceXView.swift
//  SpaceX
//
//  Created by Johnnie Walker on 10/8/20.
//  Copyright © 2020 Johnnie Walker. All rights reserved.
//

import SwiftUI

struct RocketsView: View {
	let rockets: [Rocket]
	
    var body: some View {
        Form {
            ForEach(rockets) { rocket in
                NavigationLink(destination: DetailView(rocket: rocket)) {

                    Row(image: rocket.logoImage,
                        title: rocket.name,
                        subtitle1: rocket.date?.formatted ?? "N/A",
                        subtitle2: rocket.success?.formatted ?? "N/A")
                }
            }
        }
        .navigationBarTitle("Rockets")
    }
}

struct RocketsView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
            RocketsView(rockets: TestData.rockets)
		}
	}
}
