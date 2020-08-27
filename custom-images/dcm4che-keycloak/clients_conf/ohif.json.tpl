{
    "clientId": "ohif",
    "rootUrl": "https://visor{{DOMAIN}}",
    "adminUrl": "https://visor{{DOMAIN}}",
    "surrogateAuthRequired": false,
    "enabled": true,
    "alwaysDisplayInConsole": false,
    "clientAuthenticatorType": "client-secret",
    "redirectUris": [
        "https://visor{{DOMAIN}}/*"
    ],
    "webOrigins": [
        "https://visor{{DOMAIN}}"
    ],
    "notBefore": 0,
    "bearerOnly": false,
    "consentRequired": false,
    "standardFlowEnabled": true,
    "implicitFlowEnabled": false,
    "directAccessGrantsEnabled": true,
    "serviceAccountsEnabled": false,
    "publicClient": true,
    "frontchannelLogout": false,
    "protocol": "openid-connect",
    "attributes": {},
    "authenticationFlowBindingOverrides": {},
    "fullScopeAllowed": true,
    "nodeReRegistrationTimeout": -1,
    "defaultClientScopes": [
        "web-origins",
        "role_list",
        "roles",
        "profile",
        "email"
    ],
    "optionalClientScopes": [
        "address",
        "phone",
        "offline_access",
        "microprofile-jwt"
    ],
    "access": {
        "view": true,
        "configure": true,
        "manage": true
    }
}