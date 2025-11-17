public class WesternUtility {
    
    /**
     * Simple method to reverse a string
     * @param input The string to reverse
     * @return The reversed string
     */
    public static String reverseString(String input) {
        if (input == null) {
            return null;
        }
        return input.reverse();
    }
    
    /**
     * Simple method to count words in a string
     * @param input The string to count words in
     * @return The number of words
     */
    public static Integer countWords(String input) {
        if (input == null || input.trim().length() == 0) {
            return 0;
        }
        return input.trim().split('\\s+').size();
    }
}
