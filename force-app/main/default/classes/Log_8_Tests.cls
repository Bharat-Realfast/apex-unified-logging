
@isTest
public class Log_8_Tests {
    
    @isTest
    private static void testErrorMethodWithConvertableObjects() {
        String message = 'Test Error Message';
        List<Object> values = new List<Object>{'Test', 123, true};

        Test.startTest();
        try {
            Log.error(message, values);
            Test.stopTest();
            System.assert(true, 'No exceptions should be thrown');
        } catch (Exception e) {
            System.assert(false, 'Unexpected exception: ' + e.getMessage());
        }
    }

    @isTest
    private static void testErrorMethodWithNonConvertableObjects() {
        String message = 'Test Error Message';
        List<Object> values = new List<Object>{'Test Object'};

        Test.startTest();
        try {
            Log.error(message, values);
            Test.stopTest();
            System.assert(true, 'No exceptions should be thrown');
        } catch (Exception e) {
            System.assert(false, 'Unexpected exception: ' + e.getMessage());
        }
    }
}
