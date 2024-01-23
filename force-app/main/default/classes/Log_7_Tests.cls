
@isTest
public class Log_7_Tests {
    // Create test data
    @testSetup
    static void setup() {
        // Create a Settings__c record for the current user with dat_LogViaEvents__c set to today
        Settings__c settings = new Settings__c(
            Name = UserInfo.getUserId(),
            dat_LogViaEvents__c = System.today()
        );
        insert settings;
    }
    
    // Test method for scenario 1
    @isTest
    static void testErrorMethodWithNonEmptyMessage() {
        // Prepare
        String errorMessage = 'Test error message.';

        // Execute
        Test.startTest();
        Log.error(errorMessage);
        Test.getEventBus().deliver();
        Test.stopTest();

        // Verify
        List<EventBus.Event> events = Test.getEventBus().getEvents();
        System.assertNotEquals(0, events.size(), 'An event should be logged');
        Map<String, Object> logData = (Map<String, Object>) JSON.deserializeUntyped((String)events[0].payload.get('txl_Data__c'));
        System.assertEquals(errorMessage, logData.get('Message'), 'Expected message not logged');
    }

    // Test method for scenario 2
    @isTest
    static void testErrorMethodWithEmptyMessage() {
        // Prepare
        String errorMessage = '';

        // Execute
        Test.startTest();
        Log.error(errorMessage);
        Test.getEventBus().deliver();
        Test.stopTest();

        // Verify
        List<EventBus.Event> events = Test.getEventBus().getEvents();
        System.assertNotEquals(0, events.size(), 'An event should be logged');
        Map<String, Object> logData = (Map<String, Object>) JSON.deserializeUntyped((String)events[0].payload.get('txl_Data__c'));
        System.assertEquals(errorMessage, logData.get('Message'), 'Expected empty message not logged');
    }
}
