
@isTest
public class Log_4_Tests {
    @isTest
    static void testDebugMethod() {
        // Given
        String testMessage = 'Test Message';
        List<Object> testValues = new List<Object>{'Test Value'};

        // When
        Test.startTest();
        try {
            Log.debug(testMessage, testValues);
            // Then: No exception is thrown
            System.assert(true);
        } catch(Exception e) {
            // If an exception is thrown, this assertion will fail.
            System.assert(false, 'Exception should not be thrown');
        }
        Test.stopTest();
    }
}
