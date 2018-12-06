public with sharing class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numCnts, String lastName) {
        List<Contact> cnts = new List<Contact>();
        
        for(Integer i=0;i<numCnts;i++) {
            Contact c = new Contact(FirstName='Test ' + i, LastName=lastName);
            cnts.add(c);
        }
        
        return cnts;
    }
}