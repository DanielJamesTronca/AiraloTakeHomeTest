//
//  CountryPackagesView.swift
//  AiraloTest
//
//  Created by TRONCA DANIEL JAMES on 18/06/24.
//

import SwiftUI

struct CountryPackagesView: View {
    
    @ObservedObject private var viewModel: CountryPackagesViewModel
    
    init(viewModel: CountryPackagesViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        switch viewModel.state {
        case .idle:
            ContentUnavailableView(
                App.Localization.noPackagesAvailableTitle,
                systemImage: "binoculars",
                description: Text(App.Localization.noPackagesAvailableDescription)
            )
        case .loading:
            ProgressView(App.Localization.loadingPackagesTitle)
                .frame(maxHeight: .infinity, alignment: .center)
        case .failed(let error):
            ContentUnavailableView(
                App.Localization.somethingWentWrongTitle,
                systemImage: "exclamationmark.triangle",
                description: Text(App.Localization.somethingWentWrongDescription(args: error.localizedDescription))
            )
        case .loaded:
            PackagesView(viewModel: viewModel)
        }
    }
}
