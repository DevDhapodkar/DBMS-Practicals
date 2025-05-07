#include <stdio.h>

typedef struct {
    int process_id;
    int burst_time;
    int priority;
    int waiting_time;
    int turnaround_time;
    int completion_time;
} Process;

void findWaitingTime(Process proc[], int n) {
    proc[0].waiting_time = 0;
   
    for (int i = 1; i < n; i++) {
        proc[i].waiting_time = proc[i - 1].completion_time - proc[i].burst_time;
    }
}

void findTurnaroundTime(Process proc[], int n) {
    for (int i = 0; i < n; i++) {
        proc[i].turnaround_time = proc[i].burst_time + proc[i].waiting_time;
    }
}

void findCompletionTime(Process proc[], int n) {
    proc[0].completion_time = proc[0].burst_time;
   
    for (int i = 1; i < n; i++) {
        proc[i].completion_time = proc[i - 1].completion_time + proc[i].burst_time;
    }
}

void printTable(Process proc[], int n) {
    printf("\nProcess ID\tBurst Time\tPriority\tWaiting Time\tTurnaround Time\tCompletion Time\n");
    for (int i = 0; i < n; i++) {
        printf("%d\t\t%d\t\t%d\t\t%d\t\t%d\t\t\t%d\n",
               proc[i].process_id,
               proc[i].burst_time,
               proc[i].priority,
               proc[i].waiting_time,
               proc[i].turnaround_time,
               proc[i].completion_time);
    }
}

void printGanttChart(Process proc[], int n) {
    printf("\nGantt Chart:\n");
    printf("0 ");
   
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < proc[i].burst_time; j++) {
            printf("--");
        }
        printf("|");
        printf("P%d ", proc[i].process_id);
    }
    printf("\n");
   
    printf(" ");
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < proc[i].burst_time; j++) {
            printf("--");
        }
        printf(" ");
    }
    printf("\n");
   
    for (int i = 0; i < n; i++) {
        printf("  %d", proc[i].completion_time);
    }
    printf("\n");
}

void priorityScheduling(Process proc[], int n) {
    // Sorting the processes by priority (ascending order - lower number indicates higher priority)
    for (int i = 0; i < n - 1; i++) {
        for (int j = i + 1; j < n; j++) {
            if (proc[i].priority > proc[j].priority) {
                Process temp = proc[i];
                proc[i] = proc[j];
                proc[j] = temp;
            }
        }
    }

    // Calculating waiting time, turnaround time, and completion time
    findCompletionTime(proc, n);
    findWaitingTime(proc, n);
    findTurnaroundTime(proc, n);
   
    // Printing the results
    printTable(proc, n);
    printGanttChart(proc, n);
}

int main() {
    int n;
   
    printf("Enter the number of processes: ");
    scanf("%d", &n);

    Process proc[n];
   
    for (int i = 0; i < n; i++) {
        proc[i].process_id = i + 1;
        printf("Enter burst time and priority for Process %d:\n", proc[i].process_id);
        printf("Burst Time: ");
        scanf("%d", &proc[i].burst_time);
        printf("Priority: ");
        scanf("%d", &proc[i].priority);
    }
   
    // Scheduling the processes
    priorityScheduling(proc, n);
   
    return 0;
}
