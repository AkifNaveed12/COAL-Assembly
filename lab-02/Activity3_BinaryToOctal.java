import  java.util.Scanner;
public class Activity3_BinaryToOctal {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        // ask user to enter binary no
        System.out.println("Binary to Octal: ");
        System.out.println("Enter the number: ");

        String binary = scanner.nextLine();

        // convert binary to decimal
        int decimal = Integer.parseInt(binary, 2);

        // convert decimal to octal 
        String octal = Integer.toOctalString(decimal);

        // Display octal value
        System.out.println(" octal value is : " + octal);

        scanner.close();
    }

}
