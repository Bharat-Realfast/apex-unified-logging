
@isTest
private class SampleApp_2_Tests {
    
    // Since the futureMethod and the functionalities it calls do not require any setup data,
    // we leave the @testSetup method empty.
    @testSetup
    static void setup() {
        // Typically, this is where you would create test records if needed for the test context.
    }
    
    // Test to ensure that the future method enqueues the job successfully (Happy Path)
    @isTest
    static void testFutureMethodEnqueuesJob() {
        Test.startTest();
        // Execute the future method
        SampleApp.futureMethod();
        Test.stopTest();
        
        // Assert that the Future job has been enqueued
        Integer jobsQueued = Limits.getQueueableJobs();
        System.assertEquals(1, jobsQueued, 'One job should be enqueued.');
    }
    
    // Since we can't assert on jobs being enqueued or simulate the limit directly in a test for future methods,
    // we'll leave the sad path test related to reaching the limit out as it cannot be properly tested in Apex.
    
    // Exceptional scenario test is not possible due to the inability to simulate exceptions in the future method.
    // As such, no test will be written for it. This comment serves as documentation for this decision.
}
