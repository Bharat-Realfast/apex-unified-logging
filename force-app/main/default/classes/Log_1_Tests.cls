
@isTest
private class Log_1_Tests {

    @testSetup
    static void setupTestData() {
        // Create test data if needed
    }

    @isTest
    static void testDebugWithoutMessageAndValues() {
        // Test the debug method when called without message and values
        Log.debug();
        System.assertNotEquals(null, Log_1_Tests.currentEvent());
    }

    @isTest
    static void testDebugWithMessageOnly() {
        // Test the debug method when called with a message only
        String message = 'Test Message';
        Log.debug(message);
        System.assertNotEquals(null, Log_1_Tests.currentEvent());
    }

    @isTest
    static void testDebugWithValuesOnly() {
        // Test the debug method when called with values only
        List<Object> values = new List<Object>{ 'Value1', 2, 3.5 };
        Log.debug(values);
        System.assertNotEquals(null, Log_1_Tests.currentEvent());
    }

    @isTest
    static void testDebugWithMessageAndValues() {
        // Test the debug method when called with both message and values
        String message = 'Test Message';
        List<Object> values = new List<Object>{ 'Value1', 2, 3.5 };
        Log.debug(message, values);
        System.assertNotEquals(null, Log_1_Tests.currentEvent());
    }

    @isTest
    static void testErrorWithoutMessageAndValues() {
        // Test the error method when called without message and values
        Log.error();
        System.assertNotEquals(null, Log_1_Tests.currentEvent());
    }

    @isTest
    static void testErrorWithMessageOnly() {
        // Test the error method when called with a message only
        String message = 'Error Message';
        Log.error(message);
        System.assertNotEquals(null, Log_1_Tests.currentEvent());
    }

    @isTest
    static void testErrorWithValuesOnly() {
        // Test the error method when called with values only
        List<Object> values = new List<Object>{ 'Value1', 2, 3.5 };
        Log.error(values);
        System.assertNotEquals(null, Log_1_Tests.currentEvent());
    }

    @isTest
    static void testErrorWithMessageAndValues() {
        // Test the error method when called with both message and values
        String message = 'Error Message';
        List<Object> values = new List<Object>{ 'Value1', 2, 3.5 };
        Log.error(message, values);
        System.assertNotEquals(null, Log_1_Tests.currentEvent());
    }
}
