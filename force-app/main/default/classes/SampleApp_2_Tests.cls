
@isTest
public class SampleApp_2_Tests {
  
    @testSetup
    static void setup() {
        // We could create some data here but since the class does not depend on any data, we do not need any setup.
    }

    @isTest
    static void testSampleAppInstance() {
        // Create an instance of the SampleApp class.
        SampleApp sampleAppInstance = new SampleApp();

        // Assert that the instance of SampleApp is not null.
        System.assertNotEquals(null, sampleAppInstance, 'Instance of SampleApp should not be null');
    }
}
