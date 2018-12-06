@RestResource(urlMapping='/CreateAccountContactWS/*')
global with sharing class CreateAccountContactWS {
    
    
   /*
    * "nomeAccount": "TestAccount147",
	"cognomeContact": "TestContact891",
	"nomeOpportunity":"Opportunity789"
	*/
    global class WrapperTest {
        String nomeAccount;
        String cognomeContact;
        String nomeOpportunity;
    }
    
    @HttpGet
    global static void doGet(){}

	@HttpPost
	global static String CreateAccountWithContact(WrapperTest wrapper){
        
        Account acct = new Account();
		//Check if account exist
		List<Account> accts = [SELECT Id FROM Account WHERE Name = :wrapper.nomeAccount];
        if (accts.size() == 0) {
            // Create an account with a contact and insert to system
        	acct.Name = wrapper.nomeAccount;
			insert acct;  
            System.debug(LoggingLevel.DEBUG,'Account does not exist'+acct.Id);
        } else {
            acct = accts[0];
            System.debug(LoggingLevel.DEBUG,'Account exist');
        }
        
        //System.debug(LoggingLevel.DEBUG,'-- ACCOUNT AD --'+acct.Id);
		
		Contact cnt = new Contact(LastName=wrapper.cognomeContact, AccountId=acct.Id);
		insert cnt;
        
        System.debug(LoggingLevel.DEBUG,'-- CONTACT ID --'+cnt.Id);
        
        Opportunity opp = new Opportunity(Name=wrapper.nomeOpportunity,
                                       StageName='Prospecting',
                                       CloseDate=System.today().addMonths(1),
                                       AccountId=acct.Id);
        insert opp;
        
        System.debug(LoggingLevel.DEBUG,'-- OPPORTUNITY ID --'+opp.Id);
		
		return opp.Id;
		
	}
}