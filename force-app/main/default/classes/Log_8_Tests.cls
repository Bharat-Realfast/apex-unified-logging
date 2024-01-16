
@isTest
private class Log_8_Tests {

    @isTest
    static void testErrorWithMessageAndValues() {
        // Test when error method is called with both message and values
        // Create test data
        String message = 'Test Error Message';
        List<Object> values = new List<Object>{ 'Value1', 'Value2' };

        // Call the method
        Log.error(message, values);

        // Assertions
        System.assertNotEquals(null, Log.currentEvent(), 'An event should be logged for error method with message and values');
        // Add assertion to check the level of logging
    }

    @isTest
    static void testErrorWithMessageOnly() {
        // Test when error method is called with only message
        // Create test data
        String message = 'Test Error Message';

        // Call the method
        Log.error(message);

        // Assertions
        System.assertNotEquals(null, Log.currentEvent(), 'An event should be logged for error method with message only');
        // Add assertion to check the level of logging
    }

    @isTest
    static void testErrorWithValuesOnly() {
        // Test when error method is called with only values
        // Create test data
        List<Object> values = new List<Object>{ 'Value1', 'Value2' };

        // Call the method
        Log.error(values);

        // Assertions
        System.assertNotEquals(null, Log.currentEvent(), 'An event should be logged for error method with values only');
        // Add assertion to check the level of logging
    }

    @isTest
    static void testErrorWithoutMessageAndValues() {
        // Test when error method is called without message and values
        // Call the method
        Log.error();

        // Assertions
        System.assertNotEquals(null, Log.currentEvent(), 'An event should be logged for error method without message and values');
        // Add assertion to check the level of logging
    }
}
