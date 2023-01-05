//
//  WeatherForecastViewController.swift
//  WeatherIOSApp
//
//  Created by Passant Abdelatif on 04/01/2023.
//

import UIKit

class WeatherForecastViewController: UIViewController {

    
    var weatherForecastPresenterObject : ViewToPresenterWeatherForecastProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WeatherForecastRouter.createModule(ref: self)
        weatherForecastPresenterObject?.getWeatherForecast(cityName: "London")
    }

}

extension WeatherForecastViewController: PresenterToViewWeatherForecastProtocol {
    func startViewLoader() {
        print("start load")
    }
    
    func endViewLoader() {
        print("end load")
    }
    
    func sendToDataView(weatherInfo: [WeatherAutoCompleteSearchResponse]) {
        print("weather search = \(weatherInfo)")
    }
    
    func sendToDataView(weatherInfo: WeatherForecastResponse?) {
        print("weather forecast = \(weatherInfo)")
    }
    
    func sendErrorToView(error: String) {
        
    }
    
    
}
