package CN.lab3;

class Bit {

    public int bit;
    int length;

    Bit(Bit another) {
        this.bit = another.bit;
        this.length = another.length;
    }

    Bit(String bitstr) {
        this.bit = Integer.parseInt(bitstr, 2);
        this.length = bitstr.length();
        char[] chars = bitstr.toCharArray();
        for (char c : chars)
            if (c != '0' && c != '1')
                throw new Error("BitStream is not recognized");
    }

    Bit(int bit, int length) {
        this.bit = bit;
        this.length = length;
    }

    public void set(int value, int idx) {
        if (value == 1)
            this.bit |= (1 << idx);
        else
            this.bit &= ~(1 << idx);
        int newLen = Integer.toBinaryString(this.bit).length();
        if (newLen > this.length)
            this.length = newLen;
    }

    public void add(Bit b) {
        this.bit += b.bit;
        int newLen = Integer.toBinaryString(this.bit).length();
        if (newLen > this.length)
            this.length = newLen;
    }

    public void xor(int val, int idx) {
        this.bit ^= (val << idx);
    }

    public void appendZeros(int n) {
        this.bit <<= n;
        this.length += n;
    }

    public Bit invert(int len) {
        Bit b = new Bit(0, len);
        for (int i = 0; i < len; i++) {
            b.set(1 - this.get(i), i);
        }
        return b;
    }

    public int get(int i) {
        return (bit & (1 << i)) != 0 ? 1 : 0;
    }

    public int _1s() {
        int cnt = 0;
        for (int i = 0; i < this.length; i++) {
            if (get(i) == 1)
                cnt++;
        }
        return cnt;
    }

    public int _0s() {
        return this.length - _1s();
    }

    public String bitString() {
        String s = Integer.toBinaryString(this.bit);
        while (s.length() < this.length) {
            s = "0" + s;
        }
        return s;
    }
}
