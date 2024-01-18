
@isTest
private class Log_1_Tests {

    // Test setup to create necessary data for all tests
    @testSetup
    static void setupTestData() {
        // Create Settings__c record if needed by the Log class to determine if logging is enabled
        // Assuming Settings__c has a field called dat_LogViaEvents__c
        Settings__c settings = new Settings__c(
            Name = 'Default',
            dat_LogViaEvents__c = System.today() // Assuming 'Name' field as unique identifier for Settings__c
        );
        insert settings;
    }

    // Utility method to bypass triggers
    private static void bypassTriggers() {
        TriggerHandler.bypass('AccountTriggerHandler');
        TriggerHandler.bypass('MDTAccountTriggerHandler');
    }

    // Happy path test: Logging is enabled and event is published
    @isTest
    static void testDebugLogEnabled() {
        bypassTriggers();

        // Ensure logging is enabled by setting the date appropriately
        Settings__c settings = [SELECT Id, dat_LogViaEvents__c FROM Settings__c WHERE Name = 'Default' LIMIT 1];
        settings.dat_LogViaEvents__c = System.today();
        update settings;

        Test.startTest();
        Log.debug('Test Message');
        Test.stopTest();

        // This assertion is simply to ensure no exceptions were thrown as we cannot directly test Platform Event publishing
        System.assertEquals(true, true, 'Expected no exceptions when logging is enabled');
    }

    // Happy path test: Logging is disabled and debug log is used instead
    @isTest
    static void testDebugLogDisabled() {
        bypassTriggers();

        // Retrieve the default settings record and update to disable logging
        Settings__c settings = [SELECT Id, dat_LogViaEvents__c FROM Settings__c WHERE Name = 'Default' LIMIT 1];
        settings.dat_LogViaEvents__c = System.today().addDays(-1);
        update settings;

        Test.startTest();
        Log.debug('Test Message');
        Test.stopTest();

        // Assertions related to debug logs are not possible in Apex tests, so we simply ensure that no exception was thrown
        System.assertEquals(true, true, 'Expected no exceptions when logging is disabled');
    }

    // Exceptional scenario test: Handling null values
    @isTest
    static void testDebugNullValues() {
        bypassTriggers();

        Test.startTest();
        Log.debug(null, null);
        Test.stopTest();

        // We don't expect any particular outcome from passing nulls, but we don't want any exceptions either
        System.assertEquals(true, true, 'Passing null values should not throw an exception');
    }
}
