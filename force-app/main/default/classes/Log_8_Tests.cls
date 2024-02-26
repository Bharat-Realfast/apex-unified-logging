
@isTest
private class Log_8_Tests {

    @testSetup
    static void setup() {
        // Assuming Settings__c has a field named 'dat_LogViaEvents__c' that determines if logging is enabled.
        Settings__c testSettings = new Settings__c(dat_LogViaEvents__c = Date.today());
        insert testSettings;
    }
    
    @isTest
    static void testErrorLogWithMessageAndValues() {
        List<Object> values = new List<Object>{'Error1', 404};
        Log.error('An error occurred: {0} with code {1}', values);
        Log__e logEvent = Log.currentEvent();
        
        System.assertNotEquals(null, logEvent, 'The log event should not be null.');
        System.assertEquals('ERROR', logEvent.txt_Level__c, 'The log level should be ERROR.');
    }
    
    @isTest
    static void testErrorLogWithMessageAndEmptyValues() {
        Log.error('An error occurred with no additional values', new List<Object>());
        Log__e logEvent = Log.currentEvent();
        
        System.assertNotEquals(null, logEvent, 'The log event should not be null.');
        System.assert(logEvent.txl_Data__c.contains('An error occurred with no additional values'), 'The log message should be present in the data.');
    }
    
    // The following test could be used to verify behavior when logging is not enabled,
    // but since the mechanism to enable/disable logging is not clear from the provided context,
    // it's not included in the test class.
    // @isTest
    // static void testErrorLogWithLoggingDisabled() {
    //   // Implement this test according to your project's specific mechanism for disabling logging.
    // }
}
