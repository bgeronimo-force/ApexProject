public with sharing class MyFirstComponentControllerApex {
    
    @AuraEnabled
    public static Account getAccount(Id accountId){
        Account acct = [SELECT Name,Phone,Website FROM Account WHERE Id =: accountId LIMIT 1];
        return acct;
    }
    
    @AuraEnabled
    public static User getOwner(Id accountId){
        Account acct = [SELECT OwnerId FROM Account WHERE Id =: accountId LIMIT 1];
        // System.debug(LoggingLevel.DEBUG,'-- Account ID --'+acct.OwnerID);
        User usr = [SELECT Name FROM User WHERE Id =: acct.OwnerID LIMIT 1];
        return usr;
    }
    
    @AuraEnabled
    public static List<Contact> getContacts(Id accountId){
        List<Contact> cnts = [SELECT Id, FirstName, LastName, Phone FROM Contact WHERE AccountId =: accountId];
        return cnts;
    }

}