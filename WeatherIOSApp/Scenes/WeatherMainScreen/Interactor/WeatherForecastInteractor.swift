//
//  WeatherForecastInteractor.swift
//  WeatherIOSApp
//
//  Created by Passant Abdelatif on 05/01/2023.
//

import Foundation

class WeatherForecastInteractor: PresenterToInteractorWeatherForecastProtocol {
    var weatherForecastPresenter: InteractorToPresenterWeatherForecastProtocol?
    
    private let weatherForecastService: WeatherForecastServiceProtocol
    
    init(weatherForecastService: WeatherForecastServiceProtocol = WeatherForecastService()) {
        self.weatherForecastService = weatherForecastService
    }
    
    func getWeatherAutoCompleteSearchResult(cityName: String) {
        self.weatherForecastService.fetchWeatherAutoCompleteSearchResults(cityName: cityName)
        { [weak self] response, error in
            self?.weatherForecastPresenter?.sendToDataPresenter(weatherInfo: response)
        }
    }
    
    func getWeatherForecast(cityName: String) {
        self.weatherForecastService.fetchWeatherForecastResults(cityName: cityName)
        { [weak self] response, error in
            self?.weatherForecastPresenter?.sendToDataPresenter(weatherInfo: response)
        }
    }
    
    
}


