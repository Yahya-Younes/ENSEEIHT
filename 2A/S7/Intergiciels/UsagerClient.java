import java.*;

public class UsagerClient {

        final static String hosts[] = {"host1", "host2", "host3"};
        final static int ports[] = {8081,8082,8083};
        final static int nb = 3;
        static String document[] = new String[nb];

        int nbfrag;

        public int (int n) {
            this.nbfrag = n;
        }

        for (int i = 0; nbfrag < 3; i++)
            String serverName = hosts[i];
            int port = ports[i];

        try {
                   System.out.println("Connecting to " + serverName + " on port " + port);
                   Socket client = new Socket(serverName, port);
                   
                   System.out.println("Just connected to " + client.getRemoteSocketAddress());
                   OutputStream outToServer = client.getOutputStream();
                   DataOutputStream out = new DataOutputStream(outToServer);
        }           
                   out.write("Hello from " + client.getLocalSocketAddress() +"give me the fragment number ", i );
                   InputStream inFromServer = client.getInputStream();
                   DataInputStream in = new DataInputStream(inFromServer);
                   
                   System.out.println("Server says " + in.readUTF());
                   client.close();
                } catch (IOException e) {
                   e.printStackTrace();
                }
             }
          }
          
          
}

public class UsagerServer {
        public class GreetingServer extends Thread {
                private ServerSocket serverSocket;
                Slave s_i
                public GreetingServer(int port) throws IOException {
                   serverSocket = new ServerSocket(port);
                   serverSocket.setSoTimeout(10000);
                }
                public Slave (Slave slave){
                  this.s_i = slave
                }
             
                public void run() {
                   while(true) {
                      try {
                         System.out.println("Waiting for client on port " + serverSocket.getLocalPort() + "...");
                         Slave slave_i = serverSocket.accept();
                         
                         System.out.println("Just connected to " + server.getRemoteSocketAddress());
                         DataInputStream in = new DataInputStream(server.getInputStream());
                         
                         System.out.println(in.readUTF());
                         DataOutputStream out = new DataOutputStream(server.getOutputStream());
                         out.writeUTF("Thank you for connecting to " + server.getLocalSocketAddress() + "\nGoodbye!");
                         server.close();
                         
                      } catch (SocketTimeoutException s) {
                         System.out.println("Socket timed out!");
                         break;
                      } catch (IOException e) {
                         e.printStackTrace();
                         break;
                      }
                   }
                }
             
}