private
vmStats
	^  [ SmalltalkImage current vm statisticsReport ]
		on: MessageNotUnderstood 
		do: [ SmalltalkImage current vmStatisticsReportString ]