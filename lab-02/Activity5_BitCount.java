import java.util.Scanner;

public class Activity5_BitCount {

    // Function to count the number of 1 bits
    public static int bitCount(int input) {

        int count = 0;

        // Check all 32 bits of an integer
        for (int i = 0; i < 32; i++) {

            count = count + ((input >>> i) & 1); // >>> unassinged right shift operator, moves bits to the right
        } // Shift the bits of input to the right by i positions.

        return count;
    }

    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter an integer: ");
        int number = scanner.nextInt();

        int result = bitCount(number);

        System.out.println("Number of 1's in binary representation: "
                + result);

        System.out.println("Binary representation: "
                + Integer.toBinaryString(number));

        scanner.close();
    }
}