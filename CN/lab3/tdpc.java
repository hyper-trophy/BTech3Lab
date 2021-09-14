package CN.lab3;

import java.util.*;

class tdpc {
    public static Bit[] _2DevenParityGenerator(Bit[] bitStreams, int bitLength, int n) {
        Bit parity[] = new Bit[2];
        parity[0] = new Bit(0, n);
        parity[1] = new Bit(0, bitLength);

        for (int i = 0; i < n; i++) {
            parity[0].set(bitStreams[i]._1s() % 2, n - i - 1);
        }

        for (int i = 0; i < bitLength; i++) {
            int bit = 0;
            for (int j = 0; j < n; j++) {
                bit ^= bitStreams[j].get(i);
            }
            parity[1].set(bit, i);
        }
        return parity;
    }

    public static void _2DparityChecker(Bit[] bitStreams, int bitLength, int n){
        Bit[] parities = _2DevenParityGenerator(bitStreams, bitLength, n);
        if(parities[0].bit==0 && parities[1].bit==0){
            System.out.println("Valid bits");
        }else{
            System.out.println("Invalid bits");
        }
    }

    public static void main(String[] args) {

        Scanner s = new Scanner(System.in);
        System.out.println(
                "Enter 1 to generate 2D parity\nEnter 2 to Check 2D parity");

        int option = Integer.parseInt(s.nextLine());

        System.out.println("Enter the number of bit Streams");
        int n = Integer.parseInt(s.nextLine());
        
        System.out.println("Enter the number of bits per Stream");
        int bitLength = Integer.parseInt(s.nextLine());
        
        System.out.println("Enter bit Streams : ");
        Bit[] bitStreams = new Bit[n];

        for (int i = 0; i < n; i++) {
            bitStreams[i] = new Bit(s.nextLine());
        }

        switch (option) {
            case 1:
                Bit[] parities = _2DevenParityGenerator(bitStreams, bitLength, n);
                System.out.println("Parity 1 : "+ parities[0].bitString()+ "\nParity 2 : "+parities[1].bitString());
                break;
            case 2:
                _2DparityChecker(bitStreams, bitLength, n);
                break;
            default:
                System.out.println("invalid input");
                break;
        }

    }
}