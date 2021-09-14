package CN.lab3;

import java.util.Scanner;

public class cksum {

    public static Bit checksumGenerator(Bit[] bitStreams, int bitLength, int n) {
        Bit checkSum = new Bit(0, bitLength);

        for (int i = 0; i < n; i++) {
            checkSum.add(bitStreams[i]);
            if (checkSum.get(bitLength) == 1) {
                checkSum.set(0, bitLength);
                checkSum.add(new Bit("1"));
            }
        }

        checkSum = checkSum.invert(bitLength);
        return checkSum;
    }

    public static void checksumChecker(Bit[] bitStreams, int bitLength, int n){
        Bit checksum = checksumGenerator(bitStreams, bitLength, n);
        if(checksum.bit==0)
            System.out.println("Valid bits");
        else    
            System.out.println("invalid bits");
    }

    public static void main(String[] args) {
        Scanner s = new Scanner(System.in);
        System.out.println("Enter 1 to generate checksum\nEnter 2 to Check checksum");

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
                Bit checksum = checksumGenerator(bitStreams, bitLength, n);
                System.out.println("Checksum : " + checksum.bitString());
                break;
            case 2:
                checksumChecker(bitStreams, bitLength, n);
                break;
            default:
                System.out.println("invalid input");
                break;
        }
    }
}
