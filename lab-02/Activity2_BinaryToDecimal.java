import java.util.Scanner;
public class Activity2_BinaryToDecimal {
    public static void main(String[] args){
         // SCANNER OBJECT
    Scanner scanner = new Scanner(System.in);

    //ask user to enter binary no
    System.out.println("Binary to Decimal: ");
    System.out.println("Enter a number: ");

    String binary  = scanner.nextLine();

    // convert binary to decimal
    int decimal = Integer.parseInt(binary, 2);

    // display decimal value
    System.out.println(" decimal value is : " + decimal);

    scanner.close();
    }
}
