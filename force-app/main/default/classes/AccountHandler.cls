public with sharing class AccountHandler {
    public static Account insertNewAccount (String name) {
        Account acct = new Account();
        try {
            acct.name = name;
            insert acct;
        } catch (DmlException e) {
            acct = null;
        }
        return acct;
    }
}