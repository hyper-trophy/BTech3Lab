package OS.lab8;
import java.util.concurrent.*;

class MyThread extends Thread {
    Semaphore s, t;
    String threadName;

    public MyThread(Semaphore s, Semaphore t, String threadName) {
        super(threadName);
        this.s = s;
        this.t = t;
        this.threadName = threadName;
    }

    @Override
    public void run() {

        // Process P
        if (this.getName().equals("P")) {
            try {
                for (int i = 0; i < 50; i++) {
                    s.acquire(); // P(S)
                    System.out.print("00\n");
                    t.release(); // V(T)
                }
            } catch (InterruptedException exc) {
            }
        }

        // Process Q
        else {
            try {
                Thread.sleep(1000);
                for (int i = 0; i < 50; i++) {
                    t.acquire(); // P(T)
                    System.out.print("11\n");
                    s.release(); // V(S)
                }
            } catch (InterruptedException exc) {
            }
        }
    }
}

// Driver class
public class semaphore {
    public static void main(String args[]) throws InterruptedException {
        Semaphore s = new Semaphore(1);
        Semaphore t = new Semaphore(0);
        MyThread P = new MyThread(s, t, "P");
        MyThread Q = new MyThread(s, t, "Q");

        P.start();
        Q.start();

    }
}