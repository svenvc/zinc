positioning
position
	"Return my current position. This is an object that can be used as argument to #position: to move back to that position. Although opaque, it is currently an integer count of the number of #next operations done on the stream that I wrap."

	^ count - delta