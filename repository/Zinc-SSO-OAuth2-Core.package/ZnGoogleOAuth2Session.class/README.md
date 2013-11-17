I am ZnGoogleOAuth2Session.
I am a ZnOAuthSession.

Google OAuth2 docs: https://developers.google.com/accounts/docs/OAuth2WebServer.

accessType - hold the access type value described by the Google OAuth2 docs. The value can be: "online" or "offline".

approvalPrompt - hold the approval_prompt value described by the Google OAuth2 docs. The value can be: "auto" or "force". It is useful to use "force" when in "offline" mode, because a refresh_token is sent only once after user consent is obtained. If the refresh_token is lost, then the user must be re-prompted for consent (which won't happen with the default "auto" setting).
