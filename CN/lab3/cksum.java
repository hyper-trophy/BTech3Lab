package CN.lab3;

import java.util.Scanner;

public class cksum {
    public static void main(String[] args) {

        Scanner s = new Scanner(System.in);

        System.out.println("Enter the number of bit Streams");
        int n = Integer.parseInt(s.nextLine());

        System.out.println("Enter the number of bits per Stream");
        int bitLength = Integer.parseInt(s.nextLine());

        System.out.println("Enter bit Streams : ");
        Bit[] bitStreams = new Bit[n];
        for (int i = 0; i < n; i++) {
            bitStreams[i] = new Bit(s.nextLine());
        }

        Bit checkSum = new Bit(0, bitLength);

        for (int i = 0; i < n; i++) {
            checkSum.add(bitStreams[i]);
            if (checkSum.get(bitLength)==1) {
                checkSum.set(0, bitLength);
                checkSum.add(new Bit("1"));
            }
        }

        checkSum = checkSum.invert(bitLength);
        System.out.println("CheckSum : " + checkSum.bitString());
    }
}
