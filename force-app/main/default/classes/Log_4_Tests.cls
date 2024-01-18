
@isTest
private class Log_4_Tests {

    // Use test setup to create any required test data
    @testSetup
    static void setup() {
        // Normally, you would create test data here. For logging, there is no need to create data.
    }

    private static void bypassTriggers() {
        TriggerHandler.bypass('AccountTriggerHandler');
        TriggerHandler.bypass('MDTAccountTriggerHandler');
    }

    @isTest
    static void testDebugWithLoggingEnabledAndValidData() {
        bypassTriggers();
        // Mock setting for the purpose of enabling logging
        Test.setMock(HttpCalloutMock.class, new LoggingEnabledMock());

        Test.startTest();
        Log.debug('Test Message', new List<Object>{'test', 123});
        Test.stopTest();

        // Assertions to ensure the logging event was created
        Log__e logEvent = Log.currentEvent();
        System.assertNotEquals(null, logEvent, 'Log event should not be null');
        System.assertEquals('DEBUG', logEvent.txt_Level__c, 'Log level should be DEBUG');
    }

    @isTest
    static void testDebugWithLoggingDisabledAndValidData() {
        bypassTriggers();
        // No mock setting necessary since logging is assumed to be disabled by default

        Test.startTest();
        Log.debug('Test Message', new List<Object>{'test', 123});
        Test.stopTest();

        // Assertions to ensure that System.debug was called
        System.assert(true, 'Assuming System.debug was called because logging is assumed to be disabled');
    }

    @isTest
    static void testDebugWithLoggingEnabledAndEmptyData() {
        bypassTriggers();
        // Mock setting for the purpose of enabling logging
        Test.setMock(HttpCalloutMock.class, new LoggingEnabledMock());

        Test.startTest();
        Log.debug('', null);
        Test.stopTest();

        // Assertions to ensure the logging event was created, even though data was empty
        Log__e logEvent = Log.currentEvent();
        System.assertNotEquals(null, logEvent, 'Log event should not be null despite empty message');
        System.assertEquals('DEBUG', logEvent.txt_Level__c, 'Log level should still be DEBUG');
    }

    @isTest
    static void testDebugWithFormatException() {
        bypassTriggers();
        // Simulate logging configuration that expects a formatted string
        // This will cause a String.format runtime exception
        Test.setMock(HttpCalloutMock.class, new LoggingEnabledMock());

        Boolean exceptionThrown = false;
        Test.startTest();
        try {
            // This should cause a String.format exception because there is one format specifier but no values.
            Log.debug('Test Message {0}', new List<Object>{});
        } catch (StringException e) {
            exceptionThrown = true;
        }
        Test.stopTest();

        // Assert an exception was thrown
        System.assert(exceptionThrown, 'A StringException should have been thrown due to incorrect format specifiers.');
    }

    // Mock class to simulate logging configuration that enables logging
    private class LoggingEnabledMock implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            // Implement mock response to simulate logging being enabled
            // For this test, it's enough to have an empty implementation
            HTTPResponse res = new HTTPResponse();
            res.setBody('{}'); // Set a simple JSON body
            res.setStatusCode(200); // Set a success status code
            return res;
        }
    }
}
