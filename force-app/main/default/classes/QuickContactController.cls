public with sharing class QuickContactController {
    
    @AuraEnabled
    public static Account getAccount (Id accountId) {
        //Account acct = [SELECT Id, Name FROM Account WHERE Id =: accountId LIMIT 1];
        //return acct;
        return [SELECT Name, BillingCity, BillingState FROM Account WHERE Id = :accountId];
    }
    
    @AuraEnabled
    public static Contact saveContactWithAccount (Contact contact, Id accountId) {
        contact.AccountId = accountId;
        upsert contact;
        return contact;
    }

}