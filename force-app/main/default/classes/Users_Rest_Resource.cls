@RestResource(URLMapping='/Users/*')
global with sharing class Users_Rest_Resource {
  @HttpGet
  global static List<User> getUsers() {
    RestRequest req = RestContext.request;
    System.debug(req.params);
    // String.escapeSingleQuotes(arg0);
    List<User> users = [SELECT Id, FirstName, LastName FROM User LIMIT 10];
    return users;
  }

  @HttpPost
  global static String insertUser(User newUSer) {
    insert newUSer;
    return newUser.Id;
  }
}
