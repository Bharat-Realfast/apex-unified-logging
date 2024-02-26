
@isTest
private class SampleApp_5_Tests {

    @testSetup
    static void makeData() {
        // No test data needed for these tests since the target method doesn't interact with any database records.
    }
    
    @isTest
    static void testHappyPathQueueableExecution() {
        // Enqueue the Queueable job within the test context
        Test.startTest();
        SampleApp.AQueueable aQueueableJob = new SampleApp.AQueueable();
        Id jobId = System.enqueueJob(aQueueableJob);
        Test.stopTest();
        
        // Assert that the job was enqueued successfully
        System.assertNotEquals(null, jobId, 'Job should have been enqueued');
        
        // Query for AsyncApexJob to check the execution status of the Queueable job
        AsyncApexJob jobInfo = [SELECT Status FROM AsyncApexJob WHERE Id = :jobId LIMIT 1];
        System.assertEquals('Completed', jobInfo.Status, 'Expected batch job to be completed.');
    }
}
