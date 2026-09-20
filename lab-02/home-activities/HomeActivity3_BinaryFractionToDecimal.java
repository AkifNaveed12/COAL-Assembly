import java.util.Scanner;

public class HomeActivity3_BinaryFractionToDecimal {

    public static double binaryFractionToDecimal(String binary) {

        double decimalValue = 0.0;

        for (int i = binary.length() - 1; i >= 0; i--) {

            int digit = binary.charAt(i) - '0';

            decimalValue =
                    (decimalValue + digit) / 2;
        }

        return decimalValue;
    }

    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        System.out.println("===== Binary Fraction to Decimal =====");

        System.out.print("Enter binary fraction bits: ");
        String binary = scanner.nextLine();

        double decimal =
                binaryFractionToDecimal(binary);

        System.out.println(
                "Binary fraction: 0." + binary
        );

        System.out.println(
                "Decimal value: " + decimal
        );

        scanner.close();
    }
}