I am ZnTestRunnerDelegate, a web service interface to run unit tests.

	ZnTestRunnerDelegate startInServerOn: 1701.
	
	ZnEasy get: 'http://localhost:1701/sunit/ZnUtilsTest'.
	ZnEasy get: 'http://localhost:1701/sunit/ZnUtilsTest/testBase64'.

Web Service API:

	GET /sunit/MyTestCase
	GET /sunit/MyTestCase/testOne

Part of Zinc HTTP Components