//
//  Constants.swift
//  weatherApp
//
//  Created by Saul Rivera on 7/14/17.
//  Copyright © 2017 Dymtech. All rights reserved.
//

import Foundation

let oneDayURL = "http://api.openweathermap.org/data/2.5/weather?"
let forecastURL = "http://api.openweathermap.org/data/2.5/forecast/daily?"
let latitude = "lat="
let longitude = "&lon="
let appID = "&appid="
let apiKey = "fa27972f5cb0a826c443eaa02480f16e"
let days = "&cnt=11"

var _lon = 37.0
var _lat = 42.0

var lat: Double {
    get {
        return _lat
    } set {
        _lat = newValue
    }
}

var lon: Double {
    get {
        return _lon
    } set {
        _lon = newValue
    }
}


typealias DownloadComplete = () -> ()

let currentWeather_URL = oneDayURL + latitude + "\(_lat)" + longitude + "\(_lon)" + appID + apiKey
let forecastWeather_URL = forecastURL + latitude + "\(_lat)" + longitude + "\(_lon)" + days + appID + apiKey
