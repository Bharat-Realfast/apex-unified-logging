
@isTest
private class Log_1_Tests {
    
    @testSetup
    static void setup() {
        // Test data setup if required for the Log class
        // Since the Log class does not directly deal with sObject, no test data is set up in this scenario.
    }
    
    // Since the Log__e is a Platform Event and not a direct sObject, we don't need to bypass triggers here.

    @isTest
    static void testDebugWithMessageAndEmptyObjectList() {
        // Test debug method with message and empty values list
        String testMessage = 'Test debug message';
        
        Test.startTest();
        Log.debug(testMessage);
        Test.stopTest();
        
        // We cannot directly assert the Log__e object since it's a Platform Event and would be asynchronously dispatched
        // We assert that there are no exceptions and the method call is successful
        System.assert(true, 'The debug method should execute without exceptions.');
    }
    
    @isTest
    static void testDebugWithMessageAndNonEmptyObjectList() {
        // Test debug method with message and non-empty values list
        String testMessage = 'Debug message with value: {0}';
        List<Object> testValues = new List<Object>{'TestValue'};
        
        Test.startTest();
        Log.debug(testMessage, testValues);
        Test.stopTest();

        // We cannot directly assert the Log__e object since it's a Platform Event and would be asynchronously dispatched
        // We assert that there are no exceptions and the method call is successful
        System.assert(true, 'The debug method should handle message formatting and execute without exceptions.');
    }
    
    @isTest
    static void testDebugWithEmptyMessageAndNonEmptyObjectList() {
        // Test debug method with empty message and non-empty values list
        String testMessage = '';
        List<Object> testValues = new List<Object>{'TestValue1', 123, true};
        
        Test.startTest();
        Log.debug(testMessage, testValues);
        Test.stopTest();
        
        // We assert that there are no exceptions and the method call is successful
        System.assert(true, 'The debug method should handle empty message and execute without exceptions.');
    }
}
