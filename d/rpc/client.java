import java.io.*;
import java.net.*;

public class RPCClient {
    RPCClient() {
        try {

            InetAddress address = InetAddress.getLocalHost();
            DatagramSocket datagramSocket = new DatagramSocket();
            DatagramSocket datagramSocketForServer = new DatagramSocket(1300);

            System.out.println("RPC Client");
            System.out.println("Enter a method name and parameter like add num1 num2\n");

            final int PORT = 1200;

            while (true) {
                BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
                String str = br.readLine();
                byte b[] = str.getBytes();
                DatagramPacket dp = new DatagramPacket(b, b.length, address, PORT);
                datagramSocket.send(dp);
                dp = new DatagramPacket(b, b.length);
                datagramSocketForServer.receive(dp);
                String s = new String(dp.getData(), 0, dp.getLength());
                System.out.println("Result: " + s + "\n");

            }

        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }

    public static void main(String[] args) {
        new RPCClient();
    }
}
