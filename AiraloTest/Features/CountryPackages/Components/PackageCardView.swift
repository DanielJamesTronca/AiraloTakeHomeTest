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
                
                Divider()
                
                makeInformationalRow(
                    title: App.Localization.dataInformative,
                    image: "arrow.up",
                    value: package.data
                )
                
                Divider()
                
                makeInformationalRow(
                    title: App.Localization.validityInformative,
                    image: "calendar",
                    value: package.validity
                )
                
                Divider()
                
            }
            
            buyNowButton
        }
        .background(backgroundGradient.clipShape(.rect(cornerRadius: 10)))
        .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 10)
    }
    
    private var headerView: some View {
        HStack(alignment: .bottom, spacing: .zero) {
            VStack(alignment: .leading, spacing: .zero) {
                Text(package.packageOperator.title)
                    .lineLimit(1)
                    .font(.title3)
                Text(package.title)
                    .lineLimit(1)
                    .font(.subheadline)
            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            AsyncImage(url: package.imageUrl) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .clipShape(.rect(cornerRadius: 10))
                    .accessibilityHidden(true)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 140, height: 88)
        }
        .offset(y: -15)
        .padding(.horizontal, App.Margin.large)
    }
    
    private func makeInformationalRow(title: String, image: String, value: String) -> some View {
        HStack(alignment: .center, spacing: .zero) {
            Label {
                Text(title).font(.body.weight(.semibold))
            } icon: {
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 22, height: 22)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Text(value)
                .font(.subheadline.weight(.semibold))
        }
        .foregroundStyle(.white)
        .padding(.horizontal, App.Margin.large)
    }
    
    private var buyNowButton: some View {
        Button(action: {}, label: {
            Text(App.Localization.buyNowButton)
                .frame(maxWidth: .infinity, alignment: .center)
        })
        .foregroundStyle(.white)
        .buttonStyle(.ghost)
        .padding(App.Margin.extraLarge)
    }
    
    private var backgroundGradient: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color(hex: package.packageOperator.gradientStart),
                Color(hex: package.packageOperator.gradientEnd)
            ]),
            startPoint: .top,
            endPoint: .bottom
        )
    }
}
