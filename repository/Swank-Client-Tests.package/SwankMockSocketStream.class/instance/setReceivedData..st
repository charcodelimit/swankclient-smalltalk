stream in
setReceivedData: data 
	self inStream nextPutAll: data.
	self inStream reset