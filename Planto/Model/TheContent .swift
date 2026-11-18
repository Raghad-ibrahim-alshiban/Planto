//
//  TheContent .swift
//  Planto
//
//  Created by raghad2003 on 30/05/1448 AH.
//

import Foundation
//MARK: - WateringDay
enum WateringDay :String , Identifiable, CaseIterable {
    
    case evreyD = "Every day"
    case twoD = "Every 2 days"
    case threeD = "Every 3 days"
    case weekO = "Once a week"
    case tenD = "Every 10 days"
    case weekD = "Every 2 weeks"
    
    var id : String {rawValue}
    
    
    var intervalSeconds: TimeInterval {
        switch self {
        case .evreyD:  return 1 * 86400
        case .twoD:    return 2 * 86400
        case .threeD:  return 3 * 86400
        case .weekO:   return 7 * 86400
        case .tenD:    return 10 * 86400
        case .weekD:   return 14 * 86400
        }
    }

}



//MARK: - Water


enum Water : String , Identifiable, CaseIterable{
    case twn = "20-50 ml"
    case fif = "50-100 ml"
    case one = "100-200 ml"
    case twh = "200-300 ml"
    var id : String {rawValue}
}

//MARK: - Room
enum Room : String , Identifiable, CaseIterable{
    case bedr = "Bedroom"
    case livingr = "Living Room"
    case kitchen = "Kitchen"
    case balcony = "Balcony"
    case bathr = "Bathroom"
    var id : String {rawValue}

}


//MARK: - Light
enum Light :String , Identifiable, CaseIterable{
    case full="Full sun"
    case partials="Partial sun"
    case low="Low Light"
    var id : String {rawValue}

}
