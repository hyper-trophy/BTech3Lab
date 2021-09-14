package CN.lab3;

import java.util.Scanner;

public class crc {
    public static Bit[] generateCRC(Bit crc, Bit f) {
        crc.appendZeros(f.length - 1);
        Bit transmitted = new Bit(crc);

        while (f.bit < crc.bit) {
            int i = crc.length - 1;
            while (crc.get(i) == 0)
                i--;
            int ii = f.length - 1;
            for (int j = i; ii >= 0; j--) {
                crc.xor(f.get(ii--), j);
            }
        }

        transmitted.add(crc);
        return new Bit[] { crc, transmitted };
    }

    public static void checkCRC(Bit crc, Bit f) {
        Bit[] generated = generateCRC(crc, f);
        if (generated[0].bit == 0)
            System.out.println("valid bits");
        else
            System.out.println("invalid bits");
    }

    public static void main(String[] args) {
        Scanner s = new Scanner(System.in);

        System.out.println("Enter Generator Funcion");
        Bit f = new Bit(s.nextLine());

        System.out.println("Enter bit Stream : ");
        String BitStr = s.nextLine();
        Bit crc = new Bit(BitStr);

        System.out.println("Enter 1 to generate crc and transmitted bits\nEnter 2 to check bits");

        int option = Integer.parseInt(s.nextLine());

        switch (option) {
            case 1:
                Bit[] generated = generateCRC(crc, f);
                System.out
                        .println("crc bits : " + generated[0].bitString().substring(generated[0].length - f.length + 1)
                                + "\nTransmitted bits : " + generated[1].bitString());
                break;
            case 2:
                checkCRC(crc, f);
                break;
            default:
                System.out.println("invalid input");
                break;
        }

    }
}
