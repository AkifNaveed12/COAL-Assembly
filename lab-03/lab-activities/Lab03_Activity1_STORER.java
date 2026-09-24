public class Lab03_Activity1_STORER {

    public static void main(String[] args) {

        // 16 Registers: R0 - R15
        int[] registers = new int[16];

        // 256 Memory locations: M0 - M255
        int[] memory = new int[256];

        // Initial value given in the lab example
        registers[4] = 67;

        System.out.println("===== STORER Instruction =====");

        System.out.println("Before Execution:");
        System.out.println("R4 = " + registers[4]);
        System.out.println("M6 = " + memory[6]);

        // STORER R4 M6
        // Register -> Memory
        memory[6] = registers[4];

        System.out.println("\nExecuting: STORER R4 M6");

        System.out.println("\nAfter Execution:");
        System.out.println("R4 = " + registers[4]);
        System.out.println("M6 = " + memory[6]);

        // Machine Code
        System.out.println("\nMachine Code: 0011010000000110");
    }
}