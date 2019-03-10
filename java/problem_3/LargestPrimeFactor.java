import java.util.ArrayList;

public class LargestPrimeFactor {
    public static void main(String[] args) {
        // LINK: https://www.geeksforgeeks.org/print-all-prime-factors-of-a-given-number/
        long numberToFactor = 600851475143L;
        ArrayList<Long> factors = new ArrayList<>();

        while (numberToFactor%2L == 0) {
            System.out.println("Adding a 2 factor: " + 2);
            factors.add(2L);
            numberToFactor /= 2L;
        }

        for(long i=3L; i <= Math.sqrt(numberToFactor); i+=2L) {
            while(numberToFactor%i == 0) {
                factors.add(i);
                System.out.println("Added factor: " + i);
                numberToFactor /= i;
            }
        }

        if (numberToFactor > 2L) { 
            System.out.println("Last factor: " + numberToFactor);
            factors.add(numberToFactor);
        }

        for(int i=0; i < factors.size(); i++) {
            System.out.println("num " + i + " " + factors.get(i));
        }
    }
}