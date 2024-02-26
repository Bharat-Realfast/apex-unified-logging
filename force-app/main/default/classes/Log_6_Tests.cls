
@isTest
private class Log_6_Tests {

    @testSetup
    static void setup() {
        // Set up test data if necessary
        // If your real org uses specific settings to determine logging behavior, create and insert mock records here
        // Example (commented out):
        // Settings__c settings = new Settings__c(Name = 'Default', dat_LogViaEvents__c = System.today());
        // insert settings;
    }

    @isTest
    static void testErrorWithValuesWhenLoggingEnabled() {
        // Prepare your test to simulate the condition when logging is enabled
        // If this involves setting a flag, custom setting or custom permission, do so here
        
        Test.startTest();

        // Call the method under test
        List<Object> valuesToLog = new List<Object>{'Test Error Message', 500, 'Internal Server Error'};
        Log.error(valuesToLog);

        // Perform assertions
        Log__e logEvent = Log.currentEvent();
        System.assertNotEquals(null, logEvent, 'Expected Log__e event to be created when logging is enabled.');
        System.assertEquals('ERROR', logEvent.txt_Level__c, 'Log level of the event should be ERROR.');

        Test.stopTest();
    }

    @isTest
    static void testErrorWithValuesWhenLoggingDisabled() {
        // Prepare your test to simulate the condition when logging is disabled
        // If this involves setting a flag, custom setting or custom permission, do so here
        
        Test.startTest();

        // Call the method under test
        List<Object> valuesToLog = new List<Object>{'Test Error Message', 404, 'Not Found'};
        Log.error(valuesToLog);

        // Perform assertions
        Log__e logEvent = Log.currentEvent();
        System.assertEquals(null, logEvent, 'Expected no Log__e event to be created when logging is disabled.');

        Test.stopTest();
    }
}
