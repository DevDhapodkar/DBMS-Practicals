#include <stdio.h>

struct Process {
    int id;
    int bt;
    int wt;
    int tat;
};

void findWaitingTime(struct Process proc[], int n) {
    proc[0].wt = 0;
    for (int i = 1; i < n; i++) {
        proc[i].wt = proc[i - 1].bt + proc[i - 1].wt;
    }
}

void findTurnaroundTime(struct Process proc[], int n) {
    for (int i = 0; i < n; i++) {
        proc[i].tat = proc[i].bt + proc[i].wt;
    }
}

void findAvgTime(struct Process proc[], int n) {
    int total_wt = 0, total_tat = 0;
    for (int i = 0; i < n; i++) {
        total_wt += proc[i].wt;
        total_tat += proc[i].tat;
    }
    printf("\nAverage Waiting Time: %.2f", (float)total_wt / n);
    printf("\nAverage Turnaround Time: %.2f\n", (float)total_tat / n);
}

void ganttChart(struct Process proc[], int n) {
    printf("\nGantt Chart:\n");
    printf("0");
    for (int i = 0; i < n; i++) {
        printf("        P%d", proc[i].id); // Spacing between processes
    }
    printf("\n");

    for (int i = 0; i < n; i++) {
        printf("--------"); // Spacing to match process names
    }
    printf("\n");

    printf("0");
    for (int i = 0; i < n; i++) {
        printf("        %d", proc[i].tat); // Printing completion times with spacing
    }
    printf("\n");
}

void printTable(struct Process proc[], int n) {
    printf("\nProcess   Burst Time   Waiting Time   Turnaround Time\n");
    for (int i = 0; i < n; i++) {
        // Formatting the output with exact spacing
        printf("   P%d         %d            %d             %d\n", proc[i].id, proc[i].bt, proc[i].wt, proc[i].tat);
    }
    printf("\n");
}

int main() {
    int n;
    printf("Enter number of processes: ");
    scanf("%d", &n);

    struct Process proc[n];
    printf("\nEnter the burst time for each process:\n");
    for (int i = 0; i < n; i++) {
        printf("Process %d: ", i + 1);
        scanf("%d", &proc[i].bt);
        proc[i].id = i + 1;
    }

    // Sorting processes by burst time (Shortest Job First - SJF)
    for (int i = 0; i < n - 1; i++) {
        for (int j = i + 1; j < n; j++) {
            if (proc[i].bt > proc[j].bt) {
                struct Process temp = proc[i];
                proc[i] = proc[j];
                proc[j] = temp;
            }
        }
    }

    findWaitingTime(proc, n);
    findTurnaroundTime(proc, n);
    printTable(proc, n);
    findAvgTime(proc, n);
    ganttChart(proc, n);

    return 0;
}
