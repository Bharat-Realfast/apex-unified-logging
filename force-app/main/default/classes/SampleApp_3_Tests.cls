
@isTest
public class SampleApp_3_Tests {

    @isTest
    static void test_start_method() {
        // Arrange
        SampleApp sampleAppInstance = new SampleApp();

        // Act
        List<Integer> result = sampleAppInstance.start(null);

        // Assert
        System.assertEquals(4, result.size(), 'There should be 4 integers in the list');
        System.assertEquals(new List<Integer>{1,2,3,4}, result, 'The returned list should be equal to {1,2,3,4}');
    }
}
