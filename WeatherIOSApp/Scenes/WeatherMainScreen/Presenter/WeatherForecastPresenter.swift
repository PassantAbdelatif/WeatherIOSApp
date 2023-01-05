//
//  WeatherForecastPresenter.swift
//  WeatherIOSApp
//
//  Created by Passant Abdelatif on 05/01/2023.
//

import Foundation

class WeatherForecastPresenter: ViewToPresenterWeatherForecastProtocol {
    var weatherForecastInteractor: PresenterToInteractorWeatherForecastProtocol?
    
    var weatherForecastView: PresenterToViewWeatherForecastProtocol?
    
    func getWeatherAutoCompleteSearchResult(cityName: String) {
        weatherForecastView?.startViewLoader()
        weatherForecastInteractor?.getWeatherAutoCompleteSearchResult(cityName: cityName)
    }
    
    func getWeatherForecast(cityName: String) {
        weatherForecastView?.startViewLoader()
        weatherForecastInteractor?.getWeatherForecast(cityName: cityName)
    }
    
}

extension WeatherForecastPresenter: InteractorToPresenterWeatherForecastProtocol {
    func sendToDataPresenter(weatherInfo: [WeatherAutoCompleteSearchResponse]) {
        weatherForecastView?.sendToDataView(weatherInfo: weatherInfo)
        weatherForecastView?.endViewLoader()
    }
    
    func sendToDataPresenter(weatherInfo: WeatherForecastResponse?) {
        weatherForecastView?.sendToDataView(weatherInfo: weatherInfo)
        weatherForecastView?.endViewLoader()
    }
    
    
}
