public class Lab03_Activity2_SUBR {

    public static void main(String[] args) {

        // 16 Registers: R0 - R15
        int[] registers = new int[16];

        // Values given in the lab example
        registers[1] = 23;  // R1
        registers[2] = 50;  // R2

        System.out.println("===== SUBR Instruction =====");

        System.out.println("\nBefore Execution:");
        System.out.println("R1 = " + registers[1]);
        System.out.println("R2 = " + registers[2]);

        // SUBR R2 R1
        // R2 <- R2 - R1
        registers[2] = registers[2] - registers[1];

        System.out.println("\nExecuting: SUBR R2 R1");

        System.out.println("\nAfter Execution:");
        System.out.println("R1 = " + registers[1]);
        System.out.println("R2 = " + registers[2]);
    }
}