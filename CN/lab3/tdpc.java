package CN.lab3;

import java.util.*;

class tdpc {
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

        Bit parity1 = new Bit(0, n);
        Bit parity2 = new Bit(0, bitLength);

        for (int i = 0; i < n; i++) {
            parity1.set(bitStreams[i]._1s() % 2, n - i - 1);
        }
        System.out.println("Parity 1 : " + parity1.bitString());

        for (int i = 0; i < bitLength; i++) {
            int bit = 0;
            for (int j = 0; j < n; j++) {
                bit ^= bitStreams[j].get(i);
            }
            parity2.set(bit, i);
        }
        System.out.println("Parity 2 : " + parity2.bitString());

    }
}