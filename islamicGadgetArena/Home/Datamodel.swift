


import Foundation
import UIKit




var month = getMonthForApi()
var year =  getYearForApi()
//TODO: Salat structures
struct Salat: Codable {
    let code: Int
    let status: String
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let timings: Timings
}

// MARK: - Timings
struct Timings: Codable {
    let fajr, dhuhr, asr: String
    let  maghrib, isha: String
//    let midnight: String

    enum CodingKeys: String, CodingKey {
        case fajr = "Fajr"
        //case sunrise = "Sunrise"
        case dhuhr = "Dhuhr"
        case asr = "Asr"
        //case sunset = "Sunset"
        case maghrib = "Maghrib"
        case isha = "Isha"
        //case imsak = "Imsak"
        //case midnight = "Midnight"
    }
}


//TODO : weather structures

struct Weather: Codable {
    let weather: [WeatherElement]
}

// MARK: - WeatherElement
struct WeatherElement: Codable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}


func getMonthForApi() -> String{
       let month = Calendar(identifier: .gregorian)
       

       let formatter = DateFormatter()
       formatter.calendar = month
       formatter.dateFormat = "M"

       let today = Date()
       let Month = formatter.string(from: today)

       
       return Month
   }

func getYearForApi() -> String{
       
       let Year = Calendar(identifier: .gregorian)
       

       let formatter = DateFormatter()
       formatter.calendar = Year
       formatter.dateFormat = "yyyy"

       let today = Date()
       let year = formatter.string(from: today)

       
       return year
       
   }








 func updateWeatherIcon(condition: Int) -> String {
        
    switch (condition) {
    
        case 0...300 :
            return "tstorm1"
        
        case 301...500 :
            return "light_rain"
        
        case 501...600 :
            return "shower3"
        
        case 601...700 :
            return "snow4"
        
        case 701...771 :
            return "fog"
        
        case 772...799 :
            return "tstorm3"
        
        case 800 :
            return "sunny"
        
        case 801...804 :
            return "cloudy2"
        
        case 900...903, 905...1000  :
            return "tstorm3"
        
        case 903 :
            return "snow5"
        
        case 904 :
            return "sunny"
        
        default :
            return "dunno"
        }

    }


