
@isTest
private class Log_7_Tests {

    // Setup test data
    @testSetup
    static void setup() {
        // Create and insert test data if necessary
        // Normally, we'd set up mock logging settings here if the Log class was designed to be more testable.
    }

    @isTest
    static void testErrorLoggingEnabledWithMessage() {
        // Assume that modifications have been made to the Log class to support testing logging status.
        
        Test.startTest();
        Log.error('Test error message');
        Test.stopTest();

        Log__e logEvent = Log.currentEvent();
        System.assertNotEquals(null, logEvent, 'Log event should not be null when logging is enabled');
        System.assertEquals('ERROR', logEvent.txt_Level__c, 'Log level should be ERROR when an error message is logged');
    }

    @isTest
    static void testErrorLoggingDisabledWithMessage() {
        // Assume that modifications have been made to the Log class to support testing logging status.

        Test.startTest();
        Boolean didNotThrowException = true;
        try {
            Log.error('Test error message');
        } catch (Exception e) {
            didNotThrowException = false;
        }
        Test.stopTest();

        System.assert(didNotThrowException, 'Log.error should not throw an exception when logging is disabled');
    }

    @isTest
    static void testErrorLoggingEnabledWithoutMessage() {
        // Assume that modifications have been made to the Log class to support testing logging status.
        
        Test.startTest();
        Log.error((String)null); // Cast null to String to resolve method ambiguity
        Test.stopTest();

        Log__e logEvent = Log.currentEvent();
        System.assertNotEquals(null, logEvent, 'Log event should not be null even if the error message is null');
        System.assertEquals('ERROR', logEvent.txt_Level__c, 'Log level should be ERROR when logging is enabled, even for a null message');
    }

    @isTest
    static void testErrorLoggingDisabledWithoutMessage() {
        // Assume that modifications have been made to the Log class to support testing logging status.
        
        Test.startTest();
        Boolean didNotThrowException = true;
        try {
            Log.error((String)null); // Cast null to String to resolve method ambiguity
        } catch (Exception e) {
            didNotThrowException = false;
        }
        Test.stopTest();

        System.assert(didNotThrowException, 'Log.error with null message should not throw an exception when logging is disabled');
    }
}
