public class ContactManager {
    
    public static ID addContact(String lastNameToInsert, String firstNameToInsert) {
		Contact contactToAdd = new Contact(firstName=firstNameToInsert, lastName=lastNameToInsert);
		
        insert contactToAdd;
		return contacttoadd.Id;
    }
}