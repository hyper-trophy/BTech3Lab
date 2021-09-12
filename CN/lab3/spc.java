package CN.lab3;

import java.util.*;

class spc {
    public static void main(String[] args) {
        Scanner s = new Scanner(System.in);
        System.out.println("Enter the number of bits per Stream");
        int bitLength = Integer.parseInt(s.nextLine());
        System.out.println("Enter bit Stream : ");
        Bit bit = new Bit(s.nextLine());
        int evenParity = bit._1s() % 2;
        System.out.println("Even Parity bit : " + evenParity + "\nOdd Parity bit : " + (1 - evenParity));
    }
}