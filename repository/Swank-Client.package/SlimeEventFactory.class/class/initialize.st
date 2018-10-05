class-initialization
initialize
	"self initialize"
	|eventClasses|
	super initialize.
	eventClasses := SlimeEvent subclasses.
	events := Dictionary new.
	eventClasses do: [:each | events at: each id put: each].