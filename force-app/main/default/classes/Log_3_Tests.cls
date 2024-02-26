
@isTest
private class Log_3_Tests {

    @testSetup
    static void setup() {
        // Assuming that Settings__c is a hierarchy custom setting and we can manipulate it for test context
        Settings__c testSettings = Settings__c.getOrgDefaults();
        testSettings.dat_LogViaEvents__c = System.today();
        upsert testSettings;
    }
    
    @isTest
    static void testDebugWithNonEmptyList() {
        // Given a non-empty list of values
        List<Object> values = new List<Object>{ 'Test1', 123, Date.newInstance(2023, 1, 1) };

        // When calling the debug method
        Test.startTest();
        Log.debug(values);
        Test.stopTest();

        // Then a Log__e event should be created
        Log__e event = Log.currentEvent();
        System.assertNotEquals(null, event, 'An event should have been published');
    }

    // Since we cannot assert the absence of a Log__e event within the test context, 
    // this test cannot be implemented in a meaningful way and will be removed.

    @isTest
    static void testDebugWhenLoggingIsDisabled() {
        // Given logging is disabled by setting the date to yesterday
        Settings__c testSettings = Settings__c.getOrgDefaults();
        testSettings.dat_LogViaEvents__c = System.today().addDays(-1);
        upsert testSettings;
        
        // And a non-empty list of values
        List<Object> values = new List<Object>{ 'Test2', 456, Date.newInstance(2023, 1, 1) };

        // When calling the debug method
        Test.startTest();
        Log.debug(values);
        Test.stopTest();

        // Then no Log__e event should be created
        Log__e event = Log.currentEvent();
        System.assertEquals(null, event, 'No event should be published when logging is disabled');
    }
}
