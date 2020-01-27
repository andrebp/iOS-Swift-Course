//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateCoin(_ coinManager : CoinManager, coin : CoinModel)
    func didFailWithError (_ error : Error)
}

struct CoinManager {
    
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
 
    var delegate : CoinManagerDelegate?
    
    func getCoinPrice(for currency: String) {
        let url = "\(baseURL)\(currency)"
        performRequest(with : url)
    }
    
    func performRequest(with url : String) {
        if let urlString = URL(string: url){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: urlString) { (data, response, error) in
                
                if error != nil {
                    self.delegate?.didFailWithError(error!)
                }
                
                if let safeData = data {
                    if let coin = self.parseJSON(safeData) {
                        self.delegate?.didUpdateCoin(self, coin: coin)
                    }
                }
                
            }
            task.resume()
        }
    }
    
    func parseJSON(_ data : Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let lastPrice = decodedData.last
            
            let coin = CoinModel(price: lastPrice)
            
            return coin
            
        } catch {
            delegate?.didFailWithError(error)
            return nil
        }
    }
    
}
