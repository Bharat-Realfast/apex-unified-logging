
@isTest
private class Log_4_Tests {
    @testSetup
    static void setupTestData() {
        // Create test data setup here
    }

    @isTest
    static void testDebugWithMessageAndValues() {
        // Test the debug method with message and values
        String message = 'Test Message';
        List<Object> values = new List<Object>{1, 'Value'};
        Log.debug(message, values);
        // Add assertions here
        // You may need to assert the behavior indirectly based on the expected effect of the debug method (e.g., checking if a Log__e record was created)
        System.assertNotEquals(null, Log_4_Tests.currentEvent());
    }

    @isTest
    static void testDebugWithMessage() {
        // Test the debug method with only message
        String message = 'Test Message';
        Log.debug(message);
        // Add assertions here
        // You may need to assert the behavior indirectly based on the expected effect of the debug method (e.g., checking if a Log__e record was created)
        System.assertNotEquals(null, Log_4_Tests.currentEvent());
    }

    @isTest
    static void testDebugWithValues() {
        // Test the debug method with only values
        List<Object> values = new List<Object>{1, 'Value'};
        Log.debug(values);
        // Add assertions here
        // You may need to assert the behavior indirectly based on the expected effect of the debug method (e.g., checking if a Log__e record was created)
        System.assertNotEquals(null, Log_4_Tests.currentEvent());
    }

    @isTest
    static void testErrorWithMessageAndValues() {
        // Test the error method with message and values
        String message = 'Test Error Message';
        List<Object> values = new List<Object>{1, 'Error Value'};
        Log.error(message, values);
        // Add assertions here
        // You may need to assert the behavior indirectly based on the expected effect of the error method (e.g., checking if a Log__e record was created)
        System.assertNotEquals(null, Log_4_Tests.currentEvent());
    }

    @isTest
    static void testErrorWithMessage() {
        // Test the error method with only message
        String message = 'Test Error Message';
        Log.error(message);
        // Add assertions here
        // You may need to assert the behavior indirectly based on the expected effect of the error method (e.g., checking if a Log__e record was created)
        System.assertNotEquals(null, Log_4_Tests.currentEvent());
    }

    @isTest
    static void testErrorWithValues() {
        // Test the error method with only values
        List<Object> values = new List<Object>{1, 'Error Value'};
        Log.error(values);
        // Add assertions here
        // You may need to assert the behavior indirectly based on the expected effect of the error method (e.g., checking if a Log__e record was created)
        System.assertNotEquals(null, Log_4_Tests.currentEvent());
    }
}
