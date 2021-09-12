package CN.lab3;

import java.util.Scanner;

public class crc {
    public static void main(String[] args) {
        Scanner s = new Scanner(System.in);

        System.out.println("Enter Generator Funcion");
        Bit f = new Bit(s.nextLine());

        System.out.println("Enter bit Stream : ");
        String BitStr = s.nextLine();

        Bit crc = new Bit(BitStr);
        crc.appendZeros(f.length - 1);
        Bit transmitted = new Bit(crc);

        while(f.bit < crc.bit) {
            int i = crc.length-1;
            while(crc.get(i) == 0) i--;
            int ii=f.length-1;
            for(int j = i; ii>=0; j--) {
                crc.xor(f.get(ii--), j);
            }
        }
        
        System.out.println("CRC : " + crc.bitString().substring(crc.length-f.length+1));
        transmitted.add(crc);
        System.out.println("Transmitted Message : "+ transmitted.bitString());
    }
}
