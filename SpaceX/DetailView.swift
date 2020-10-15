//
//  DetailView.swift
//  SpaceX
//
//  Created by Johnnie Walker on 10/8/20.
//  Copyright © 2020 Johnnie Walker. All rights reserved.
//

import SwiftUI

// MARK: - DetailView
struct DetailView: View {
    let rocket: Rocket
    
    var time: String { rocket.anotherDate?.formatted ?? "N/A" }
    
    var body: some View {
        List {
            Header(rocket: rocket)
                .frame(maxWidth: .infinity)
            Row(image: #imageLiteral(resourceName: "Payload"),
                title: "Payload Deployment",
                subtitle1: "Time: " + "\(time)",
                subtitle2: "Payloads: N/A")
            Row(image: #imageLiteral(resourceName: "Cutoff"),
                title: "Launchpad",
                subtitle1: "Location: " + "N/A",
                subtitle2: "Region: " + "N/A")
            Row(image: #imageLiteral(resourceName: "Liftoff"),
                title: "Liftoff",
                subtitle1: "Time: " + "\(time)",
                subtitle2: "Rocket: N/A")
            Row(image: #imageLiteral(resourceName: "Loading"),
                title: "Propellant Loading",
                subtitle1: "Time: " + "\(time)",
                subtitle2: "Location: N/A")
        }
        .navigationBarTitle("Details")
    }
}

// MARK: - Header
struct Header: View {
    let rocket: Rocket
    
    var body: some View {
        VStack(spacing: 24.0) {
            Image(uiImage: rocket.logoImage ?? UIImage())
                .resizable()
                .frame(width: 128.0, height: 128.0)
            VStack(spacing: 8.0) {
                Text(rocket.name)
                    .font(.largeTitle)
                    .bold()
                Group {
                    Text(rocket.date?.formatted ?? "N/A")
                    Text(rocket.success?.formatted ?? "N/A")
                }
                .foregroundColor(.gray)
                .font(.subheadline)
            }
        }
        .padding(.top, 32.0)
        .padding(.bottom, 40.0)
    }
}

// MARK: - Previews
struct LaunchDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                DetailView(rocket: TestData.rockets[0])
            }
            Header(rocket: TestData.rockets[0])
                .padding()
                .previewLayout(.sizeThatFits)
        }
    }
}
