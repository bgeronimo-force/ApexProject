public with sharing class AccountUtils {
    public static List<Account> accountsByState(String billingState) {
        List<Account> accts = [SELECT ID, Name FROM Account WHERE BillingState LIKE :billingState]; 
        return accts;

    }
}