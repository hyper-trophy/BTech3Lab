package OS.lab7;

import java.util.*;

class LRU {

    Set<Integer> memory;
    int maxFrames;
    int hit;
    int miss;

    public LRU(int maxFrames) {
        this.memory = new LinkedHashSet<Integer>(maxFrames);
        this.maxFrames = maxFrames;
        this.hit = 0;
        this.miss = 0;
    }

    public boolean get(int key) {
        if (!memory.contains(key)){
            miss++;
            return false;
        }
        hit++;
        memory.remove(key);
        memory.add(key);
        return true;
    }

    public void refer(int key) {
        if (get(key) == false)
            put(key);
    }

    
    public void put(int key) {
        if (memory.size() == maxFrames) {
            int firstKey = memory.iterator().next();
            memory.remove(firstKey);
        }
        memory.add(key);
    }
    
    public void display() {
        LinkedList<Integer> list = new LinkedList<>(memory);
        Iterator<Integer> itr = list.descendingIterator();
        System.out.format("+-Memory-+%n");
        while (itr.hasNext()) {
            System.out.format("| %-5d  |%n+--------+%n", itr.next());
        }
    }

    public static void main(String[] args) {
        Scanner s = new Scanner(System.in);
        System.out.println("Enter number of elements : ");
        int n = Integer.parseInt(s.nextLine());
        System.out.println("Enter elements : ");
        String[] els = s.nextLine().split(" ");
        System.out.println("Enter number of frames : ");
        int f = Integer.parseInt(s.nextLine());
        LRU mem = new LRU(f);
        for (int i = 0; i < n; i++) {
            mem.refer( Integer.parseInt(els[i]) );
            System.out.println("\nAfter refering " + els[i]);
            mem.display();
        }
        System.out.println("\nHits : " + mem.hit + "\nMiss : " + mem.miss + "\nHit ratio : " + (double)mem.hit/(mem.miss+mem.hit));
    }
}
