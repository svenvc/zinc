positioning
savingPositionDo: block
	"Execute block so that any reading from me in it has no effect afterwards. I remember the current #position and move back to it using #position: after evaluating block. My buffer size limits how long the excursion can be. A SubscriptOutOfBounds exception will be signalled in case this operation cannot be completed."

	| savedPosition |
	savedPosition := self position.
	^ block ensure: [ self position: savedPosition ]