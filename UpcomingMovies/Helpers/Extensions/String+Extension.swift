//
//  String+Extension.swift
//  UpcomingMovies
//
//  Created by Nikos Aggelidis on 4/2/24.
//  Copyright © 2024 Alonso. All rights reserved.
//

import Foundation

enum DateFormat: String {
    case yyyyMMdd = "yyyy-MM-dd"
    case dMMMyyyy = "d MMMM yyyy"
    case MMddyyyy = "MM/dd/yyyy"
    case yyyyMMddHHmmss = "yyyy-MM-dd HH:mm:ss"
    case MMMdyyyy = "MMM d, yyyy"
    case EEEEMMMdyyyy = "EEEE, MMM d, yyyy"
    case HHmmss = "HH:mm:ss"
    case hhmma = "hh:mm a"
    case EEEEdMMMM = "EEEE, d MMMM"
    case MMMdyyyyHHmm = "MMM d, yyyy HH:mm"
    case ddMMyyyy = "dd-MM-yyyy"
    case yyyyMMddTHHmmssZ = "yyyy-MM-dd'T'HH:mm:ss'Z'" // ISO 8601
    case dMMMyyyyHHmm = "d MMMM yyyy, HH:mm"
    case MMddyyyyHHmmss = "MM/dd/yyyy HH:mm:ss"
    case yyMMdd = "yy-MM-dd"
    case EEEEddMMMMyyyy = "EEEE, dd MMMM yyyy"
}

extension String {
    func formattedDate(
        from inputFormat: DateFormat, 
        to outputFormat: DateFormat
    ) -> String {
        let inputFormatter = DateFormatter()
            inputFormatter.dateFormat = inputFormat.rawValue
        guard let date = inputFormatter.date(from: self) else { return self }
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = outputFormat.rawValue
        
        return outputFormatter.string(from: date)
    }
}
