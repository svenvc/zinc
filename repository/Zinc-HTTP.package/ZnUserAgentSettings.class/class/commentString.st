accessing
commentString
	^ '(', self platform platformName, '; ', self encryptionStrengthComment, '; ', self platformDetails, '; ', self localeComment, ')'