//
//  CurrentWeather.swift
//  weatherApp
//
//  Created by Saul Rivera on 7/14/17.
//  Copyright © 2017 Dymtech. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    
    private var _cityName: String!
    private var _date: String!
    private var _weatherType: String!
    private var _currentTemp: Int!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = "undefined"
        }
        return _cityName
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Int {
        if _currentTemp == nil {
            _currentTemp = 0
        }
        return _currentTemp
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today \(currentDate)"
        return _date
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        //Alamofire
        let currentWeatherURL = URL(string: currentWeather_URL)!
        Alamofire.request(currentWeatherURL).responseJSON { response in
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                }
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                    }
                }
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    if let currentTemperature = main["temp"] as? Double {
                        let Celcius = currentTemperature - 273.15
                        self._currentTemp = Int(round(Celcius))
                    }
                }
            }
            completed()
        }
    }

    
}
