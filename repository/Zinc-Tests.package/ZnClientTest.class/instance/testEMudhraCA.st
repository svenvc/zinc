tests
testEMudhraCA
	"Make sure we can catch the compromised eMudhra intermediate CA certificates.
	- https://emudhra.we-have-a-problem.com
	- https://en.wikipedia.org/wiki/EMudhra#2026_intermediate_certificate_compromise"

	#( 'dv-g3b-emudhra.we-have-a-problem.com'
	   'dv-g3b-aaa-emudhra.we-have-a-problem.com'
	   'dv-g3b-noct-emudhra.we-have-a-problem.com'
	   'dv-g3b-aaa-noct-emudhra.we-have-a-problem.com' ) do: [ :host |
			"Each of these hosts use TLS certificates that should not be trusted"
			self
				should: [
						ZnClient new
							https;
							host: host;
							withOptions: [ :options |
								options at: #verifyCertificates put: true ];
							get ]
				raise: ZnCertificateVerificationFailed ]