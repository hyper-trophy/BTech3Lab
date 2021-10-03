package OS.lab5;


public class SRTF {
    private static class Process {
        private final int PID;
        private final int submitTime;
        private int burst;
        private int completeTime;
        private int initialBurst;

        public Process(int PID, int submitTime, int burst) {
            this.PID = PID;
            this.submitTime = submitTime;
            this.burst = burst;
            this.initialBurst = burst;
            this.completeTime = -1;
        }

        public int getPID() {
            return this.PID;
        }

        public int getSubmissionTime() {
            return this.submitTime;
        }

        public int getInitialBurst() {
            return this.initialBurst;
        }

        public int getBurst() {
            return this.burst;
        }

        public void reduceBurst(int q) {
            burst -= (int) Math.min(burst, q);
        }

        public void setCompleteTime(int time) {
            this.completeTime = time;
        }

        public int getCompleteTime() {
            return this.completeTime;
        }

        public boolean isCompleted() {
            return this.completeTime != -1;
        }
    }

    private static boolean checkCompleted(Process[] parr) {
        for (Process p : parr) {
            if (!p.isCompleted()) {
                return false;
            }
        }
        return true;
    }

    public static void main(String[] args) {

        Process[] parr = new Process[5];
        parr[0] = new Process(0, 1, 3);
        parr[1] = new Process(1, 2, 1);
        parr[2] = new Process(2, 2, 5);
        parr[3] = new Process(3, 3, 4);
        parr[4] = new Process(4, 4, 2);

        int clock = 1;
        int quantum = 1;

        while (!checkCompleted(parr)) {
            // Detect shortest burst process which
            // has not completed
            Process minBurstProc = null;
            int minBurst = Integer.MAX_VALUE;

            for (Process p : parr) {
                if (!p.isCompleted() && p.getSubmissionTime() <= clock && p.getBurst() < minBurst) {
                    minBurst = p.getBurst();
                    minBurstProc = p;
                }
            }

            clock += quantum;

            if (minBurstProc != null) {
                minBurstProc.reduceBurst(quantum);

                if (minBurstProc.getBurst() == 0) {
                    minBurstProc.setCompleteTime(clock);
                }
            }
        }

        System.out.println("PID\tCompletion Time");
        for (Process p : parr) {
            int completionTime = p.getCompleteTime();
            System.out.print(p.getPID());
            System.out.print("\t");
            System.out.print(completionTime);
            System.out.println(" units");
        }

        int totalTurnAroundTime = 0;
        System.out.println("\nPID\tturnaround Time");
        for (Process p : parr) {
            int completionTime = p.getCompleteTime();
            System.out.print(p.getPID());
            int turnAroundTime = completionTime - p.getSubmissionTime();
            System.out.print("\t");
            System.out.print(turnAroundTime);
            System.out.println(" units\t");
            totalTurnAroundTime += turnAroundTime;
        }
        System.out.println("Average Turnaround Time: " + (float)(totalTurnAroundTime / parr.length));

        int totalWaitingTime = 0;
        System.out.println("\nPID\tWaiting Time");
        for (Process p : parr) {
            int completionTime = p.getCompleteTime();
            System.out.print(p.getPID());
            int turnAroundTime = completionTime - p.getSubmissionTime();
            int waitingTime = turnAroundTime - p.getInitialBurst();
            System.out.print("\t");
            System.out.print(waitingTime);
            System.out.println(" units\t");
            totalWaitingTime += waitingTime;
        }
        System.out.println("Average Waiting Time: " + (float)(totalWaitingTime / parr.length));
    }
}

// output:
// PID     Completion Time
// 0       5 units
// 1       3 units
// 2       16 units
// 3       11 units
// 4       7 units

// PID     turnaround Time
// 0       4 units
// 1       1 units
// 2       14 units
// 3       8 units
// 4       3 units
// Average Turnaround Time: 6.0

// PID     Waiting Time
// 0       1 units
// 1       0 units
// 2       9 units
// 3       4 units
// 4       1 units
// Average Waiting Time: 3.0
