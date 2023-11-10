// Copyright © Fleuronic LLC. All rights reserved.

import struct Etch.Team
import protocol EtchService.TeamSpec
import protocol Catenary.API

extension API: TeamSpec {
	public func fetchDetails(forTeamWith id: Team.ID) -> AsyncStream<Self.Result<TeamDetails?>> {
		.init {
			await fetch(TeamDetails.self, with: id)
		}
	}
}
