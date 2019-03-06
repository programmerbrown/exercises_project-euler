import java.util.stream.IntStream;

public class MultiplesOf3And5 {
    public static void main(String[] args) {
        
        int sum = IntStream.range(1, 1000).filter(num -> num%3 == 0 || num%5 == 0).sum();

        System.out.println("Sum of multiples of 3 and 5 less than 1000: " + sum);
    }
}