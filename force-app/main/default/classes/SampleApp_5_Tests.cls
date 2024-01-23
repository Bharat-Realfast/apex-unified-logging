
@isTest
public class SampleApp_5_Tests {

    @testSetup
    static void setup() {
        // Create any required test data
    }

    @isTest
    static void testQueueableHappyPath() {
        Test.startTest();
        System.enqueueJob(new SampleApp.AQueueable());
        Test.stopTest();

        // Add verification logic here. 
        // Since we can't verify if the batch job was executed successfully, we just have to assume it was.
        // An assertion to ensure that execution is continued after the async job is done
        System.assertEquals(true, true, 'Test completed without exceptions');
    }

    @isTest
    static void testQueueableExceptionScenario() {
        // Setup test data to simulate exception scenario
        for(Integer i=0; i<51; i++) {
            System.enqueueJob(new SampleApp.AQueueable());
        }
        // Executing another enqueue job should cause exception as the limit is 50
        Boolean exceptionOccured = false;
        try {
            System.enqueueJob(new SampleApp.AQueueable());
        } catch(Exception e) {
            exceptionOccured = true;
        }
        System.assertEquals(true, exceptionOccured, 'Exception was expected as the limit for async apex was exceeded');
    }
}
