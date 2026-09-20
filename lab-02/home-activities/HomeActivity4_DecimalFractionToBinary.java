import java.util.Scanner;

public class HomeActivity4_DecimalFractionToBinary {

    public static String decimalFractionToBinary(
            double fraction, int maxDigits) {

        String result = "";

        int digitCount = 0;

        while (fraction != 0 && digitCount < maxDigits) {

            double value = fraction * 2;

            int digit = (int) value;

            result = result + digit;

            fraction = value - digit;

            digitCount++;
        }

        return result;
    }

    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        System.out.println(
                "===== Decimal Fraction to Binary ====="
        );

        System.out.print("Enter decimal fraction: ");
        double fraction = scanner.nextDouble();

        System.out.print(
                "Enter maximum number of binary digits: "
        );
        int maxDigits = scanner.nextInt();

        String binary =
                decimalFractionToBinary(
                        fraction,
                        maxDigits
                );

        System.out.println(
                "Decimal fraction: " + fraction
        );

        System.out.println(
                "Binary fraction: 0." + binary
        );

        scanner.close();
    }
}