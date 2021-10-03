package OS.lab5;


import java.io.*;

class Process {
    int burstTime, arrivalTime, turnAroundTime = 0, waitingTime = 0, copy_of_burstTime;
    String id;

    Process(int Atime, int Btime, String s) {
        arrivalTime = Atime;
        burstTime = Btime;
        copy_of_burstTime = Btime;
        id = s;
    }
}

public class SJF {
    static int sum = 0;
    public static void main(String ags[]) throws IOException {

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        System.out.println("enter the total number of processes");
        int n = Integer.parseInt(br.readLine());

        Process p[] = new Process[n];
        for (int i = 0; i < n; i++) {
            System.out.println("enter the process Id, arrival time and Burst time for " + (i + 1) + "th process");
            String s = br.readLine();
            int a = Integer.parseInt(br.readLine());
            int b = Integer.parseInt(br.readLine());
            sum += b;
            p[i] = new Process(a, b, s);
        }

        sjf(p);

    }

    public static void sjf(Process op[]) {
        double avgWaitingTime = 0.0, avgTurnAroundTime = 0.0;
        for (int t = 0; t < sum;) {

            int min = Integer.MAX_VALUE, index = 0;

            for (int j = 0; j < op.length; j++) {

                if (op[j].arrivalTime <= t && op[j].burstTime < min && op[j].burstTime > 0) {

                    min = op[j].burstTime;
                    index = j;

                }

            }
            op[index].burstTime = 0;
            t += op[index].copy_of_burstTime;
            System.out.print("  |  " + op[index].id + " " + "(" + (t) + ")");

            op[index].turnAroundTime = t - op[index].arrivalTime;
            op[index].waitingTime = op[index].turnAroundTime - op[index].copy_of_burstTime;
        }
        
        System.out.println();
        for (int i = 0; i < op.length; i++) {
            System.out.println(op[i].waitingTime + "  " + op[i].turnAroundTime);
            avgWaitingTime += op[i].waitingTime;
            avgTurnAroundTime += op[i].turnAroundTime;
        }
        System.out.println("average waiting time: " + (avgWaitingTime / op.length));
        System.out.println("average turnaround time: " + (avgTurnAroundTime / op.length));
    }

}

// output:
// enter the total number of processes
// 4
// enter the process Id, arrival time and Burst time for 1th process
// p1
// 0
// 5
// enter the process Id, arrival time and Burst time for 2th process
// p2
// 1
// 15
// enter the process Id, arrival time and Burst time for 3th process
// p3
// 2
// 12
// enter the process Id, arrival time and Burst time for 4th process
// p4
// 3
// 25
//   |  p1 (5)  |  p3 (17)  |  p2 (32)  |  p4 (57)
// 0  5
// 16  31
// 3  15
// 29  54
// average waiting time: 12.0
// average turnaround time: 26.25