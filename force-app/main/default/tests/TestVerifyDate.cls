@isTest
public with sharing class TestVerifyDate {
    @isTest
    public static void testDateValid() {
        Date data = VerifyDate.CheckDates(Date.newInstance(2018, 11, 01),Date.newInstance(2018, 11, 15));
        System.assertEquals(Date.newInstance(2018, 11, 15),data);
    }

    @isTest
    public static void testDateNotValid() {
        Date data = VerifyDate.CheckDates(Date.newInstance(2018, 11, 01),Date.newInstance(2018, 12, 15));
        System.assertEquals(Date.newInstance(2018, 11, 30),data);
    }
}