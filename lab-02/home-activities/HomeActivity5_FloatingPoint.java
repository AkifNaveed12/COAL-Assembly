import java.util.Scanner;

public class HomeActivity5_FloatingPoint {

    // Convert integer part to binary
    public static String integerToBinary(int number) {

        if (number == 0) {
            return "0";
        }

        String result = "";

        while (number > 0) {

            int remainder = number % 2;

            result = remainder + result;

            number = number / 2;
        }

        return result;
    }

    // Convert fractional part to binary
    public static String fractionToBinary(
            double fraction, int maxDigits) {

        String result = "";

        int count = 0;

        while (fraction != 0 && count < maxDigits) {

            double value = fraction * 2;

            int digit = (int) value;

            result = result + digit;

            fraction = value - digit;

            count++;
        }

        return result;
    }

    // Convert complete decimal number to binary
    public static String decimalToBinary(double number) {

        int integerPart = (int) number;

        double fractionPart =
                number - integerPart;

        String integerBinary =
                integerToBinary(integerPart);

        String fractionBinary =
                fractionToBinary(fractionPart, 30);

        if (fractionBinary.length() == 0) {
            return integerBinary;
        }

        return integerBinary + "." + fractionBinary;
    }

    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        System.out.println(
                "===== Decimal to Floating Point Binary ====="
        );

        System.out.print(
                "Enter a positive decimal number: "
        );

        double number = scanner.nextDouble();

        // STEP 1: Convert decimal to binary
        String binary = decimalToBinary(number);

        System.out.println(
                "\nStep 1: Binary representation"
        );

        System.out.println(binary);

        // Separate integer and fraction parts
        String[] parts = binary.split("\\.");

        String integerPart = parts[0];

        String fractionPart =
                parts.length > 1 ? parts[1] : "";

        int exponent;
        String mantissa;

        // STEP 2: Normalize
        if (!integerPart.equals("0")) {

            exponent = integerPart.length() - 1;

            mantissa =
                    integerPart.substring(1)
                    + fractionPart;

        } else {

            int firstOne = 0;

            while (firstOne < fractionPart.length()
                    && fractionPart.charAt(firstOne) == '0') {

                firstOne++;
            }

            exponent = -(firstOne + 1);

            mantissa =
                    fractionPart.substring(firstOne + 1);
        }

        // Make mantissa exactly 23 bits
        if (mantissa.length() < 23) {

            while (mantissa.length() < 23) {
                mantissa += "0";
            }

        } else if (mantissa.length() > 23) {

            mantissa = mantissa.substring(0, 23);
        }

        System.out.println(
                "\nStep 2: Normalized form"
        );

        System.out.println(
                "1." + mantissa +
                " × 2^" + exponent
        );

        // STEP 3: Biased exponent
        int bias = 127;

        int biasedExponent =
                exponent + bias;

        String exponentBinary =
                integerToBinary(biasedExponent);

        while (exponentBinary.length() < 8) {
            exponentBinary =
                    "0" + exponentBinary;
        }

        System.out.println(
                "\nStep 3: Biased exponent"
        );

        System.out.println(
                exponent + " + " +
                bias + " = " +
                biasedExponent
        );

        System.out.println(
                "Exponent: " + exponentBinary
        );

        // STEP 4: Sign
        String sign = "0";

        System.out.println(
                "\nStep 4: Components"
        );

        System.out.println(
                "Sign     : " + sign
        );

        System.out.println(
                "Exponent : " + exponentBinary
        );

        System.out.println(
                "Mantissa : " + mantissa
        );

        String finalRepresentation =
                sign + exponentBinary + mantissa;

        System.out.println(
                "\n32-bit representation:"
        );

        System.out.println(finalRepresentation);

        scanner.close();
    }
}