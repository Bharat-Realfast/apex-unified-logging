
@isTest
private class Log_5_Tests {

    // Helper method to enable logging
    private static void enableLogging() {
        // Assuming dat_LogViaEvents__c is the correct field based on the provided source code.
        Settings__c settings = new Settings__c(
            SetupOwnerId = UserInfo.getOrganizationId(),
            dat_LogViaEvents__c = System.today()
        );
        // Use upsert to insert or update the custom setting as necessary
        upsert settings;
    }
    
    @testSetup
    static void setup() {
        // Common test data setup, if necessary
        // No specific setup required for testing Log.error()
    }
    
    @isTest
    static void testErrorLoggingEnabled() {
        // Given logging is enabled
        enableLogging();
        
        Test.startTest();
        // When error() is called
        Log.error();
        Test.stopTest();
        
        // Then an error event should be logged
        Log__e logEvent = Log.currentEvent();
        System.assertNotEquals(null, logEvent, 'Log event should be created');
        System.assertEquals('ERROR', logEvent.txt_Level__c, 'Log level should be ERROR');
    }
    
    @isTest
    static void testErrorLoggingDisabled() {
        // Given logging is disabled
        // (do not call enableLogging();)
        
        Test.startTest();
        // When error() is called
        Log.error();
        Test.stopTest();
        
        // Then no error event should be logged
        Log__e logEvent = Log.currentEvent();
        System.assertEquals(null, logEvent, 'No Log event should be created');
    }
}
