import java.net.*;
import java.io.*;
import java.util.Date;

public class SCClient {
    public static void main(String[] args) {
        final int PORT = 8001;
        final String HOST = "LocalHost";
        try {
            Socket socket = new Socket(HOST, PORT);
            BufferedReader inputBuffer = new BufferedReader(new InputStreamReader(System.in));
            DataOutputStream outputStream = new DataOutputStream(socket.getOutputStream());
            String send;
            System.out.println("Type a message to send into server");
            while ((send = inputBuffer.readLine()) != null) {
                Date date = new Date();
                long timeMilli = date.getTime();
                String t = String.valueOf(timeMilli);
                outputStream.writeBytes(send + "," + t + "\n");
                if (send.toLowerCase().equals("stop"))
                    break;
            }
            inputBuffer.close();
            outputStream.close();
            socket.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
