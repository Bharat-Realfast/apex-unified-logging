
@isTest
private class Log_6_Tests {

    @testSetup
    static void setup() {
        // Setup any required test data if necessary.
        // Since there is no information on the data model for the Settings__c SObject,
        // no test data is set up for it here.
        
        // Bypass triggers as per project specifics.
        TriggerHandler.bypass('AccountTriggerHandler');
        TriggerHandler.bypass('MDTAccountTriggerHandler');
    }

    @isTest
    static void testErrorLoggingWithEmptyValues() {
        Test.startTest();
        Log.error(new List<Object>());
        Test.stopTest();
        
        // Assertions
        Log__e logEvent = Log.currentEvent();
        System.assertNotEquals(null, logEvent, 'Log event should be created.');
        System.assertEquals('ERROR', logEvent.txt_Level__c, 'Log level should be ERROR.');
    }

    @isTest
    static void testErrorLoggingWithVariousValues() {
        List<Object> values = new List<Object>{'Test String', 123, new Account(Name='Test Account')};

        Test.startTest();
        Log.error(values);
        Test.stopTest();

        // Assertions
        Log__e logEvent = Log.currentEvent();
        System.assertNotEquals(null, logEvent, 'Log event should be created.');
        System.assertEquals('ERROR', logEvent.txt_Level__c, 'Log level should be ERROR.');
    }

    @isTest
    static void testErrorLoggingWithNullException() {
        List<Object> values = null;

        Test.startTest();
        // Log.error method is overloaded and calling with a single 'null' parameter may lead to ambiguity.
        // Hence, calling error method with an empty string and 'null' values to avoid ambiguity.
        Log.error('', values);
        Test.stopTest();

        // Assertions
        Log__e logEvent = Log.currentEvent();
        System.assertNotEquals(null, logEvent, 'Log event should be created even if the values are null.');
        System.assertEquals('ERROR', logEvent.txt_Level__c, 'Log level should be ERROR.');
    }
}
