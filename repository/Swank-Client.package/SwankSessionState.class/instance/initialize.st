initialize-release
initialize
	requests := Dictionary new: 61.
	indentation := Dictionary new.
	package := CLPackage clUser.
	prompt := '?'.
	messageId := 0