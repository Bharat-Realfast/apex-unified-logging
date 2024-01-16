
@isTest
private class Log_7_Tests {
    @testSetup
    static void setupTestData() {
        // Create test data here if required for the scenarios
    }

    @isTest
    static void testErrorMethod_NoMessage() {
        // Test scenario where the error method is called without a message
        Test.startTest();
        Log.error();
        Test.stopTest();

        // Add assertion for the expected behavior
        System.assertNotEquals(null, Log.currentEvent(), 'Error event should be created');
    }

    @isTest
    static void testErrorMethod_WithMessage() {
        // Test scenario where the error method is called with a message
        Test.startTest();
        Log.error('Test Error Message');
        Test.stopTest();

        // Add assertion for the expected behavior
        System.assertNotEquals(null, Log.currentEvent(), 'Error event should be created with message');
    }

    @isTest
    static void testErrorMethod_WithValues() {
        // Test scenario where the error method is called with a list of values
        Test.startTest();
        Log.error(new List<Object>{'Value1', 'Value2'});
        Test.stopTest();

        // Add assertion for the expected behavior
        System.assertNotEquals(null, Log.currentEvent(), 'Error event should be created with values');
    }

    @isTest
    static void testErrorMethod_WithMessageAndValues() {
        // Test scenario where the error method is called with a message and a list of values
        Test.startTest();
        Log.error('Test Error Message', new List<Object>{'Value1', 'Value2'});
        Test.stopTest();

        // Add assertion for the expected behavior
        System.assertNotEquals(null, Log.currentEvent(), 'Error event should be created with message and values');
    }

    @isTest
    static void testErrorMethod_DisabledLog() {
        // Test scenario where the error method is called when logging is disabled
        // Disable/bypass the log before calling the error method
        TriggerHandler.bypass('LogTriggerHandler');

        Test.startTest();
        Log.error('Test Error Message', new List<Object>{'Value1', 'Value2'});
        Test.stopTest();

        // Add assertion for the expected behavior when log is disabled
        System.debug(Log.currentEvent());
        System.assertEquals(null, Log.currentEvent(), 'Error event should not be created when logging is disabled');
    }
}
