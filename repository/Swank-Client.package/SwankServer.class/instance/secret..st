accessing
secret: aFileReferenceOrString 
	"returns nil or first line of the file with the slime secret"
	| stream secret homeDir secretFile |
	secret := nil.
	homeDir := aFileReferenceOrString isString
				ifTrue: [FileReference / aFileReferenceOrString]
				ifFalse: [aFileReferenceOrString].
	secretFile := homeDir / self class slimeSecretFile.
	secretFile exists
		ifTrue: [stream := MultiByteFileStream new
						open: secretFile pathString
						forWrite: false.
			stream converter: UTF8TextConverter new.
			stream atEnd
				ifFalse: [secret := stream upTo: Character linefeed]].
	secret ifNotNil: [
	secret := secret readStream upTo: Character cr].
	^ secret