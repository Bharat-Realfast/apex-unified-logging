
@isTest
private class Log_5_Tests {
  
    @testSetup
    static void setup() {
        // Setup data here if needed
    }
    
    @isTest
    static void testErrorMethodCalledWithoutException() {
        // Arrange
        TriggerHandler.bypass('AccountTriggerHandler');
        TriggerHandler.bypass('MDTAccountTriggerHandler');
        // Since we cannot mock isEnabled(), we'll just make sure calling error() doesn't throw an exception

        Boolean exceptionThrown = false;
        
        // Act
        try {
            Test.startTest();
            Log.error('Test Error', new List<Object>{ 'error details' });
            Test.stopTest();
        } catch (Exception e) {
            exceptionThrown = true;
        }
        
        // Assert
        System.assertEquals(false, exceptionThrown, 'Calling error() method should not throw an exception.');
    }
}
