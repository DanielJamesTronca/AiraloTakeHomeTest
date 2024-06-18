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
            ContentUnavailableView("No Packages Available", systemImage: "binoculars", description: Text("Please check back later for available packages."))
        case .loading:
            ProgressView("Loading packages...")
                .frame(maxHeight: .infinity, alignment: .center)
        case .failed(let error):
            ContentUnavailableView("Something went wrong", systemImage: "exclamationmark.triangle", description: Text("We encountered an error: \(error.localizedDescription)"))
        case .loaded:
            PackagesView(viewModel: viewModel)
        }
    }
}
