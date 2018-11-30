public with sharing class AccountTriggerHandler {
    public static void CreateAccounts (List<Account> accts) {
        //List<Account> acctToInsert = new List<Account>();
        for (Account a : accts) {
            a.ShippingState = a.BillingState;
        }
       // insert acctToInsert;
    }
}