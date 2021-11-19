package OS.lab9;

import java.util.*;

class scan {

    static int disk_size = 200;
    static final Boolean LEFT = false;
    static final Boolean RIGHT = true;

    static void SCAN(int arr[], int head, Boolean direction) {
        int seek_count = 0;
        int distance, cur_track;
        int size = arr.length;
        Vector<Integer> left = new Vector<>(), right = new Vector<>();
        Vector<Integer> seek_sequence = new Vector<Integer>();

        if (direction == LEFT)
            left.add(0);
        else if (direction == RIGHT)
            right.add(disk_size - 1);

        for (int i = 0; i < size; i++) {
            if (arr[i] < head)
                left.add(arr[i]);
            if (arr[i] > head)
                right.add(arr[i]);
        }

        Collections.sort(left);
        Collections.sort(right);

        int run = 2;
        while (run-- > 0) {
            if (direction == LEFT) {
                for (int i = left.size() - 1; i >= 0; i--) {
                    cur_track = left.get(i);
                    seek_sequence.add(cur_track);
                    distance = Math.abs(cur_track - head);
                    seek_count += distance;
                    head = cur_track;
                }
                // reached left most position now reverse direction
                direction = RIGHT;
            } else if (direction == RIGHT) {
                for (int i = 0; i < right.size(); i++) {
                    cur_track = right.get(i);
                    seek_sequence.add(cur_track);
                    distance = Math.abs(cur_track - head);
                    seek_count += distance;
                    head = cur_track;
                }
                // reached left most position now reverse direction
                direction = LEFT;
            }
        }

        System.out.print("Total number of seek operations = " + seek_count + "\n");

        System.out.print("Seek Sequence is" + "\n");

        for (int i = 0; i < seek_sequence.size(); i++) {
            System.out.print(seek_sequence.get(i) + "\n");
        }
    }

    // Driver code
    public static void main(String[] args) {
        int arr[] = { 55,58,39,18,90,160,150,38,184 };
        int head = 100;
        // starting from left
        SCAN(arr, head, RIGHT);
    }
}