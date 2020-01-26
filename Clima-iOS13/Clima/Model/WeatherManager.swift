//
//  WeatherManager.swift
//  Clima
//
//  Created by André Brandão  on 26/01/2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager : WeatherManager,  weather: WeatherModel)
    func didFailWithError(_ error : Error)
}

struct WeatherManager {
    let apiKey = "6be674e60094cc081d320232ce2c4d02"
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=6be674e60094cc081d320232ce2c4d02&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName : String) {
        let url = "\(weatherURL)&q=\(cityName)"
        performRequest(with : url)
    }
    
    func fetchWeather(latitude : CLLocationDegrees, longitude : CLLocationDegrees) {
        let url = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: url)
    }
    
    func performRequest(with url : String){
        if let url = URL(string: url){
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if error != nil {
                    print(error!)
                    self.delegate?.didFailWithError(error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        self.delegate?.didUpdateWeather(self, weather : weather)
                    }
                }
                
            }
            
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData : Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId : id, cityName : name, temperature : temp)
            
            return weather
        
        } catch {
            delegate?.didFailWithError(error)
            print(error)
            
            return nil
        }
    }
}

