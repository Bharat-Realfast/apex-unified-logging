
@isTest
private class Log_6_Tests {

    @testSetup
    static void setup() {
        // For bypassing related triggers
        TriggerHandler.bypass('AccountTriggerHandler');
        TriggerHandler.bypass('MDTAccountTriggerHandler');
    }

    // Test Method for Happy Path
    @isTest
    static void testErrorMethodWithValues() {
        // Prepare data
        List<Object> dataList = new List<Object>{'Test1', 'Test2'};

        // Mock Log class behavior
        Log.IS_ENABLED = true;

        // Call the method to test and assert no exceptions are thrown
        try {
            Log.error(dataList);
            System.assert(true);
        } catch (Exception e) {
            System.assert(false, 'Unexpected exception: ' + e.getMessage());
        }
    }

    // Test Method for Sad Path
    @isTest
    static void testErrorMethodWithEmptyList() {
        // Prepare data
        List<Object> dataList = new List<Object>();

        // Mock Log class behavior
        Log.IS_ENABLED = true;

        // Call the method to test and assert no exceptions are thrown
        try {
            Log.error(dataList);
            System.assert(true);
        } catch (Exception e) {
            System.assert(false, 'Unexpected exception: ' + e.getMessage());
        }
    }

    // Test Method for Exceptional Scenario
    @isTest
    static void testErrorMethodWithNull() {
        // Prepare data
        List<Object> dataList = null;

        // Mock Log class behavior
        Log.IS_ENABLED = true;

        // Call the method to test and assert no exceptions are thrown
        try {
            Log.error(dataList);
            System.assert(true);
        } catch (Exception e) {
            System.assert(false, 'Unexpected exception: ' + e.getMessage());
        }
    }
}
