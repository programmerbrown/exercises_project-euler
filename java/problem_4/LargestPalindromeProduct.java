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
        int maxPalindrome = 0;

        for(int i=999; i>=100; i--) {
            for(int j=999; j>=100; j--) {
                if(LargestPalindromeProduct.isPalindrome(String.valueOf(i*j)) && (i*j) > maxPalindrome) {
                    maxPalindrome = i*j;
                }
            }
        }
        
        if(maxPalindrome > 0) {
            System.out.println("The largest palindrome is : " + maxPalindrome);
        } else {
            System.out.println("Did not find a palindrome.");
        }
    }
}