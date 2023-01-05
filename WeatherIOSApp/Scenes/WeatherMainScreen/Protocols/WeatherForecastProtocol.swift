//
//  WeatherForecastProtocol.swift
//  WeatherIOSApp
//
//  Created by Passant Abdelatif on 04/01/2023.
//

import UIKit

protocol ViewToPresenterWeatherForecastProtocol {
    var weatherForecastInteractor: PresenterToInteractorWeatherForecastProtocol? {get set}
    var weatherForecastView: PresenterToViewWeatherForecastProtocol? {get set}

    func getWeatherAutoCompleteSearchResult(cityName: String)
    func getWeatherForecast(cityName: String)
}

protocol PresenterToInteractorWeatherForecastProtocol {
    var weatherForecastPresenter: InteractorToPresenterWeatherForecastProtocol? {get set}
   
    func getWeatherAutoCompleteSearchResult(cityName: String)
    func getWeatherForecast(cityName: String)
}

protocol InteractorToPresenterWeatherForecastProtocol {
    func sendToDataPresenter(weatherInfo : [WeatherAutoCompleteSearchResponse]?)
    func sendToDataPresenter(weatherInfo : WeatherForecastResponse?)
}

protocol PresenterToViewWeatherForecastProtocol {
    func startViewLoader()
    func endViewLoader()
    func sendToDataView(weatherInfo : [WeatherAutoCompleteSearchResponse]?)
    func sendToDataView(weatherInfo : WeatherForecastResponse?)
    func sendErrorToView(error: String)
}

protocol PresenterToRouterWeatherForecastProtocol {
    static func createModule(ref: WeatherForecastViewController)
  
}
