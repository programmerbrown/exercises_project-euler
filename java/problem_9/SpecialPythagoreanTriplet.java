public class SpecialPythagoreanTriplet {

    public static void main(String[] args) {
        int a, b, c;
        a = b = c = 0;

        outerloop:
        for(int i=1; i<1000; i++) {
            for(int j=1; j<1000; j++) {
                for(int k=1; k<1000; k++) {
                    if((i+j+k == 1000) && (i*i + j*j == k*k)) {
                        a = i;
                        b = j;
                        c = k;
                        break outerloop;
                    }
                }
            }
        }

        if(a != 0) {
            System.out.println("The Pythagorean triple is : a = " + a + ", b = " + b + ", c = " + c + ", product = " + (a*b*c));
        } else {
            System.out.println("A Pythagorean triple was not found.");
        }
    }
}