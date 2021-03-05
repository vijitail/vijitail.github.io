import java.net.*;
import java.io.*;

public class TCPClientChat {
    public static void main(String args[]) {
        try {
            final int PORT = 8001;
            final String HOST = "LocalHost";
            Socket clientSocket = new Socket(HOST, PORT);
            BufferedReader inpBufferedReader = new BufferedReader(new InputStreamReader(System.in));

            DataOutputStream outputStream = new DataOutputStream(clientSocket.getOutputStream());
            DataInputStream inputStream = new DataInputStream(clientSocket.getInputStream());
            String send;
            System.out.println("Type STOP/Stop/stop if want to end the chat!");
            System.out.print("Client say:) ");
            while ((send = inpBufferedReader.readLine()) != null) {
                outputStream.writeBytes(send + "\n");
                if (send.toLowerCase().equals("stop"))
                    break;
                System.out.println("Server say:) " + inputStream.readLine());
                System.out.print("Client say:) ");
            }
            inpBufferedReader.close();
            inputStream.close();
            outputStream.close();
            clientSocket.close();
        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }
}
