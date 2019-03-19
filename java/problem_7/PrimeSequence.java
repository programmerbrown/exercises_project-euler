public class PrimeSequence {    
    public static boolean isPrime(int n) {
        for(int i = 2; i <= n/2; i++) {
            if(n%i == 0) {
                return false;
            }
        }
        return true;
    }

    public static void main(String[] args) {
        int sequenceMax = Integer.parseInt(args[0]);
        boolean found = false;
        int count = 0;
        int num = 2;

        while(count < sequenceMax) {
            if (PrimeSequence.isPrime(num)) {
                count++;
            }
            num++;
        }
        System.out.println("The " + sequenceMax 
        + " prime number is : " + (num-1));
    }
}