import java.io.*;
import java.net.*;
import java.util.StringTokenizer;

final class RPCServer {
    DatagramSocket ds;
    DatagramPacket dp;

    String str, methodName;

    int val1, val2, result;

    RPCServer() {
        try {

            final int PORT = 1200;

            ds = new DatagramSocket(PORT);

            byte b[] = new byte[4096];
            while (true) {
                dp = new DatagramPacket(b, b.length);
                ds.receive(dp);

                str = new String(dp.getData(), 0, dp.getLength());

                if (str.equalsIgnoreCase("q")) {
                    System.exit(1);
                }

                StringTokenizer tokenizer = new StringTokenizer(str, " ");

                while (tokenizer.hasMoreTokens()) {
                    String token = tokenizer.nextToken();
                    methodName = token.toLowerCase();
                    val1 = Integer.parseInt(tokenizer.nextToken());
                    val2 = Integer.parseInt(tokenizer.nextToken());
                }
                System.out.println(str);

                InetAddress address = InetAddress.getLocalHost();
                final int DEST_PORT = 1300;

                switch (methodName) {
                    case "add":
                        result = val1 + val2;
                        break;
                    case "sub":
                        result = val1 - val2;
                        break;
                    case "mul":
                        result = val1 * val2;
                        break;
                    case "div":
                        result = val1 / val2;
                        break;
                }

                byte resultBytes[] = Integer.toString(result).getBytes();
                DatagramSocket datagramSocket = new DatagramSocket();

                DatagramPacket datagramPacket = new DatagramPacket(resultBytes, resultBytes.length, address, DEST_PORT);

                System.out.println("Result: " + result + "\n");
                datagramSocket.send(datagramPacket);
            }
        }

        catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static void main(String[] args) {
        new RPCServer();
    }
}
