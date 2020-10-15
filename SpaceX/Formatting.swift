//
//  Formatting.swift
//  SpaceX
//
//  Created by Johnnie Walker on 10/8/20.
//  Copyright © 2020 Johnnie Walker. All rights reserved.
//

import Foundation

extension Date {
	var formatted: String {
		let formatter = DateFormatter()
		formatter.dateStyle = .medium
		formatter.timeStyle = .medium
		return formatter.string(from: self)
	}
}

extension DateFormatter {
	static let shortISO8601: DateFormatter = {
		let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
		return formatter
	}()
}

extension Int {
	var formatted: String {
		let sign = self >= 0 ? "+" : ""
		return "T" + sign + "\(self)"
	}
}

extension Bool {
	var formatted: String {
		return self ? "Succeeded" : "Failed"
	}
}

