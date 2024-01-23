
@isTest
public without sharing class Log_1_Tests {
    
    @isTest 
    static void testDebugDoesNotThrowException() {
        // Arrange
        Boolean isExceptionThrown = false;

        // Act
        try {
            Log.debug();
        } catch (Exception e) {
            isExceptionThrown = true;
        }

        // Assert
        System.assertEquals(false, isExceptionThrown, 'Calling debug() should not result in an exception.');
    }
}
