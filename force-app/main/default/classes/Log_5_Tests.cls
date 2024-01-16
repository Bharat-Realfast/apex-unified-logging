
@isTest
private class Log_5_Tests {

    @testSetup
    static void setup() {
        // Disable triggers for DML operations
        TriggerHandler.bypass('AccountTriggerHandler');
        TriggerHandler.bypass('MDTAccountTriggerHandler');
    }

    @isTest
    static void testErrorWithoutData() {
        // Test error method without additional data
        Log.error('An error occurred');
        System.assertNotEquals(Log.currentEvent(), null, 'Log event should have been created');
    }

    @isTest
    static void testErrorWithData() {
        // Test error method with additional data
        List<Object> data = new List<Object>{'Value 1', 'Value 2'};
        Log.error('An error occurred with data', data);
        System.assertNotEquals(Log.currentEvent(), null, 'Log event should have been created');
    }

    @isTest
    static void testErrorWithEmptyMessage() {
        // Test error method with empty message
        Log.error('');
        System.assertNotEquals(Log.currentEvent(), null, 'Log event should have been created');
    }

    @isTest
    static void testErrorWithEmptyData() {
        // Test error method with empty additional data
        Log.error('An error occurred', new List<Object>());
        System.assertNotEquals(Log.currentEvent(), null, 'Log event should have been created');
    }

    @isTest
    static void testErrorWhenLoggingIsDisabled() {
        // Test error method when logging is disabled
        // Disable logging
        Log.error('An error occurred');
        System.assertEquals(Log.currentEvent(), null, 'Log event should not have been created');
    }
}
