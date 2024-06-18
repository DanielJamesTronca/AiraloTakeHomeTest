//
//  CountryPackages.swift
//  AiraloTest
//
//  Created by TRONCA DANIEL JAMES on 18/06/24.
//

import Foundation

struct CountryPackages: Codable {
    let id: Int
    let slug, title: String
    let image: ImageRepresentation
    let packages: [Package]
}

struct Package: Codable, Hashable {
    let id: Int
    let slug, type: String
    let price: Double
    let title, data, validity: String
    let day, amount: Int
    let isUnlimited: Bool
    let shortInfo: String?
    let isStock: Bool
    let packageOperator: Operator
    
    enum CodingKeys: String, CodingKey {
        case id, slug, type, price, title, data, validity, day, amount
        case isUnlimited = "is_unlimited"
        case shortInfo = "short_info"
        case isStock = "is_stock"
        case packageOperator = "operator"
    }
}

extension Package {
    var imageUrl: URL? {
        guard let url = URL(string: packageOperator.image.url) else { return nil }
        return url
    }
}

struct Operator: Codable, Hashable {
    let id: Int
    let title, style, gradientStart, gradientEnd: String
    let isKycVerify: Int
    let type: String
    let isPrepaid, isMultiPackage: Bool
    let planType, activationPolicy: String
    let rechargeability: Bool
    let apnType, apnTypeIos, apnTypeAndroid, apnSingle: String
    let dataRoaming: Bool
    //    let networks: [Network]
    let info: [String]
    let image: ImageRepresentation
    let countries: [Country]
    
    enum CodingKeys: String, CodingKey {
        case id, title, style
        case gradientStart = "gradient_start"
        case gradientEnd = "gradient_end"
        case isKycVerify = "is_kyc_verify"
        case type
        case isPrepaid = "is_prepaid"
        case isMultiPackage = "is_multi_package"
        case planType = "plan_type"
        case activationPolicy = "activation_policy"
        case rechargeability
        case apnType = "apn_type"
        case apnTypeIos = "apn_type_ios"
        case apnTypeAndroid = "apn_type_android"
        case apnSingle = "apn_single"
        case dataRoaming = "data_roaming"
//        case networks
        case info, image, countries
    }
}

struct Country: Codable, Hashable {
    let id: Int
    let slug, title: String
    let image: ImageRepresentation
}

//struct Network: Codable {
//    let network, serviceType: String
//    let status: Bool
//
//    enum CodingKeys: String, CodingKey {
//        case network
//        case serviceType = "service_type"
//        case status
//    }
//}
