connection
close
	| promise |
	promise := self send: SlimeEmacsRexCommand new.
	promise waitTimeoutSeconds: 2.
	mutex
		critical: [internalConnectionState := #closing]