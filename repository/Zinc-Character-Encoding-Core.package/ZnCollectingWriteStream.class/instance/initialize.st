initialization
initialize
	super initialize.
	totalSize := 0.
	chunks := DoubleLinkedList new.
	binary := false