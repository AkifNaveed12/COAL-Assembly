import java.util.Scanner;

public class ISA_Simulator {

    // 16 registers: R0 - R15
    static int[] registers = new int[16];

    // 256 memory locations: M0 - M255
    static int[] memory = new int[256];

    // Instruction memory
    // Each instruction contains 3 values:
    // [opcode, operand1, operand2]
    static int[][] instructionMemory;

    public static void main(String[] args) {

        Scanner input = new Scanner(System.in);

        System.out.println("=================================");
        System.out.println("        ISA SIMULATOR");
        System.out.println("=================================");

        // Ask number of instructions
        System.out.print("Enter number of instructions: ");
        int numberOfInstructions = input.nextInt();

        instructionMemory = new int[numberOfInstructions][3];

        // Initialize memory for testing
        memory[7] = 90;
        memory[8] = 90;

        System.out.println("\nEnter instructions:");
        System.out.println("1 = LOADM");
        System.out.println("3 = STORER");
        System.out.println("5 = ADDR");

        // Input instructions
        for (int i = 0; i < numberOfInstructions; i++) {

            System.out.println("\nInstruction " + (i + 1));

            System.out.print("Enter opcode: ");
            instructionMemory[i][0] = input.nextInt();

            System.out.print("Enter operand 1: ");
            instructionMemory[i][1] = input.nextInt();

            System.out.print("Enter operand 2: ");
            instructionMemory[i][2] = input.nextInt();
        }

        // Execute instructions
        for (int i = 0; i < numberOfInstructions; i++) {

            System.out.println("\n=================================");
            System.out.println("Cycle #" + (i + 1));
            System.out.println("=================================");

            fetch(i);
            decodeAndExecute(i);

            displayState();
        }

        input.close();
    }

    // FETCH
    static void fetch(int instructionNumber) {

        System.out.println("\nFETCH");
        System.out.println(
            instructionMemory[instructionNumber][0] + " " +
            instructionMemory[instructionNumber][1] + " " +
            instructionMemory[instructionNumber][2]
        );
    }

    // DECODE + EXECUTE
    static void decodeAndExecute(int instructionNumber) {

        int opcode = instructionMemory[instructionNumber][0];
        int operand1 = instructionMemory[instructionNumber][1];
        int operand2 = instructionMemory[instructionNumber][2];

        System.out.println("\nDECODE");

        switch (opcode) {

            case 1:
                System.out.println("LOADM");
                System.out.println("Register R" + operand1);
                System.out.println("Memory M" + operand2);

                System.out.println("\nEXECUTE");

                // LOADM: Memory -> Register
                registers[operand1] = memory[operand2];

                System.out.println("Register Updated");
                break;

            case 3:
                System.out.println("STORER");
                System.out.println("Register R" + operand1);
                System.out.println("Memory M" + operand2);

                System.out.println("\nEXECUTE");

                // STORER: Register -> Memory
                memory[operand2] = registers[operand1];

                System.out.println("Memory Updated");
                break;

            case 5:
                System.out.println("ADDR");
                System.out.println("Destination R" + operand1);
                System.out.println("Source R" + operand2);

                System.out.println("\nEXECUTE");

                // ADDR: R1 = R1 + R2
                registers[operand1] =
                        registers[operand1] + registers[operand2];

                System.out.println("Register Updated");
                break;

            default:
                System.out.println("Invalid Opcode: " + opcode);
        }
    }

    // Display registers and memory
    static void displayState() {

        System.out.println("\nREGISTERS:");

        for (int i = 0; i < registers.length; i++) {
            System.out.print(registers[i] + " ");
        }

        System.out.println("\n");

        System.out.println("MEMORY:");

        for (int i = 0; i < memory.length; i++) {

            if (memory[i] != 0) {
                System.out.print("M" + i + "=" + memory[i] + " ");
            }
        }

        System.out.println();
    }
}