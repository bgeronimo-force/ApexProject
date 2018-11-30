@isTest
public with sharing class TestRestrictContactByName {
    @isTest
    public static void TestInvalidName() {
        // Test data setup
        // Create a contact invalid last name
        Contact cnt = new Contact(FirstName='Test',LastName='INVALIDNAME');
        
        // Perform test
        Test.startTest();
        Database.SaveResult result = Database.insert(cnt, false);
        Test.stopTest();
        // Verify 
        // In this case the deletion should have been stopped by the trigger,
        // so verify that we got back an error.
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('Last name invalid',
                             result.getErrors()[0].getMessage());
    }
}
