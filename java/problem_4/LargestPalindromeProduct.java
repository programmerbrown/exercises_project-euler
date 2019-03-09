import java.util.*;

public class LargestPalindromeProduct {
    public static boolean isPalindrome(String str) {
        for (int i=0; i < str.length(); i++) {
            if (str.charAt(i) != str.charAt(str.length() - i - 1)) {
                return false;
            }
        }
        return true;
    }

    public static void main(String[] args) {
        boolean found = false;
        int num = 0;

        List<Integer> palindromes = new ArrayList<>();

        outerloop:
        for(int i=999; i>=100; i--) {
            for(int j=999; j>=100; j--) {
                num = i * j;
                if(LargestPalindromeProduct.isPalindrome(String.valueOf(num))) {
                    palindromes.add(i*j);
                }
            }
        }
        
        OptionalInt maxPalindrome = palindromes.stream().mapToInt(i -> i).max();

        if(maxPalindrome.isPresent()) {
            System.out.println("The largest palindrome is : " + maxPalindrome.getAsInt());
        } else {
            System.out.println("Did not find a palindrome.");
        }
    }
}