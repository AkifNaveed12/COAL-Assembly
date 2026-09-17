import java.util.Scanner;

public class Activity4_BinaryToHexadecimal {

    public static void main(String[] args) {

        // Create Scanner object for user input
        Scanner scanner = new Scanner(System.in);

        // Ask user to enter binary number
        System.out.println("Binary to Hexadecimal");
        System.out.print("Enter the number: ");

        String binary = scanner.nextLine();

        // Convert binary to decimal
        int decimal = Integer.parseInt(binary, 2);

        // Convert decimal to hexadecimal
        String hexadecimal = Integer.toHexString(decimal);

        // Display hexadecimal value
        System.out.println("Hexadecimal Value is: " + hexadecimal);

        scanner.close();
    }
}