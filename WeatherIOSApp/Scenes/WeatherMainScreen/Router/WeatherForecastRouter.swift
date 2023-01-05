//
//  WeatherForecastRouter.swift
//  WeatherIOSApp
//
//  Created by Passant Abdelatif on 05/01/2023.
//

import Foundation

class WeatherForecastRouter: PresenterToRouterWeatherForecastProtocol {
    
    let weatherForecastViewController: WeatherForecastViewController
    
    
    init(weatherForecastViewController: WeatherForecastViewController ) {

        self.weatherForecastViewController = weatherForecastViewController
    }
    
    static func createModule(ref: WeatherForecastViewController) {
        let presenter = WeatherForecastPresenter()
        ref.weatherForecastPresenterObject = presenter
        ref.weatherForecastPresenterObject?.weatherForecastView = ref
        ref.weatherForecastPresenterObject?.weatherForecastInteractor = WeatherForecastInteractor()
        ref.weatherForecastPresenterObject?.weatherForecastInteractor?.weatherForecastPresenter = presenter
    }
    
    
}
