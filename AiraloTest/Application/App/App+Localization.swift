//
//  App+Localization.swift
//  AiraloTest
//
//  Created by TRONCA DANIEL JAMES on 18/06/24.
//

import Foundation

extension App {
    enum Localization {
        static let genericGotIt: String = "GENERIC_GOT_IT".localized
        static let genericHello: String = "GENERIC_HELLO".localized
        static let popularCountries: String = "POPULAR_COUNTRIES".localized
        static let noPackagesAvailableTitle: String = "NO_PACKAGES_AVAILABLE_TITLE".localized
        static let noPackagesAvailableDescription: String = "NO_PACKAGES_AVAILABLE_DESCRIPTION".localized
        static let somethingWentWrongTitle: String = "SOMETHING_WENT_WRONG_TITLE".localized
        static let buyNowButton: String = "BUY_NOW_BUTTON".localized
        static let dataInformative: String = "DATA_INFORMATIVE".localized
        static let validityInformative: String = "VALIDITY_INFORMATIVE".localized
        static let emptyEsimTitle: String = "EMPTY_ESIM_TITLE".localized
        static let emptyEsimDescription: String = "EMPTY_ESIM_DESCRIPTION".localized
        static let loadingPackagesTitle: String = "LOADING_PACKAGES_TITLE".localized
        
        static func somethingWentWrongDescription(args: String) -> String {
            "SOMETHING_WENT_WRONG_DESCRIPTION".localized(with: args)
        }
    }
}
