@IsTest
private class SimpleUtilityTest {
    
    @IsTest
    static void testReverseString() {
        // Test normal string
        String input = 'Hello World';
        String result = SimpleUtility.reverseString(input);
        System.assertEquals('dlroW olleH', result, 'String should be reversed correctly');
        
        // Test null input
        result = SimpleUtility.reverseString(null);
        System.assertEquals(null, result, 'Null input should return null');
        
        // Test empty string
        result = SimpleUtility.reverseString('');
        System.assertEquals('', result, 'Empty string should return empty string');
    }
    
    @IsTest
    static void testCountWords() {
        // Test normal string
        String input = 'Hello World Test';
        Integer result = SimpleUtility.countWords(input);
        System.assertEquals(3, result, 'Should count three words');
        
        // Test null input
        result = SimpleUtility.countWords(null);
        System.assertEquals(0, result, 'Null input should return 0');
        
        // Test empty string
        result = SimpleUtility.countWords('');
        System.assertEquals(0, result, 'Empty string should return 0');
        
        // Test string with multiple spaces
        result = SimpleUtility.countWords('  Hello    World  ');
        System.assertEquals(2, result, 'Should handle multiple spaces correctly');
    }
}
