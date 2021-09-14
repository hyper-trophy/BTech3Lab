package CN.lab3;

import java.util.*;

class spc {
    public static int evenPartiyGenerator(Bit b) {
        return b._1s() % 2;
    }

    public static int oddParityGenerator(Bit b) {
        return 1 - evenPartiyGenerator(b);
    }

    public static void evenParityChecker(Bit b) {
        if (evenPartiyGenerator(b) == 0)
            System.out.println("Valid Bits");
        else
            System.out.println("invalid Bits");
    }

    public static void oddParityChecker(Bit b) {
        if (oddParityGenerator(b) == 0)
            System.out.println("Valid Bits");
        else
            System.out.println("invalid Bits");
    }

    public static void main(String[] args) {
        Scanner s = new Scanner(System.in);
        System.out.println(
                "Enter 1 to generate even parity\nEnter 2 to generate odd parity\nEnter 3 to check even parity\nEnter 4 to check odd parity\n");
        int option = Integer.parseInt(s.nextLine());
        Bit bit;
        System.out.println("Enter bit Stream : ");
        switch (option) {
            case 1:
                bit = new Bit(s.nextLine());
                System.out.println("Even parity bit : " + evenPartiyGenerator(bit));
                break;
            case 2:
                bit = new Bit(s.nextLine());
                System.out.println("odd parity bit : " + oddParityGenerator(bit));
                break;
            case 3:
                bit = new Bit(s.nextLine());
                evenParityChecker(bit);
                break;
            case 4:
                bit = new Bit(s.nextLine());
                oddParityChecker(bit);
                break;
            default:
                System.out.println("invalid input");
                break;
        }
    }
}