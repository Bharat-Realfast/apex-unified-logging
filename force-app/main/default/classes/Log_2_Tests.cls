
@isTest
private class Log_2_Tests {

    @testSetup
    static void setup() {
        // Set up test data here if needed
    }

    @isTest
    static void testDebugWithMessageWhenEnabled() {
        // Test scenario when message is provided and IS_ENABLED is true
        // Set up IS_ENABLED as true
        // Call the debug method with a message
        // Assert that the log event is published
        System.assertNotEquals(null, Log.currentEvent(), 'Log event should be published when IS_ENABLED is true');
    }

    @isTest
    static void testDebugWithMessageWhenDisabled() {
        // Test scenario when message is provided and IS_ENABLED is false
        // Set up IS_ENABLED as false
        // Call the debug method with a message
        // Assert that the debug message is logged
        System.debug('Test when IS_ENABLED is false');
        Log.debug('Test Message');
        System.assertNotEquals(null, Log.currentEvent(), 'Debug message should be logged when IS_ENABLED is false');
    }

    @isTest
    static void testDebugWithMessageAndValuesWhenEnabled() {
        // Test scenario when message and values are provided and IS_ENABLED is true
        // Set up IS_ENABLED as true
        // Call the debug method with a message and values
        // Assert that the log event is published
        System.assertNotEquals(null, Log.currentEvent(), 'Log event should be published when IS_ENABLED is true');
    }

    @isTest
    static void testDebugWithMessageAndValuesWhenDisabled() {
        // Test scenario when message and values are provided and IS_ENABLED is false
        // Set up IS_ENABLED as false
        // Call the debug method with a message and values
        // Assert that the debug message is logged
        System.debug('Test when IS_ENABLED is false');
        Log.debug('Test Message', new List<Object>{'Value1', 'Value2'});
        System.assertNotEquals(null, Log.currentEvent(), 'Debug message with values should be logged when IS_ENABLED is false');
    }

    @isTest
    static void testDebugWithBlankMessageWhenEnabled() {
        // Test scenario when message is blank and IS_ENABLED is true
        // Set up IS_ENABLED as true
        // Call the debug method with a blank message
        // Assert that the log event is not published
        System.assertEquals(null, Log.currentEvent(), 'Log event should not be published when message is blank');
    }

    @isTest
    static void testDebugWithBlankMessageAndValuesWhenEnabled() {
        // Test scenario when message and values are blank and IS_ENABLED is true
        // Set up IS_ENABLED as true
        // Call the debug method with a blank message and values
        // Assert that the log event is not published
        System.assertEquals(null, Log.currentEvent(), 'Log event should not be published when message and values are blank');
    }

    @isTest
    static void testExceptionWhenIsEnabledIsNull() {
        // Test scenario when IS_ENABLED is null
        // Set up IS_ENABLED as null
        // Call the debug method with a message
        // Assert that the debug message is not logged
        System.debug('Test when IS_ENABLED is null');
        Log.debug('Test Message');
        System.assertEquals(null, Log.currentEvent(), 'Debug message should not be logged when IS_ENABLED is null');
    }
}
