// Copyright © Fleuronic LLC. All rights reserved.

import enum Catenary.Request
import struct Foundation.URL
import class Foundation.JSONDecoder
import class Foundation.DateFormatter
import protocol Catenary.API
import protocol Caesura.HasuraAPI
import protocol EtchService.TeamFields

public struct API<
	TeamDetails: TeamFields
> {
	let apiKey: String

	public init(apiKey: String) {
		self.apiKey = apiKey
	}
}

// MARK: -
extension API: HasuraAPI {
	// MARK: API
	public var baseURL: URL {
		URL(string: "https://api.linear.app/graphql")!
	}

	public var authenticationHeader: Request.Header? {
		.init(
			field: "Authorization",
			value: "Bearer \(apiKey)"
		)
	}

	public var decoder: JSONDecoder {
		let decoder = JSONDecoder()
		decoder.keyDecodingStrategy = .convertFromSnakeCase
		decoder.dateDecodingStrategy = .formatted(dateFormatter)
		return decoder
	}
}

// MARK: -
private let dateFormatter = {
	let formatter = DateFormatter()
	formatter.dateFormat = "YYYY-MM-dd"
	return formatter
}()
