private html generation
generateCaptcha: request
	| first second |
	first := request session attributeAt: #firstNumber put: 10 atRandom.
	second := request session attributeAt: #secondNumber put: 10 atRandom.
	^ String streamContents: [ :stream |
		stream << ' Captcha: '; << first asWords; << ' plus '; << second asWords.
		stream << ' equals <input name="sum" placeholder="0" title="Enter the sum in digits" size="3"> ' ]