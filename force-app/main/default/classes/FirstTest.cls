@RestResource(urlMapping='/Account/*')
global with sharing class FirstTest {
    
    @HttpGet
    global static void doGet(){}

    @HttpPost
    global static String doPost (String accountId) {

        List<Account> a = [SELECT Id,Name FROM Account WHERE ID = :accountId];
        
        System.debug(LoggingLevel.DEBUG,'-- ACCOUNT AD --'+a[0].Id);
        System.debug(LoggingLevel.DEBUG,'-- SIZE LIST --'+a.size());

        return a[0].Name;
    }
}