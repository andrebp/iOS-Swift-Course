//
//  CoinModel.swift
//  ByteCoin
//
//  Created by André Brandão  on 27/01/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel {
    let price : Double

    var priceString : String {
        return String(format : "%.3f", price)
    }

}

