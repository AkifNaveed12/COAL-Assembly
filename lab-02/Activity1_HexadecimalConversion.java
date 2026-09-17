import java.util.Scanner;

public class Activity1_HexadecimalConversion {

    public static void main(String[] args){

        //scanner object 
        Scanner scanner = new Scanner(System.in);

        // usk user for hexa character entry
        System.out.println("Please enter a number: ");
        String hexadecimal = scanner.next();


        //converrt hexa to decimal 
        int decimal = Integer.parseInt(hexadecimal, 16);

        //display value
        System.out.println("Converted decimal number is : " + decimal);
        //converted decimal to binary
        String binary = Integer.toBinaryString(decimal);

        System.out.println("Hexadecimal to binary conversion of: " + hexadecimal + " is " + binary);
        
        // convert decimal to octal 
        String octal = Integer.toOctalString(decimal);

        System.out.println("hexadecimal to octal conversion of " + hexadecimal + " is " + octal);

        scanner.close();
    }
    
}
