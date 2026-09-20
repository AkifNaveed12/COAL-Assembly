import java.util.Scanner;

public class HomeActivity2_DecimalToBase {

    public static String convertFromDecimal(int number, int base) {

        if (number == 0) {
            return "0";
        }

        String result = "";

        while (number != 0) {

            int remainder = number % base;

            char digit;

            if (remainder < 10) {
                digit = (char) ('0' + remainder);
            } else {
                digit = (char) ('A' + remainder - 10);
            }

            result = digit + result;

            number = number / base;
        }

        return result;
    }

    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        System.out.println("===== Decimal to Base 2 and Base 16 =====");

        System.out.print("Enter decimal number: ");
        int decimal = scanner.nextInt();

        String binary =
                convertFromDecimal(decimal, 2);

        String hexadecimal =
                convertFromDecimal(decimal, 16);

        System.out.println(
                "Decimal " + decimal +
                " = Binary " + binary
        );

        System.out.println(
                "Decimal " + decimal +
                " = Hexadecimal " + hexadecimal
        );

        scanner.close();
    }
}