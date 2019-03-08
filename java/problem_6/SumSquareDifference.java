import java.util.stream.IntStream;

public class SumSquareDifference {

    public static int diff(int num) {
        int squareOfSum = IntStream.rangeClosed(1, num).sum();
        int sumOfSquares = IntStream.rangeClosed(1, num).map(i -> i * i).sum();
        
        return squareOfSum * squareOfSum - sumOfSquares;
    }
    public static void main(String[] args) {
        System.out.println("Difference between square of sums and sum of squares is : " 
                + SumSquareDifference.diff(Integer.parseInt(args[0])));
    }
}