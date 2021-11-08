package CN.lab4;

public class hamming {

    static void print(int arr[]) {
        for (int i=arr.length-1; i>0; i--) {
            System.out.print(arr[i] + " ");
        }
        System.out.println();
    }

    static boolean isParityBit(int i) {
        double N = Math.log(i) / Math.log(2);
        int X = (int) N;
        double temp = N - X;
        return temp > 0 ? false : true;
    }

    static int redundantBitsCount(int n) {
        int r = 1;
        while (Math.pow(2, r) < (n + r + 1)) {
            r++;
        }
        return r;
    }

    static int[] getDataParityArray(String str, int M, int r) {
        int[] ar = new int[r + M + 1];
        int j = M;
        for (int i = 1; i < ar.length; i++) {
            ar[i] = isParityBit(i) ? 0 : (int) (str.charAt(--j) - '0');
        }
        return ar;
    }

    static int[] hammingGenerator(String str) {

        int M = str.length();
        int r = redundantBitsCount(M);
        int[] ar = getDataParityArray(str, M, r);

        for (int i = 0; i < r; i++) {
            int x = (int) Math.pow(2, i);
            for (int j = 1; j < ar.length; j++) {
                if (((j >> i) & 1) == 1) {
                    if (x != j)
                        ar[x] = ar[x] ^ ar[j];
                }
            }
            System.out.println("P" + x + " = " + ar[x]);
        }

        return ar;
    }

    public static void main(String[] args) {
        // input message
        String str = "1001101";
        System.out.println("Generated hamming code ");
        int[] ar = hammingGenerator(str);
        print(ar);
    }
}
