public class LoadBalancer {
    static String hosts[] = {"host1", "host2"};
    static int ports[] = {8081,8082};
    static int nbHosts = 2;
    static Random rand = new Random();  

    private ServerSocket serverSocket;
   
    public GreetingServer(int port) throws IOException {
      serverSocket = new ServerSocket(port);
      serverSocket.setSoTimeout(10000);
      


    public void run() {
      while(true) {
         try {
            // Socket Serveur pour recevoir les requetes https depuis le client
            System.out.println("Waiting for http requete on port " + serverSocket.getLocalPort() + "...");
            Socket server = serverSocket.accept();
            
            // Flux entrant du client vers le LoadBalancer
            System.out.println("Just connected to " + server.getRemoteSocketAddress());
            DataInputStream inLoadBalancer1 = new DataInputStream(server.getInputStream());
            

            // Create Socket Client pour envoyer les requtes http aux servuers Web 
            // Choosing random Web Server : Random host and its port
            rand = rand.nextInt(nbHosts);
            serverName = hosts[rand];
            port = ports[rand]; 
            
            // Connecting to the random WebServer we choosed previously randomly
            System.out.println("Connecting to " + serverName + " on port " + port);
            Socket client = new Socket(serverName, port);
            
            System.out.println("Just connected to the WebServer " + client.getRemoteSocketAddress());

            // Flux sortant du LoadBalancer vers le WebServer
            OutputStream outToServer = client.getOutputStream();
            DataOutputStream outLoadBalancer1 = new DataOutputStream(outToServer);
            out.writeUTF("Hello from " + client.getLocalSocketAddress() + "is sending" + inLoadBalancer1 );
            
            // Flux entrant dans LoadBalancer depuis le WebSever
            InputStream inFromServer = client.getInputStream();
            DataInputStream inLoadBalancer2 = new DataInputStream(inFromServer);
         
             System.out.println("Server says " + in.readUTF());




            // Flux sortant du LoadBalancer vers le client
            System.out.println(in.readUTF());
            DataOutputStream outLoadBalancer2 = new DataOutputStream(server.getOutputStream());
            
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



   public class GreetingClient {

   public static void main(String [] args) {
      String serverName = args[0];
      int port = Integer.parseInt(args[1]);
      try {
         System.out.println("Connecting to " + serverName + " on port " + port);
         Socket client = new Socket(serverName, port);
         
         System.out.println("Just connected to " + client.getRemoteSocketAddress());
         OutputStream outToServer = client.getOutputStream();
         DataOutputStream out = new DataOutputStream(outToServer);
         
         out.writeUTF("Hello from " + client.getLocalSocketAddress());
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


