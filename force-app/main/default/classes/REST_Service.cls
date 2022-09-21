@RestResource(URLMapping='/AccountDML/*')
// https://dyno-ocean-9514-dev-ed.lightning.force.com/services/apexrest
global with sharing class REST_Service {
  @HttpPost
  global static String insertAccount(Account acct) {
    insert acct;
    return acct.id;
  }
}
