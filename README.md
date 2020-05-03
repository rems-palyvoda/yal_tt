##### Project description
API controller accepts an HTTP POST request containing a JSON string.
Sample JSON is stored in the file `spec/test.json`

Once the API is called from outside of the application persist request data in the database. It creates two resources from the JSON: Ticket and Excavator. Tickets are the main object and Excavator belongs to the Ticket. Attributes that should be persisted to the database for both objects are described below.

Ticket fields:
- RequestNumber
- SequenceNumber
- RequestType
- DateTimes->ResponseDueDateTime
- ServiceArea->PrimaryServiceAreaCode->SACode,
- ServiceArea->AdditionalServiceAreaCodes->SACode
- DigsiteInfo->WellKnownText (can be saved as plain text)

Excavator fields:
- Excavator->CompanyName
- Excavator->Address (full address including city, zip etc - can be one string) - Excavator->CrewOnSite

Regular controller shows HTML views for the tickets and also include excavator data.

DigsiteInfo->WellKnownText has polygon data which is plotted on a map on the ticket show view.