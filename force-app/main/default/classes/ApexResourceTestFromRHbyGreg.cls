/*
Write a restAPi to return list of contacts for a given Account that are created after May 1st 2019.  
Uri should be api/getContacts?accountId=123456

{
"Total Contacts":"2
Contacts":{
    "FirstName":"”Rammm”",
    "LastName":"”Ramlast”",
    "Email":"abc@gmail.com"
},
{
    "FirstName":"”Swan”",
    "LastName":"”SwanLast”",
    "Email":"abc@gmail.com"
}
*/

@RestResource(UrlMapping='/api/getContacts/')
global with sharing class Contact_Rest_Resource {
  // call to endpoint
  // https://[salesforceMyDomainName].lightning.force.com/services/apexrest/api/getContacts?accountId=123456
  @HttpGet
  global static List<Contact> getContactsbyAccountId(Id accountId) {
    RestRequest req = RestContext.request;
    Id accountId = req.params;

    // Possible Improvements:
    // validate params to accept only the expected
    // validate the need for using scape single quote to prevent SOQL injection
    // validate fields before assigning them to prevent nullpointer
    // validate CRUD permissions as for PMDs best practice
    // separate the query into a Selector class for the sake of SoC.
    List<Contact> contactsByAcctId = [
      SELECT Id, (SELECT FirstName, LastName, Email FROM Contacts)
      FROM Account
      WHERE Id = :accountId AND CreatedDate > 2019-05-01T00:00:00.000+0000
      LIMIT 10
    ];

    return contactsByAcctId;
  }
}

/*
[
  {
    "attributes": {
      "type": "Account",
      "url": "/services/data/v55.0/sobjects/Account/0015300000FjftCAAR"
    },
    "Id": "0015300000FjftCAAR",
    "Contacts": {
      "totalSize": 1,
      "done": true,
      "records": [
        {
          "attributes": {
            "type": "Contact",
            "url": "/services/data/v55.0/sobjects/Contact/0035300000AoEg7AAF"
          },
          "FirstName": "Jack",
          "LastName": "Rogers",
          "Email": "jrogers@burlington.com"
        }
      ]
    }
  }
]
*/

