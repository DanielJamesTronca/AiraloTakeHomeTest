//
//  PackageCardView.swift
//  AiraloTest
//
//  Created by TRONCA DANIEL JAMES on 18/06/24.
//

import SwiftUI

struct PackageCardView: View {
    
    var package: Package
    
    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            
            VStack(alignment: .leading, spacing: App.Margin.large) {
                
                headerView
                
                Group {
                    Divider()
                    
                    makeInformationalRow(title: "Data", image: "arrow.up", value: package.data)
                    
                    Divider()
                    
                    makeInformationalRow(title: "Validity", image: "arrow.up", value: package.validity)
                    
                    Divider()
                }
            }
            
            Button(action: {}, label: {
                Text("Buy now")
                    .frame(maxWidth: .infinity, alignment: .center)
            })
            .buttonStyle(.ghost)
            .padding(App.Margin.extraLarge )
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.red, Color.yellow]),
                startPoint: .top,
                endPoint: .bottom
            )
            .clipShape(.rect(cornerRadius: 10))
        )
    }
    
    private var headerView: some View {
        HStack(alignment: .bottom, spacing: .zero) {
            VStack(alignment: .leading, spacing: .zero) {
                Text(package.packageOperator.title)
                    .font(.title3)
                Text(package.title)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            AsyncImage(url: package.imageUrl) { image in
                image.resizable().scaledToFit().clipShape(.rect(cornerRadius: 10))
            } placeholder: {
                EmptyView()
            }
            .frame(width: 140, height: 88)
        }
        .offset(y: -15)
        .padding(.horizontal)
    }
    
    private func makeInformationalRow(title: String, image: String, value: String) -> some View {
        HStack(alignment: .center, spacing: .zero) {
            Label(title, systemImage: image)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(value)
                .font(.headline)
        }
        .padding(.horizontal)
    }
}
