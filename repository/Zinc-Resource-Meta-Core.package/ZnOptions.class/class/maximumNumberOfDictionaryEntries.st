options
maximumNumberOfDictionaryEntries
	"The maximum number dictionary entries to accept,
	before ZnTooManyDictionaryEntries is signalled.
	Used by ZnMultiValueDictionary and thus for reading headers,
	url query and application form url encoded entity fields.
	This helps to protect us from malicious content."

	<znOption>

	^ 256