public class EvenFibonacciNumbers {
    public static void main(String[] args) {
            long previous = 1;
            long current = 2;
            long temp = 0;
            long sum = 0;

            while(current < 4000000) {
                if (current%2 == 0) {
                    sum += current;
                }

                temp = current;
                current = current + previous;
                previous = temp;
            }

            System.out.println("answer: " + sum);
    }
}