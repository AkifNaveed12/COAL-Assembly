import java.util.Scanner;

public class HomeActivity1_BaseToDecimal {

    // Converts a number from the given base to decimal
    public static int convertToDecimal(String number, int base) {

        int result = 0;

        for (int i = 0; i < number.length(); i++) {

            char digit = Character.toUpperCase(number.charAt(i));

            int value;

            if (digit >= '0' && digit <= '9') {
                value = digit - '0';
            } else {
                value = digit - 'A' + 10;
            }

            result = (result * base) + value;
        }

        return result;
    }

    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        System.out.println("===== Base 2 and Base 16 to Decimal =====");

        System.out.print("Enter binary number: ");
        String binary = scanner.nextLine();

        int binaryDecimal = convertToDecimal(binary, 2);

        System.out.println("Binary " + binary +
                " = Decimal " + binaryDecimal);

        System.out.print("\nEnter hexadecimal number: ");
        String hexadecimal = scanner.nextLine();

        int hexadecimalDecimal =
                convertToDecimal(hexadecimal, 16);

        System.out.println("Hexadecimal " + hexadecimal +
                " = Decimal " + hexadecimalDecimal);

        scanner.close();
    }
}