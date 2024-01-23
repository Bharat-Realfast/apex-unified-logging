
@isTest
public class Log_2_Tests {

    @testSetup
    static void setup() {
        // Create test data here
        // Assuming there is a custom setting object Setting__c and a field on it to enable logging
        Settings__c setting = new Settings__c(SetupOwnerId = UserInfo.getUserId(), dat_LogViaEvents__c = System.today());
        insert setting;
    }

    // Test when logging is enabled
    @isTest
    static void testDebugWithLoggingEnabled() {
        // Setup
        Test.startTest();
        Log.debug('Test message');
        Test.stopTest();

        // Verify
        Log__e logEvent = Log.currentEvent();
        System.assertNotEquals(null, logEvent, 'Expected Log event to be created when logging is enabled');
        System.assert(logEvent.txl_Data__c.contains('Test message'), 'Expected log data to contain the test message');
    }

    // Test when logging is disabled
    @isTest
    static void testDebugWithLoggingDisabled() {
        // Setup
        Settings__c setting = Settings__c.getInstance(UserInfo.getUserId());
        setting.dat_LogViaEvents__c = System.today().addDays(-1);
        update setting;

        Test.startTest();
        Log.debug('Test message');
        Test.stopTest();

        // Verify
        Log__e logEvent = Log.currentEvent();
        System.assertEquals(null, logEvent, 'Expected no Log event to be created when logging is disabled');
    }

    // Test when debug method is called with an empty message
    @isTest
    static void testDebugWithEmptyMessage() {
        // Setup
        Test.startTest();
        Log.debug('');
        Test.stopTest();

        // Verify
        Log__e logEvent = Log.currentEvent();
        System.assertNotEquals(null, logEvent, 'Expected Log event to be created when message is empty');
        System.assert(logEvent.txl_Data__c.contains(''), 'Expected log data to contain empty message');
    }
}
