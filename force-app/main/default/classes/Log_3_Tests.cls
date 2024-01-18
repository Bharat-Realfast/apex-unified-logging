
@isTest
private class Log_3_Tests {

    @testSetup
    static void setup() {
        // Test setup code here
    }

    @isTest
    static void testDebugWithValues() {
        TriggerHandler.bypass('AccountTriggerHandler');
        TriggerHandler.bypass('MDTAccountTriggerHandler');

        Test.startTest();

        // Attempt to log with a list of values
        try {
            List<Object> values = new List<Object>{'TestValue1', 123, true};
            Log.debug(values);
            // Pass the test if no exceptions are thrown
            System.assert(true);
        } catch (Exception e) {
            System.assert(false, 'Method threw an unexpected exception: ' + e.getMessage());
        }

        Test.stopTest();
    }

    @isTest
    static void testDebugWithEmptyValues() {
        TriggerHandler.bypass('AccountTriggerHandler');
        TriggerHandler.bypass('MDTAccountTriggerHandler');

        Test.startTest();

        // Attempt to log with an empty list of values
        try {
            List<Object> values = new List<Object>();
            Log.debug(values);
            // Pass the test if no exceptions are thrown
            System.assert(true);
        } catch (Exception e) {
            System.assert(false, 'Method threw an unexpected exception: ' + e.getMessage());
        }

        Test.stopTest();
    }
}
