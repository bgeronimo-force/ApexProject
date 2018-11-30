public with sharing class ContactAndLeadSearch {
    public static List<List<SObject>> searchContactsAndLeads(String searchQuery) {

        List<List<sObject>> searchList = [FIND :searchQuery IN NAME FIELDS RETURNING Lead(FirstName,LastName), Contact(FirstName,LastName)];

        return searchList;

    }
}