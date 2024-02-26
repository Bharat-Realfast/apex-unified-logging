
@isTest
private class SampleApp_3_Tests {

    // Since there's no test setup needed for the hardcoded return list, we can directly start with test methods.

    @isTest
    static void testStartMethodReturnsCorrectList() {
        // Given
        SampleApp batchJob = new SampleApp();

        // When
        Test.startTest();
        List<Integer> result = batchJob.start(null);
        Test.stopTest();

        // Then
        System.assertEquals(4, result.size(), 'The returned list should have 4 elements.');
        System.assertEquals(new List<Integer>{1, 2, 3, 4}, result, 'The list contains the wrong elements.');
    }

    // Additional tests are not required as the start method does not interact with Salesforce data or any other dependencies.
}
