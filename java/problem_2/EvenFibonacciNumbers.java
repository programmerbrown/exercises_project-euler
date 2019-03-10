public class EvenFibonacciNumbers {
    public static void main(String[] args) {
            long previousFibNum = 1;
            long currentFibNum = 2;
            long tempNum = 0;
            long sumOfFibNums = 0;

            while(currentFibNum < 4000000) {
                if (currentFibNum%2 == 0) {
                    sumOfFibNums += currentFibNum;
                }

                tempNum = currentFibNum;
                currentFibNum = currentFibNum + previousFibNum;
                previousFibNum = tempNum;
            }

            System.out.println("answer: " + sumOfFibNums);
    }
}