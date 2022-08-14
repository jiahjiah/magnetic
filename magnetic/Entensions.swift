//
//  Entensions.swift
//  magnetic
//
//  Created by HDSB on 2022-08-13.
//

import Foundation
import SwiftUI


extension Color {
    static let myblue = Color("Blue")
    static let darkPurple = Color("DarkPurple")
    static let darkTeal = Color("DarkTeal")
    static let lightPurple = Color("LightPurple")
    static let lightTeal = Color("LightTeal")
}

extension DateFormatter {
    static let allNumericUSA: DateFormatter = {
        print("Initalizing date formatter")
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        
        return formatter
    }()
}

extension String {
    func dateParsed() -> Date {
        guard let parsedDate = DateFormatter.allNumericUSA.date(from: self) else { return Date() }
        
        return parsedDate
    }
}
