public class SummationOfPrimes {
    public static boolean isPrime(int n) {
        for(int i = 2; i <= n/2; i++) {
            if(n%i == 0) {
                return false;
            }
        }
        return true;
    }
    public static void main(String[] args) {
        int max = Integer.parseInt(args[0]);
        long sum = 2L;
        for(int j = 3; j < max; j+=2) {
            if(SummationOfPrimes.isPrime(j)) {
                sum += (long) j;
            }
        }

        System.out.println("The sum of the primes less than " + max + " is : " + sum);
    }
}