@RestResource(urlMapping='/LeadToOpportunity/*')
global with sharing class LeadToOpportunity {
   	global class LeadWrapper {
        String nameAccount;
        String lastName;
        String nameOpportunity;
        String stageName;
        Date closeDate;
    }
    
   	global class ResultWrapper {
        Boolean success;
        String error;
    }
    
    @HttpGet
    global static void doGet(){}
    
    @HttpPost
    global static String doConvert(LeadWrapper lw){
        
        Opportunity opp = new Opportunity();
        
        ResultWrapper r = new ResultWrapper();
        
        if (String.isEmpty(lw.nameAccount)) {
            r.error = 'The following field is empty: ' + 'nameAccount';
        } else {
            // Create Account
            Account acct = new Account();
            acct.Name = lw.nameAccount;
            insert acct;
            System.debug(LoggingLevel.DEBUG,'-- ACCOUNT ID --'+acct.Id);
            //r.result = 'Account Id' + acct.Id;
            
            if (String.isEmpty(lw.lastName)) {
                r.error = 'The following field is empty: ' + 'lastAccount';
            } else {
                // Create Contact
            	Contact cnt = new Contact(LastName=lw.lastName, AccountId=acct.Id);
                insert cnt;
                System.debug(LoggingLevel.DEBUG,'-- CONTACT ID --'+cnt.Id);
                //r.result = r.result += '\nContact Id: ' + cnt.Id;
                
                
                if (String.isEmpty(lw.nameOpportunity) || String.isEmpty(lw.stageName) || String.isEmpty(String.valueOf(lw.closeDate))) {
                   // lw.stageName = '';
                    r.error ='The following field is empty: name Opportunity, stage name, close Date';
                } else {
                    //Create Opportunity
                    opp.Name=lw.nameOpportunity;
                    opp.StageName=lw.stageName;
                    opp.CloseDate=System.today();
                    opp.AccountId=acct.Id;
                    insert opp;
                    System.debug(LoggingLevel.DEBUG,'-- OPPORTUNITY ID --'+opp.Id);
                }
            }
        }
        
        //System.debug('====> data: ' + JSON.serialize(r));
        
        if (!String.isEmpty(opp.Id))
        	return JSON.serialize(lw);
        else
            return JSON.serialize(r);

     

        
        /*Opportunity opp = new Opportunity(Name=lw.nameOpportunity,
                                       StageName=lw.stageName,
                                       CloseDate=lw.closeDate,
                                       AccountId=acct.Id);
        insert opp;
        
        System.debug(LoggingLevel.DEBUG,'-- OPPORTUNITY ID --'+opp.Id);
        
        return opp.Id;*/
        

        
        /*
        Lead myLead = new Lead(LastName=lw.lastName, Company=lw.nameAccount);
        insert myLead;
        
        Database.LeadConvert lc = new database.LeadConvert();
        lc.setLeadId(myLead.id);
        
        LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
        lc.setConvertedStatus(convertStatus.MasterLabel);
        
        Database.LeadConvertResult lcr = Database.convertLead(lc);
        System.assert(lcr.isSuccess());
        
        System.debug(LoggingLevel.DEBUG,'-- OPPORTUNITY ID --'+lcr.getOpportunityId());
        
        return lcr.getOpportunityId();
		*/
        

    }

}