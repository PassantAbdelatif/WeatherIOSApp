//
//  WeatherForecastService.swift
//  WeatherIOSApp
//
//  Created by Passant Abdelatif on 04/101/2022.
//

import Moya
import UIKit

protocol WeatherForecastServiceProtocol {
    var provider: MoyaProvider<WeatherApi> { get }
    func fetchWeatherForecastResults(cityName: String,
                                     completion: @escaping (WeatherForecastResponse?, Error?) -> ())
    func fetchWeatherAutoCompleteSearchResults(cityName: String,
                                               completion: @escaping ([WeatherAutoCompleteSearchResponse]?, Error?) -> ())
}

final class WeatherForecastService: WeatherForecastServiceProtocol {
    
    let provider = MoyaProvider<WeatherApi>()
    
    func fetchWeatherForecastResults(cityName: String,
                                     completion: @escaping (WeatherForecastResponse?, Error?) -> ()) {
        provider.request(.getAllWeatherForecast(cityName: cityName)) { (result) in

            switch result {
            case .success(let response):
                if 200...299 ~= response.statusCode {
                    do {
                        let result = try JSONDecoder().decode(
                            WeatherForecastResponse.self,
                            from: response.data)
                        completion(result, nil)
                    } catch let error {
                        completion(nil, error)
                    }
                } else {
                    // 300-399 ,400-499
//                    do {
//                        let businessError = try JSONDecoder().decode(
//                            NetworkResponse<ListData<GeneralCenterType>>.self,
//                            from: response.data)
//                        var error = businessError.error
//                        error?.type  = .business
//                        completion(.failure(error ?? NetworkError()), response.statusCode)
//                    } catch {
//                        completion(.failure(NetworkError.parseError), response.statusCode)
//                    }
                }

            case .failure(let error):
                completion(nil, error)
            }
            
        }
    }
    
    func fetchWeatherAutoCompleteSearchResults(cityName: String,
                                               completion: @escaping ([WeatherAutoCompleteSearchResponse]?, Error?) -> ()) {
        provider.request(.getAutoCompleteSearchResults(cityName: cityName)) { (response) in
            switch response {
            case .failure(let error):
                completion(nil,
                           error)
            case .success(let value):
                let decoder = JSONDecoder()
                do {
                    let weatherAutoCompleteSearchResults = try decoder.decode([WeatherAutoCompleteSearchResponse].self,
                                                                              from: value.data)
                    completion(weatherAutoCompleteSearchResults, nil)
                } catch let error {
                    completion(nil, error)
                }
            }
        }
    }
}

