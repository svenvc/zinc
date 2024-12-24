accessing
writeErrorBlock
	^ writeErrorBlock ifNil: [ writeErrorBlock := self defaultWriteErrorBlock ]