// AUTO-GENERATED FILE. DO NOT MODIFY.
// This file is auto-generated by the Ballerina OpenAPI tool.

// Copyright (c) 2025, WSO2 LLC. (http://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/data.jsondata;
import ballerina/http;

# Salesforce Marketing Cloud APIs provide programmatic access to features such as Address, Assets (Content Builder), Audit, Contacts, Data Events, Event Notification, Interactions (Journey Builder), Push, SMS, Transactional Messaging, and Messaging. Refer to the official Salesforce documentation for detailed API usage and guidelines.
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    #
    # + subDomain - Subdomain of the target service, e.g., 'mcdev' for 'mcdev.rest.marketingcloudapis.com'
    # + config - The configurations to be used when initializing the `connector` 
    # + return - An error if connector initialization failed 
    public isolated function init(string subDomain, ConnectionConfig config) returns error? {
        string serviceUrl = string `https://${subDomain}.rest.marketingcloudapis.com`;
        http:ClientConfiguration httpClientConfig = {auth: getUpdatedAuthConfig(config.auth, subDomain), httpVersion: config.httpVersion, http1Settings: config.http1Settings, http2Settings: config.http2Settings, timeout: config.timeout, forwarded: config.forwarded, followRedirects: config.followRedirects, poolConfig: config.poolConfig, cache: config.cache, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, cookieConfig: config.cookieConfig, responseLimits: config.responseLimits, secureSocket: config.secureSocket, proxy: config.proxy, socketConfig: config.socketConfig, validation: config.validation, laxDataBinding: config.laxDataBinding};
        self.clientEp = check new (serviceUrl, httpClientConfig);
    }

    # Get Event Definitions
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - List of event definitions 
    remote isolated function getEventDefinitions(map<string|string[]> headers = {}, *GetEventDefinitionsQueries queries) returns EventDefinitionList|error {
        string resourcePath = string `/interaction/v1/eventDefinitions`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Create Event Definition
    #
    # + headers - Headers to be sent with the request 
    # + payload - Payload to be sent with the request 
    # + return - Event Definition created successfully 
    remote isolated function createEventDefinition(EventDefinition payload, map<string|string[]> headers = {}) returns EventDefinition|error {
        string resourcePath = string `/interaction/v1/eventDefinitions`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Get Event Definitions - By Key
    #
    # + eventDefinitionKey - Key of the event definition
    # + headers - Headers to be sent with the request 
    # + return - Event definition details 
    remote isolated function getEventDefinitionByKey(string eventDefinitionKey, map<string|string[]> headers = {}) returns EventDefinition|error {
        string resourcePath = string `/interaction/v1/eventDefinitions/key:${getEncodedUri(eventDefinitionKey)}`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Update Event Definition - By Key
    #
    # + eventDefinitionKey - Key of the event definition
    # + headers - Headers to be sent with the request 
    # + payload - Payload to be sent with the request 
    # + return - Successful response 
    remote isolated function updateEventDefinitionByKey(string eventDefinitionKey, EventDefinition payload, map<string|string[]> headers = {}) returns EventDefinition|error {
        string resourcePath = string `/interaction/v1/eventDefinitions/key:${getEncodedUri(eventDefinitionKey)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Delete Event Definition - By Key
    #
    # + eventDefinitionKey - Key of the event definition
    # + headers - Headers to be sent with the request 
    # + return - Successful response 
    remote isolated function deleteEventDefinitionByKey(string eventDefinitionKey, map<string|string[]> headers = {}) returns json|error {
        string resourcePath = string `/interaction/v1/eventDefinitions/key:${getEncodedUri(eventDefinitionKey)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Update Event Definition - By ID
    #
    # + eventDefinitionId - ID of the event definition
    # + headers - Headers to be sent with the request 
    # + payload - Payload to be sent with the request 
    # + return - Successful response 
    remote isolated function updateEventDefinitionById(string eventDefinitionId, EventDefinition payload, map<string|string[]> headers = {}) returns EventDefinition|error {
        string resourcePath = string `/interaction/v1/eventDefinitions/${getEncodedUri(eventDefinitionId)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Delete Event Definition - By ID
    #
    # + eventDefinitionId - ID of the event definition
    # + headers - Headers to be sent with the request 
    # + return - Successful response 
    remote isolated function deleteEventDefinitionById(string eventDefinitionId, map<string|string[]> headers = {}) returns json|error {
        string resourcePath = string `/interaction/v1/eventDefinitions/${getEncodedUri(eventDefinitionId)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Fire Entry Event
    #
    # + headers - Headers to be sent with the request 
    # + payload - Payload to be sent with the request 
    # + return - Successful response 
    remote isolated function fireEntryEvent(FireEvent payload, map<string|string[]> headers = {}) returns FireEventResponse|error {
        string resourcePath = string `/interaction/v1/events`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Get Interactions (Journeys)
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Successful response 
    remote isolated function getJourneys(map<string|string[]> headers = {}, *GetJourneysQueries queries) returns JourneysList|error {
        string resourcePath = string `/interaction/v1/interactions`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Update an existing Journey version
    #
    # + headers - Headers to be sent with the request 
    # + payload - Request body for updating an existing journey 
    # + return - Journey updated successfully 
    remote isolated function updateJourney(UpdateJourney payload, map<string|string[]> headers = {}) returns Journey|error {
        string resourcePath = string `/interaction/v1/interactions`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Create Interaction (Journey) - Simple Journey
    #
    # + headers - Headers to be sent with the request 
    # + payload - Request body for creating a new journey 
    # + return - Successful response 
    remote isolated function createJourney(Journey payload, map<string|string[]> headers = {}) returns Journey|error {
        string resourcePath = string `/interaction/v1/interactions`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Get List Of Journeys Contact Is In
    #
    # + headers - Headers to be sent with the request 
    # + payload - Payload to be sent with the request 
    # + return - Successful response with contact list memberships 
    remote isolated function getContactMembership(ContactMembershipRequest payload, map<string|string[]> headers = {}) returns ContactMembershipResponse|error {
        string resourcePath = string `/interaction/v1/interactions/contactMembership`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Remove Contact From Journey
    #
    # + headers - Headers to be sent with the request 
    # + payload - Payload to be sent with the request 
    # + return - Accepted – contact exit request successfully received 
    remote isolated function removeContactFromJourney(ContactExitRequest payload, map<string|string[]> headers = {}) returns ContactExitResponse|error {
        string resourcePath = string `/interaction/v1/interactions/contactexit`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Get Contact Journey Exit Status
    #
    # + headers - Headers to be sent with the request 
    # + payload - Payload to be sent with the request 
    # + return - Status of contact removal returned successfully 
    remote isolated function getContactExitStatus(ContactExitRequest payload, map<string|string[]> headers = {}) returns ContactExitStatusResponse|error {
        string resourcePath = string `/interaction/v1/interactions/contactexit/status`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Get Interactions (Journeys) - By ID
    #
    # + journeyId - ID of version 1 of the journey in the form of a GUID (UUID)
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Successful response 
    remote isolated function getJourneyById(string journeyId, map<string|string[]> headers = {}, *GetJourneyByIdQueries queries) returns Journey|error {
        string resourcePath = string `/interaction/v1/interactions/${getEncodedUri(journeyId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Update an existing Journey version
    #
    # + journeyId - ID of the journey in the form of a GUID (UUID)
    # + headers - Headers to be sent with the request 
    # + payload - Request body for updating an existing journey 
    # + return - Journey updated successfully 
    remote isolated function updateJourneyById(string journeyId, UpdateJourney payload, map<string|string[]> headers = {}) returns Journey|error {
        string resourcePath = string `/interaction/v1/interactions/${getEncodedUri(journeyId)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Delete Interaction (Journey) - By ID
    #
    # + journeyId - ID of the journey in the form of a GUID (UUID). The ID deletes all versions of the journey, unless a versionNumber is provided
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Successful response 
    remote isolated function deleteJourneyById(string journeyId, map<string|string[]> headers = {}, *DeleteJourneyByIdQueries queries) returns json|error {
        string resourcePath = string `/interaction/v1/interactions/${getEncodedUri(journeyId)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Get Interactions (Journeys) - By Key
    #
    # + 'key - The key of the journey
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Successful response 
    remote isolated function getJourneyByKey(string 'key, map<string|string[]> headers = {}, *GetJourneyByKeyQueries queries) returns Journey|error {
        string resourcePath = string `/interaction/v1/interactions/key:${getEncodedUri('key)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Update existing Journey version
    #
    # + 'key - The key of the journey
    # + headers - Headers to be sent with the request 
    # + payload - Request body for updating an existing journey 
    # + return - Journey updated successfully 
    remote isolated function updateJourneyByKey(string 'key, UpdateJourney payload, map<string|string[]> headers = {}) returns Journey|error {
        string resourcePath = string `/interaction/v1/interactions/key:${getEncodedUri('key)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->put(resourcePath, request, headers);
    }

    # Delete Interaction (Journey) - By Key
    #
    # + 'key - Key of the journey. The Key deletes all versions of the journey, unless a versionNumber is provided
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Successful response 
    remote isolated function deleteJourneyByKey(string 'key, map<string|string[]> headers = {}, *DeleteJourneyByKeyQueries queries) returns json|error {
        string resourcePath = string `/interaction/v1/interactions/key:${getEncodedUri('key)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Validate Address
    #
    # + headers - Headers to be sent with the request 
    # + payload - Payload to be sent with the request 
    # + return - Successful response 
    remote isolated function validateEmail(ValidateEmailRequest payload, map<string|string[]> headers = {}) returns ValidateEmailResponse|error {
        string resourcePath = string `/address/v1/validateEmail`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Get Campaigns
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - List of campaigns 
    remote isolated function getCampaigns(map<string|string[]> headers = {}, *GetCampaignsQueries queries) returns CampaignList|error {
        string resourcePath = string `/hub/v1/campaigns/`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Create Campaign
    #
    # + headers - Headers to be sent with the request 
    # + payload - Payload to be sent with the request 
    # + return - Campaign created successfully 
    remote isolated function createCampaign(UpsertCampaign payload, map<string|string[]> headers = {}) returns Campaign|error {
        string resourcePath = string `/hub/v1/campaigns/`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Delete Campaign
    #
    # + id - ID of the campaign to delete
    # + headers - Headers to be sent with the request 
    # + return - Campaign deleted successfully 
    remote isolated function deleteCampaign(string id, map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/hub/v1/campaigns/${getEncodedUri(id)}`;
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Update Campaign
    #
    # + id - ID of the campaign to update
    # + headers - Headers to be sent with the request 
    # + payload - Payload to be sent with the request 
    # + return - Campaign updated successfully 
    remote isolated function updateCampaign(string id, UpsertCampaign payload, map<string|string[]> headers = {}) returns Campaign|error {
        string resourcePath = string `/hub/v1/campaigns/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->patch(resourcePath, request, headers);
    }

    # Upsert Row Set - DE Key
    #
    # + dEExternalKey - External Key of the Data Extension
    # + headers - Headers to be sent with the request 
    # + payload - Payload to be sent with the request 
    # + return - Successful response 
    remote isolated function upsertDERowSetByKey(string dEExternalKey, DataExtensionRowSet payload, map<string|string[]> headers = {}) returns DataExtensionRowSet|error {
        string resourcePath = string `/hub/v1/dataevents/key:${getEncodedUri(dEExternalKey)}/rowset`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Delete Row Set - DE Key
    #
    # + dEExternalKey - External Key of the Data Extension
    # + headers - Headers to be sent with the request 
    # + payload - Payload to be sent with the request 
    # + return - Successful response 
    remote isolated function deleteDERowSetByKey(string dEExternalKey, DataExtensionRowSet payload, map<string|string[]> headers = {}) returns DataExtensionRowSet|error {
        string resourcePath = string `/hub/v1/dataevents/key:${getEncodedUri(dEExternalKey)}/rowset/delete`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Upsert Row Set - DE Key (Async)
    #
    # + dEExternalKey - External Key of the Data Extension
    # + headers - Headers to be sent with the request 
    # + payload - Payload to be sent with the request 
    # + return - Successful response 
    remote isolated function upsertDERowSetByKeyAsync(string dEExternalKey, DataExtensionRowSet payload, map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/hub/v1/dataeventsasync/key:${getEncodedUri(dEExternalKey)}/rowset`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Delete Row Set - DE Key (Async)
    #
    # + dEExternalKey - External Key of the Data Extension
    # + headers - Headers to be sent with the request 
    # + payload - Payload to be sent with the request 
    # + return - Successful response 
    remote isolated function deleteDERowSetByKeyAsync(string dEExternalKey, DataExtensionRowSet payload, map<string|string[]> headers = {}) returns error? {
        string resourcePath = string `/hub/v1/dataeventsasync/key:${getEncodedUri(dEExternalKey)}/rowset/delete`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Search Contacts by Attribute
    #
    # + attributeName - The name of the attribute to search by
    # + headers - Headers to be sent with the request 
    # + payload - Payload to be sent with the request 
    # + return - OK 
    remote isolated function searchContactsByAttribute(ContactAttributeName attributeName, ContactAttributeFilterCondition payload, map<string|string[]> headers = {}) returns SearchContactsByAttributeResponse|error {
        string resourcePath = string `/contacts/v1/addresses/search/${getEncodedUri(attributeName)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Search Contacts by Email
    #
    # + headers - Headers to be sent with the request 
    # + payload - Payload to be sent with the request 
    # + return - OK 
    remote isolated function searchContactsByEmail(SearchContactsByEmailRequest payload, map<string|string[]> headers = {}) returns SearchContactsByEmailResponse|error {
        string resourcePath = string `/contacts/v1/addresses/email/search`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Create Contacts
    #
    # + headers - Headers to be sent with the request 
    # + payload - Payload to be sent with the request 
    # + return - Successful response 
    remote isolated function createContact(UpsertContactRequest payload, map<string|string[]> headers = {}) returns UpsertContactResponse|error {
        string resourcePath = string `/contacts/v1/contacts`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Update Contacts
    #
    # + headers - Headers to be sent with the request 
    # + payload - Payload to be sent with the request 
    # + return - Successful response 
    remote isolated function updateContact(UpsertContactRequest payload, map<string|string[]> headers = {}) returns UpsertContactResponse|error {
        string resourcePath = string `/contacts/v1/contacts`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->patch(resourcePath, request, headers);
    }

    # Delete Contact - By Key
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + payload - Payload to be sent with the request 
    # + return - Successful response 
    remote isolated function deleteContact(ContactDeleteRequest payload, map<string|string[]> headers = {}, *DeleteContactQueries queries) returns ContactDeleteResponse|error {
        string resourcePath = string `/contacts/v1/contacts/actions/delete`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Get Contact Delete Request Details
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Successful response 
    remote isolated function getContactDeleteRequests(map<string|string[]> headers = {}, *GetContactDeleteRequestsQueries queries) returns ContactDeleteRequestsResponse|error {
        string resourcePath = string `/contacts/v1/contacts/analytics/deleterequests`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Get Contact Preferences
    #
    # + contactKey - The contact key of the contact whose preferences are to be retrieved
    # + headers - Headers to be sent with the request 
    # + return - Successful response 
    remote isolated function getContactPreferencesByKey(string contactKey, map<string|string[]> headers = {}) returns ContactPreferencesResponse|error {
        string resourcePath = string `/contacts/v1/contacts/key:${getEncodedUri(contactKey)}/preferences`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Upsert Contact Preferences
    #
    # + headers - Headers to be sent with the request 
    # + payload - Payload to be sent with the request 
    # + return - Successful response 
    remote isolated function upsertContactPreferences(ContactPreferencesRequest payload, map<string|string[]> headers = {}) returns UpsertContactPreferencesResponse|error {
        string resourcePath = string `/contacts/v1/contacts/preferences`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Search Contact Preferences
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + payload - Payload to be sent with the request 
    # + return - Successful response 
    remote isolated function searchContactPreferences(SearchPreferencesRequest payload, map<string|string[]> headers = {}, *SearchContactPreferencesQueries queries) returns SearchPreferencesResponse|error {
        string resourcePath = string `/contacts/v1/contacts/preferences/search`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Get Content Assets
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - List of content assets 
    remote isolated function getAssets(map<string|string[]> headers = {}, *GetAssetsQueries queries) returns AssetList|error {
        string resourcePath = string `/asset/v1/content/assets`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Create Content Asset
    #
    # + headers - Headers to be sent with the request 
    # + payload - Payload to be sent with the request 
    # + return - Content asset created successfully 
    remote isolated function createAsset(UpsertAsset payload, map<string|string[]> headers = {}) returns Asset|error {
        string resourcePath = string `/asset/v1/content/assets`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Delete Content Asset
    #
    # + id - ID of the content asset to delete
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - Content asset deleted successfully 
    remote isolated function deleteAsset(int id, map<string|string[]> headers = {}, *DeleteAssetQueries queries) returns error? {
        string resourcePath = string `/asset/v1/content/assets/${getEncodedUri(id)}`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->delete(resourcePath, headers = headers);
    }

    # Update Content Asset
    #
    # + id - ID of the content asset to update
    # + headers - Headers to be sent with the request 
    # + payload - Payload to be sent with the request 
    # + return - Content asset updated successfully 
    remote isolated function updateAsset(int id, UpsertAsset payload, map<string|string[]> headers = {}) returns Asset|error {
        string resourcePath = string `/asset/v1/content/assets/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->patch(resourcePath, request, headers);
    }

    # Get Content Categories
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - List of content categories 
    remote isolated function getCategories(map<string|string[]> headers = {}, *GetCategoriesQueries queries) returns CategoryList|error {
        string resourcePath = string `/asset/v1/content/categories`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Create Content Category
    #
    # + headers - Headers to be sent with the request 
    # + payload - Payload to be sent with the request 
    # + return - Content category created successfully 
    remote isolated function createCategory(CreateCategory payload, map<string|string[]> headers = {}) returns Category|error {
        string resourcePath = string `/asset/v1/content/categories`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Get Email Definitions
    #
    # + headers - Headers to be sent with the request 
    # + queries - Queries to be sent with the request 
    # + return - List of email definitions 
    remote isolated function getEmailDefinitions(map<string|string[]> headers = {}, *GetEmailDefinitionsQueries queries) returns EmailDefinitionList|error {
        string resourcePath = string `/messaging/v1/email/definitions`;
        resourcePath = resourcePath + check getPathForQueryParam(queries);
        return self.clientEp->get(resourcePath, headers);
    }

    # Create Email Definition
    #
    # + headers - Headers to be sent with the request 
    # + payload - Payload to be sent with the request 
    # + return - Email definition created successfully 
    remote isolated function createEmailDefinition(CreateEmailDefinition payload, map<string|string[]> headers = {}) returns EmailDefinition|error {
        string resourcePath = string `/messaging/v1/email/definitions`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Send Email Message
    #
    # + headers - Headers to be sent with the request 
    # + payload - Payload to be sent with the request 
    # + return - Email message accepted for processing 
    remote isolated function sendEmailMessage(SendEmailMessageRequest payload, map<string|string[]> headers = {}) returns SendEmailMessageResponse|error {
        string resourcePath = string `/messaging/v1/email/messages`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Import Data Extension File (Async)
    #
    # + headers - Headers to be sent with the request 
    # + payload - Payload containing import details such as file location and data extension key 
    # + return - Import request accepted for processing 
    remote isolated function importDataExtensionAsync(ImportRequest payload, map<string|string[]> headers = {}) returns ImportResponse|error {
        string resourcePath = string `/data/v1/async/import`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }

    # Get Data Extension Import Summary
    #
    # + id - The unique identifier for the import operation
    # + headers - Headers to be sent with the request 
    # + return - Import summary retrieved successfully 
    remote isolated function getImportSummary(int id, map<string|string[]> headers = {}) returns ImportSummaryResponse|error {
        string resourcePath = string `/data/v1/async/import/${getEncodedUri(id)}/summary`;
        return self.clientEp->get(resourcePath, headers);
    }

    # Bulk Ingest Data Extension Rows
    #
    # + headers - Headers to be sent with the request 
    # + payload - Payload to be sent with request 
    # + return - Bulk ingest request accepted and processed 
    remote isolated function createBulkIngestJob(CreateBulkIngestJob payload, map<string|string[]> headers = {}) returns CreateBulkIngestJobResponse|error {
        string resourcePath = string `/data/v1/bulk/ingest`;
        http:Request request = new;
        json jsonBody = jsondata:toJson(payload);
        request.setPayload(jsonBody, "application/json");
        return self.clientEp->post(resourcePath, request, headers);
    }
}
