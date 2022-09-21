@RestResource(urlMapping='/getContacts')
global with sharing class REST_Service_Account {
  @HttpGet
  global static List<Account> getContactsByAccountId() {
    Id accountId = (Id) RestContext.request.params.get('Id');
    List<Account> contactsByAccountId = [
      SELECT Id, (SELECT FirstName, LastName, Email FROM Contacts)
      FROM Account
      WHERE Id = :accountId AND CreatedDate > 2019-05-01T00:00:00.000+0000
      WITH SECURITY_ENFORCED
      LIMIT 10
    ];
    return contactsByAccountId;
  }
}

// Testing it via workbench
// rest explorer >> Get Method
// /services/apexrest/getContacts?Id=0015300000FjftCAAR

/* _________________________________________________________________________________ 
Output from code above:

  HTTP/1.1 200 OK
  Date: Wed, 21 Sep 2022 17:54:23 GMT
  Set-Cookie: CookieConsentPolicy=0:1; path=/; expires=Thu, 21-Sep-2023 17:54:23 GMT; Max-Age=31536000
  Set-Cookie: LSKey-c$CookieConsentPolicy=0:1; path=/; expires=Thu, 21-Sep-2023 17:54:23 GMT; Max-Age=31536000
  Strict-Transport-Security: max-age=63072000; includeSubDomains
  X-Content-Type-Options: nosniff
  X-XSS-Protection: 1; mode=block
  X-Robots-Tag: none
  Cache-Control: no-cache,must-revalidate,max-age=0,no-store,private
  Set-Cookie: BrowserId=bTAmaznWEe2d9PdsZNr4WQ; domain=.salesforce.com; path=/; expires=Thu, 21-Sep-2023 17:54:23 GMT; Max-Age=31536000
  Content-Type: application/json;charset=UTF-8
  Vary: Accept-Encoding
  Content-Encoding: gzip
  Transfer-Encoding: chunked


  [ {
    "attributes" : {
      "type" : "Account",
      "url" : "/services/data/v55.0/sobjects/Account/0015300000FjftCAAR"
    },
    "Id" : "0015300000FjftCAAR",
    "Contacts" : {
      "totalSize" : 2,
      "done" : true,
      "records" : [ {
        "attributes" : {
          "type" : "Contact",
          "url" : "/services/data/v55.0/sobjects/Contact/0035300000AoEg7AAF"
        },
        "AccountId" : "0015300000FjftCAAR",
        "Id" : "0035300000AoEg7AAF",
        "FirstName" : "Jack",
        "LastName" : "Rogers",
        "Email" : "jrogers@burlington.com"
      }, {
        "attributes" : {
          "type" : "Contact",
          "url" : "/services/data/v55.0/sobjects/Contact/0035300000Arzu4AAB"
        },
        "AccountId" : "0015300000FjftCAAR",
        "Id" : "0035300000Arzu4AAB",
        "FirstName" : "John",
        "LastName" : "Doe",
        "Email" : "johndoe@gmail.com.dev.test"
      } ]
    }
  } ]
*/
/* _________________________________________________________________________________ 

Possible Improvements:

validate params to accept only the expected
validate the need for using scape single quote to prevent SOQL injection
validate fields before assigning them to prevent nullpointer exception
If it's needed to process any DML, validate CRUD permissions as for PMDs best practice
  if (!Schema.sObjectType.Contact.fields.Status__c.isUpdateable()) {
          return null;
      }
separate the query into a Selector class for the sake of SoC.
*/

