coverage
selectorsToBeIgnored
	| deprecated private special |
	deprecated := #().
	private := #().
	special := #().
	^ super selectorsToBeIgnored , deprecated , private , special