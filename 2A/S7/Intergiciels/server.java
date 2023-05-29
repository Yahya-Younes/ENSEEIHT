import java.io.*;
import java.net.*;


public class server {
    public void static main (String [] args){
        Servesocket sever_socket = new Serversocket("localhost", 4999);
        Socket ss = sever_socket.accept();
        System.out.println("Client connected")
    }
}