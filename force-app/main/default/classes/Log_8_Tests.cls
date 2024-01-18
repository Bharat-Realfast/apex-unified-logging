
@isTest
private class Log_8_Tests {

    // Method to bypass trigger handlers
    private static void bypassTriggers() {
        TriggerHandler.bypass('AccountTriggerHandler');
        TriggerHandler.bypass('MDTAccountTriggerHandler');
    }

    // Happy Path Test
    @isTest
    static void testErrorWithValidMessageAndValues() {
        bypassTriggers();
        List<Object> values = new List<Object>{'Error detail 1', 123};
        Test.startTest();
        Log.error('Error message with details: {0}, {1}', values);
        Test.stopTest();
        
        // Assertions
        Log__e logEvent = Log.currentEvent();
        System.assertNotEquals(null, logEvent, 'The log event should not be null.');
        System.assert(logEvent.txl_Data__c.contains('Error message with details: Error detail 1, 123'), 'The error message should match expected format with values.');
    }

    // Sad Path Test
    @isTest
    static void testErrorWithInvalidFormat() {
        bypassTriggers();
        String message = 'This is a malformed message with placeholders: {0}, {1}';
        List<Object> values = new List<Object>{'Only one value'};
        
        Exception caughtException = null;
        
        try {
            Test.startTest();
            Log.error(message, values); // Expected to fail due to incorrect number of format arguments
            Test.stopTest();
        } catch (Exception e) {
            caughtException = e;
        }
        
        // Assertions
        System.assertNotEquals(null, caughtException, 'An exception should have been thrown due to incorrect number of format arguments.');
        System.assert(caughtException.getMessage().contains('Format string'), 'The exception message should indicate a problem with the format string.');
    }
    
    // Exceptional Scenario Test: Logging Enabled
    @isTest
    static void testErrorLoggingEnabled() {
        bypassTriggers();

        // Set up the test data to enable logging
        Settings__c settings = new Settings__c();
        settings.SetupOwnerId = UserInfo.getOrganizationId(); // Assuming this setting is org-wide
        settings.dat_LogViaEvents__c = System.today(); // Assuming this date field is used to enable logging
        insert settings;

        List<Object> values = new List<Object>{'Error detail'};
        Test.startTest();
        Log.error('An error has occurred: {0}', values);
        Test.stopTest();

        // Assertions
        Log__e logEvent = Log.currentEvent();
        System.assertNotEquals(null, logEvent, 'The log event should not be null.');
        System.assert(logEvent.txl_Data__c.contains('An error has occurred: Error detail'), 'The event data should contain the error message.');
    }
}
