TCPServerChat.java

import java.net.*;
import java.io.*;

public class TCPServerChat {
    public static void main(String args[]) {
        try {

            final int PORT = 8001;
            ServerSocket serverSocket = new ServerSocket(PORT);

            System.out.println("Server Ready For Chat on PORT " + PORT);

            Socket socket = serverSocket.accept();
            BufferedReader inputBReader = new BufferedReader(new InputStreamReader(System.in));

            DataOutputStream outputStream = new DataOutputStream(socket.getOutputStream());
            DataInputStream inputStream = new DataInputStream(socket.getInputStream());
            String receive;
            String send;

            while ((receive = inputStream.readLine()) != null) {
                if (receive.toLowerCase().equals("stop"))
                    break;
                System.out.println("Client Says: " + receive);
                System.out.print("Server say:) ");
                send = inputBReader.readLine();
                outputStream.writeBytes(send + "\n");
            }

            inputBReader.close();
            inputStream.close();
            outputStream.close();
            serverSocket.close();

        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }
}
