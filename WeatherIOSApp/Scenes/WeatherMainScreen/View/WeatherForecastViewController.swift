//
//  WeatherForecastViewController.swift
//  WeatherIOSApp
//
//  Created by Passant Abdelatif on 04/01/2023.
//

import UIKit
import SDWebImage

enum AutCompleteState {
    case open
    case close
}

class WeatherForecastViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var searchTableView: UITableView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var currentCityNameLabel: UILabel!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var currentDateLabel: UILabel!
    @IBOutlet weak var currentWeatherIconImageView: UIImageView!
    @IBOutlet weak var currentWeatherDegreeLabel: UILabel!
    @IBOutlet weak var currentWeatherStateLabel: UILabel!
    @IBOutlet weak var currentWeatherWindmphLabel: UILabel!
    @IBOutlet weak var currentWeatherHumidityLabel: UILabel!
    @IBOutlet weak var todayWeatherIconImageView: UIImageView!
    @IBOutlet weak var tomorrowWeatherIconImageView: UIImageView!
    @IBOutlet weak var fridayWeatherIconImageView: UIImageView!
    @IBOutlet weak var todayWeatherRangeTempLabel: UILabel!
    @IBOutlet weak var tomorrowWeatherRangeTempLabel: UILabel!
    @IBOutlet weak var fridayWeatherRangeTempLabel: UILabel!
    @IBOutlet weak var forecastWeatherContainerView: UIStackView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var closeAutoCompleteSearchTableView: UIView!
    @IBOutlet weak var closeSearchTableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var closeAutoCompeteButton: UIButton!
    @IBOutlet weak var clearSearchTextFieldButton: UIButton!
    
    // MARK: - variables
    var weatherForecastPresenterObject : ViewToPresenterWeatherForecastProtocol?
    var searchWeatherResults = [WeatherAutoCompleteSearchResponse]()
    var autoCompleteCase: AutCompleteState = .close
    let searchResultCellHeight = 32
    let roundedCornereSearchView = 30.0
    
    // MARK: - life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        registerCells()
        WeatherForecastRouter.createModule(ref: self)
        weatherForecastPresenterObject?.getWeatherForecast(cityName: "alexandria")
    }


}
// MARK: - Actions
extension WeatherForecastViewController {
    
    @IBAction func searchButtonAction(_ sender: Any) {
        searchTextField.text = ""
        searchView.isHidden = false
        self.view.bringSubviewToFront(searchView)
        closeSearchTableViewHeightConstraint.constant = 0
        searchTableViewHeightConstraint.constant = 0
        searchWeatherResults.removeAll()
    }
    
    @IBAction func closeSearchViewButtonAction(_ sender: Any) {
        searchView.isHidden = true
        self.view.sendSubviewToBack(searchView)
    }
    
    @IBAction func clearSearchButtonAction(_ sender: Any) {
        searchTextField.text = ""
    }
    
    @IBAction func closeSearchAutoCompleteButtonAction(_ sender: Any) {
        switch autoCompleteCase {
        case .close:
            autoCompleteCase = .open
            closeAutoCompeteButton.setImage(UIImage(named: AssetNames.Arrow.arrowDown),
                                            for: .normal)
            searchTableViewHeightConstraint.constant = 0
            searchTableView.isHidden = true
        case .open:
            autoCompleteCase = .close
            closeAutoCompeteButton.setImage(UIImage(named: AssetNames.Arrow.arrowUp),
                                            for: .normal)
            setUpSearchTableHeight()
            searchTableView.isHidden = false
        }
    }
    @objc private func textDidChange(sender: UITextField) {
        if self.searchTextField.text.orEmpty.isEmpty {
            clearSearchTextFieldButton.isHidden = true
        } else {
            clearSearchTextFieldButton.isHidden = false
        }
        
        //show suggestion view
        if let searchText = self.searchTextField.text,
           !searchText.isEmpty,
            searchText.count > 3 {
            weatherForecastPresenterObject?.getWeatherAutoCompleteSearchResult(cityName: searchText)
        } else {
            searchTableViewHeightConstraint.constant = 0
            closeSearchTableViewHeightConstraint.constant = 0
        }
    }
    
}

// MARK: - setup UI & register cells
extension WeatherForecastViewController {
    func setupUI() {
        searchTextField.addTarget(self,
                                       action: #selector(textDidChange(sender:)),
                                       for: .editingChanged)
        searchView.roundCorners(corners: [.bottomLeft, .bottomRight],
                                radius: roundedCornereSearchView)
        closeAutoCompleteSearchTableView.roundCorners(corners: [.bottomLeft, .bottomRight],
                                                      radius: roundedCornereSearchView)
    }
    func registerCells() {
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchTableView.isScrollEnabled = true
        searchTableView.isHidden = true
        
        searchTableView.registerNibFor(cellClass: AutoCompleteSearchTableViewCell.self)
    }
    func setUpSearchTableHeight() {
        searchView.isHidden = false
        searchTableView.isHidden = false
        closeSearchTableViewHeightConstraint.constant = 40
        autoCompleteCase = .close
        closeAutoCompeteButton.setImage(UIImage(named: AssetNames.Arrow.arrowUp),
                                        for: .normal)
        self.searchTableViewHeightConstraint.constant = CGFloat(searchResultCellHeight * searchWeatherResults.count)
        self.view.layoutIfNeeded()
    }
    func closeSearchMainContainerView() {
        searchTableViewHeightConstraint.constant = 0
        closeSearchTableViewHeightConstraint.constant = 0
        searchTableView.isHidden = true
        searchView.isHidden = true
    }
  
    
}

// MARK: - Get Data
extension WeatherForecastViewController: PresenterToViewWeatherForecastProtocol {
    func startViewLoader() {
        
        self.view.bringSubviewToFront(backgroundView)
        self.backgroundView.bringSubviewToFront(activityIndicator)
        self.activityIndicator.startAnimating()
        
    }
    
    func endViewLoader() {
       
        self.view.sendSubviewToBack(self.backgroundView)
        self.activityIndicator.stopAnimating()
    }
    
    func sendToDataView(weatherInfo: [WeatherAutoCompleteSearchResponse]?) {
        guard let weatherInfo = weatherInfo else {
            return
        }

        if !weatherInfo.isEmpty {
            searchTableView.isHidden = false
            searchWeatherResults.removeAll()
            searchWeatherResults.append(contentsOf: weatherInfo)
            setUpSearchTableHeight()
            searchTableView.reloadData()
        }
    }
    
    func sendToDataView(weatherInfo: WeatherForecastResponse?) {
        setCurrentWeatherData(weatherInfo: weatherInfo)
        setForecastWeatherData(weatherInfo: weatherInfo)
    }
    
    func sendErrorToView(error: String) {
        
    }
}

// MARK: - set Data to UI
extension WeatherForecastViewController {
    func setCurrentWeatherData(weatherInfo: WeatherForecastResponse?) {
        guard let weatherInfo = weatherInfo else {
            return
        }
        //location & time
        currentTimeLabel.text = weatherInfo.location?.localTimeFormatted.orEmpty
        currentDateLabel.text = weatherInfo.location?.localDateFormatted.orEmpty
        currentCityNameLabel.text = weatherInfo.location?.name.orEmpty
        
        //temp & condition
        currentWeatherDegreeLabel.text = weatherInfo.current?.weatherTempF.orEmpty
        currentWeatherStateLabel.text = weatherInfo.current?.condition?.text.orEmpty
        currentWeatherWindmphLabel.text = "\(weatherInfo.current?.windMph ?? 0)"
        currentWeatherHumidityLabel.text = "\(weatherInfo.current?.humidity ?? 0)"
        currentWeatherIconImageView.loadImageFromUrl(weatherInfo.current?.condition?.weatherIconFullUrl)

    }
    
    func setForecastWeatherData(weatherInfo: WeatherForecastResponse?) {
        guard let weatherInfo = weatherInfo else {
            return
        }
        
        if let forecastDays = weatherInfo.forecast?.forecastday,
           !forecastDays.isEmpty {
            forecastWeatherContainerView.isHidden = false
            if let todayForecast = forecastDays.first(where: {$0.isToday == true}) {
                todayWeatherRangeTempLabel.text = todayForecast.day?.dayTempFRange.orEmpty
                todayWeatherIconImageView.loadImageFromUrl(todayForecast.day?.condition?.weatherIconFullUrl)
            }
            
            if let tomorrowForecast = forecastDays.first(where: {$0.isTomorrow == true}) {
                tomorrowWeatherRangeTempLabel.text = tomorrowForecast.day?.dayTempFRange.orEmpty
                tomorrowWeatherIconImageView.loadImageFromUrl(tomorrowForecast.day?.condition?.weatherIconFullUrl)
            }
            
            if let fridayForecast = forecastDays.first(where: {$0.isFriday == true}) {
                fridayWeatherRangeTempLabel.text = fridayForecast.day?.dayTempFRange.orEmpty
                fridayWeatherIconImageView.loadImageFromUrl(fridayForecast.day?.condition?.weatherIconFullUrl)
            }
        }
    }
}
// MARK: UITableViewDataSource
extension WeatherForecastViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchWeatherResults.count
        
    }
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(cellClass: AutoCompleteSearchTableViewCell.self)
        cell.configCell(model: searchWeatherResults[indexPath.row])
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        closeSearchMainContainerView()
        weatherForecastPresenterObject?.getWeatherForecast(cityName: self.searchWeatherResults[indexPath.row].name.orEmpty)
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(searchResultCellHeight)
    }
}

