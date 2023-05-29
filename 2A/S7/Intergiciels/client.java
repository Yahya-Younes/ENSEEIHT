import java.io.*;
import java.net.*;


public class client {
    public static void  main (String [] args){
        Socket client_socket = new Socket("localhost", 4999);
        System.out.println("I am connected to port 4999");
    }
}