
@isTest
private class SampleApp_1_Tests {

    @testSetup
    static void setup() {
        // As mentioned before, no test data setup required for the SampleApp in this context.
    }

    @isTest
    static void testRunMethod() {
        SampleApp app = new SampleApp();

        // Bypassing triggers as per the project-specific details
        TriggerHandler.bypass('AccountTriggerHandler');
        TriggerHandler.bypass('MDTAccountTriggerHandler');

        // Record the number of future calls before execution
        Integer beforeFutureCalls = Limits.getFutureCalls();

        Test.startTest();
        app.run();
        Test.stopTest();

        // Record the number of future calls after execution and assert that it has incremented by 1
        Integer afterFutureCalls = Limits.getFutureCalls();
        
        // Assert that a future method was enqueued by checking that the future calls limit has been incremented
        System.assertEquals(beforeFutureCalls + 1, afterFutureCalls, 'The run method did not enqueue a future method as expected.');
    }
}
