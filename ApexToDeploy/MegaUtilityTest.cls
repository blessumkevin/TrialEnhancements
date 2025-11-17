@IsTest
private class MegaUtilityTest {
    
    @IsTest
    static void testReverseString() {
        // Test normal string
        String input = 'Hello World';
        String result = MegaUtility.reverseString(input);
        System.assertEquals('dlroW olleH', result, 'String should be reversed correctly');
        
        // Test null input
        result = MegaUtility.reverseString(null);
        System.assertEquals(null, result, 'Null input should return null');
        
        // Test empty string
        result = MegaUtility.reverseString('');
        System.assertEquals('', result, 'Empty string should return empty string');
    }
    
    @IsTest
    static void testCountWords() {
        // Test normal string
        String input = 'Hello World Test';
        Integer result = MegaUtility.countWords(input);
        System.assertEquals(3, result, 'Should count three words');
        
        // Test null input
        result = MegaUtility.countWords(null);
        System.assertEquals(0, result, 'Null input should return 0');
        
        // Test empty string
        result = MegaUtility.countWords('');
        System.assertEquals(0, result, 'Empty string should return 0');
        
        // Test string with multiple spaces
        result = MegaUtility.countWords('  Hello    World  ');
        System.assertEquals(2, result, 'Should handle multiple spaces correctly');
    }
}

