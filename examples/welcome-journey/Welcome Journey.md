# Enrol users to Welcome Journey 

This example demonstrates how to enroll new users into the Welcome Journey. It includes additional checks to ensure that users are not enrolled more than once, preventing duplicate enrollments in the journey.

## Prerequisites

1. Follow instructions to set up OAuth2 app in Salesforce Marketing Cloud.

2. For each example, create a config.toml file with your OAuth2 tokens, client ID, and client secret. Here's an example of how your config.toml file should look:
```toml
clientId = "<client-id>"
clientSecret = "<client-secret>"
subDomain = "<sub-domain>"
```

## Run the Example

1. Execute the following command to run the example:

```bash
bal run
```

2. Send the following CURL command:

```bash
curl -X POST "http://localhost:9090/marketing/journey" \
  -H "Content-Type: application/json" \
  -d '{
        "userId": "test@example.com",
        "email": "test@example.com",
        "firstName": "niveathika",
        "signupSource": "web"
    }'
```
