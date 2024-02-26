
@isTest
private class Log_2_Tests {

    @testSetup
    static void setup() {
        // Create a test setting to enable logging through events for today
        Settings__c settings = Settings__c.getOrgDefaults();
        settings.dat_LogViaEvents__c = System.today();
        upsert settings;

        // Here you would normally bypass triggers if needed
    }
    
    @isTest
    static void testDebugLoggingEnabled() {
        // Setting up the custom settings to enable event logging
        Settings__c settings = Settings__c.getOrgDefaults();
        settings.dat_LogViaEvents__c = System.today();
        upsert settings;

        // Assuming custom setting is enabled for today
        Test.startTest();
        Log.debug('Test message');
        Test.stopTest();
        
        // Assertions
        Log__e eventLog = Log.currentEvent();
        System.assertNotEquals(null, eventLog, 'Event log should not be null when logging is enabled.');
        System.assertEquals('DEBUG', eventLog.txt_Level__c, 'Log level should be DEBUG.');
    }
    
    @isTest
    static void testDebugLoggingDisabled() {
        // Setting up the custom settings to disable event logging
        Settings__c settings = Settings__c.getOrgDefaults();
        settings.dat_LogViaEvents__c = System.today().addDays(-1); // Set to yesterday
        upsert settings;

        // Running the debug method when logging is disabled
        Test.startTest();
        Log.debug('Test message');
        Test.stopTest();
        
        // Assertions
        Log__e eventLog = Log.currentEvent();
        System.assertEquals(null, eventLog, 'Event log should be null when logging is disabled.');
    }
}
