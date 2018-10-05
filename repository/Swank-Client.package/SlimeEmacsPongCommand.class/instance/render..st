rendering
render: aSessionState 
	^ ConsCell fromList: {#':emacs-pong'. self thread. self messageId}