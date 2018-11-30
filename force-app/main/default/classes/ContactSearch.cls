public with sharing class ContactSearch {
    public static List<Contact> searchForContacts(String lastName, String mailingPostalCode) {

        List<Contact> cnts = [SELECT ID, FirstName, LastName FROM Contact WHERE LastName=:lastName AND MailingPostalCode=:mailingPostalCode];
        return cnts;

    }
}