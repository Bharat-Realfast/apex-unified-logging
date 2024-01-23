
@isTest
public class SampleApp_1_Tests {
    @testSetup
    static void setup() {
        // Setup data if necessary
    }

    @isTest
    static void testInitialization() {
        // Given
        SampleApp sampleAppInstance;

        // When
        sampleAppInstance = new SampleApp();
        
        // Then
        System.assertNotEquals(null, sampleAppInstance, 'SampleApp instance should not be null');
    }
}
