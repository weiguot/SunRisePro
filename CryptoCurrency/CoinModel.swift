//
//  CoinModel.swift
//  CryptoCurrency
//
//  Created by Juan carlos De la parra on 16/02/21.
//

import Foundation

//struct CryptoDataContainer: Decodable {
//    let status: String
//    let data: CryptoData
//}
//
//struct CryptoData: Decodable {
//    let coins: [Coin]
//}

//struct Coin: Decodable, Hashable {
//    let name: String
//    let price: String
//}

struct SunRiseModel: Decodable {
    let results: Results
}


struct Results: Decodable {
    let sunrise: String
    let sunset: String
    let solar_noon: String
}
