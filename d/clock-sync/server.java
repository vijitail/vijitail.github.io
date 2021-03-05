import java.net.*;
import java.io.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class SCServer {

    public static void main(String[] args) {

        final int PORT = 8001;

        try {

            ServerSocket serverSocket = new ServerSocket(PORT);
            System.out.println("Server is accepting message at PORT " + PORT);

            Socket socket = serverSocket.accept();

            DataInputStream inputStream = new DataInputStream(socket.getInputStream());

            String receieve;

            DateFormat dateFormat = new SimpleDateFormat("hh:mm:ss.SSSS");

            while ((receieve = inputStream.readLine()) != null) {
                String[] message = receieve.split(",");
                if (message[0].toLowerCase().equals("stop"))
                    break;

                Date date = new Date();

                Long clientTime = Long.parseLong(message[1]);
                Long timeMilli = date.getTime();

                Long requiredTime = timeMilli - clientTime;

                System.out.println("This is the message: " + message[0]);

                System.out.println("Server will not accept the message if its taken more than 2 milisecond.");

                String formattedClientTime = dateFormat.format(clientTime);

                if (clientTime.equals(timeMilli)) {
                    String strDate = dateFormat.format(timeMilli);
                    System.out.println("Message sending time and receving time is same:" + strDate);
                } else if (requiredTime > 2) {
                    System.out.println("Message sending time from client:" + formattedClientTime + "\n");
                    String strDate = dateFormat.format(timeMilli);
                    System.out.println("Message received from client to:" + strDate + "\n");
                    System.out.println("This message is rejected.");
                } else {
                    System.out.println("Message sending time from client:" + formattedClientTime + "\n");
                    String strDate = dateFormat.format(timeMilli);
                    System.out.println("Message received from client to:" + strDate + "\n");
                    System.out.println("This message is accepted.");
                }
            }
            inputStream.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
