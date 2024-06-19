//
//  PackagesView.swift
//  AiraloTest
//
//  Created by TRONCA DANIEL JAMES on 18/06/24.
//

import SwiftUI

struct PackagesView: View {
    
    @ObservedObject private var viewModel: CountryPackagesViewModel
    
    init(viewModel: CountryPackagesViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        if let packages = viewModel.countryPackages?.packages {
            ScrollView(.vertical) {
                VStack(alignment: .center, spacing: App.Margin.extraUltra) {
                    ForEach(packages, id: \.self) { package in
                       PackageCardView(package: package)
                    }
                }
                .padding(App.Margin.extraLarge)
            }
        } else {
            ContentUnavailableView(
                App.Localization.noPackagesAvailableTitle,
                systemImage: "binoculars",
                description: Text(App.Localization.noPackagesAvailableDescription)
            )
        }
    }
}
