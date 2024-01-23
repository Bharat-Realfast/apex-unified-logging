
@isTest
public without sharing class Log_5_Tests {
    
    //Happy path test
    @isTest
    static void testEmitMethodHappyPath() {
        // Test data and variables
        String message = 'Error occured';
        List<Object> values = new List<Object>{'Error Value'};

        Test.startTest();
        Log.emit(message, values, LoggingLevel.ERROR);
        Test.stopTest();

        Log__e logEvent = Log.currentEvent();
        System.assertNotEquals(null, logEvent, 'Log event should not be null');
        
        // Parse serialized data
        Map<String, Object> data = (Map<String, Object>) JSON.deserializeUntyped(logEvent.txl_Data__c);
        System.assertEquals(message, data.get('Message'), 'Log event message mismatch');
    }

    //Happy path test with empty message and no values
    @isTest
    static void testEmitMethodWithEmptyMessageAndNoValues() {
        // Test data and variables
        String message = '';
        List<Object> values = new List<Object>();

        Test.startTest();
        Log.emit(message, values, LoggingLevel.ERROR);
        Test.stopTest();

        Log__e logEvent = Log.currentEvent();
        System.assertNotEquals(null, logEvent, 'Log event should not be null');
        
        // Parse serialized data
        Map<String, Object> data = (Map<String, Object>) JSON.deserializeUntyped(logEvent.txl_Data__c);
        System.assertEquals(message, data.get('Message'), 'Log event message mismatch');
    }
}
