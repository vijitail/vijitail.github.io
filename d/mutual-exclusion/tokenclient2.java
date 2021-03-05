
import java.io.*;
import java.net.*;

public class TokenClient2 {
    static boolean setSendData;
    static boolean hasToken;

    public static void main(String arg[]) throws Exception {
        InetAddress lclhost;
        BufferedReader br;
        String str1;
        TokenClient21 tkcl;
        TokenClient21 ser;
        while (true) {
            lclhost = InetAddress.getLocalHost();
            tkcl = new TokenClient21(lclhost);
            tkcl.setRecPort(8004);
            tkcl.setSendPort(9002);
            lclhost = InetAddress.getLocalHost();
            ser = new TokenClient21(lclhost);
            ser.setSendPort(9000);

            if (hasToken == true) {
                System.out.println("Do you want to enter the Data -->YES/NO");
                br = new BufferedReader(new InputStreamReader(System.in));
                str1 = br.readLine();
                if (str1.equalsIgnoreCase("yes")) {
                    System.out.println("ready to send");
                    ser.setSendData = true;
                    ser.sendData();
                    ser.setSendData = false;
                } else if (str1.equalsIgnoreCase("no")) {
                    tkcl.sendData();
                    tkcl.recData();

                }
            } else {
                System.out.println("ENTERING RECEIVING MODE...");
                tkcl.recData();
                hasToken = true;
            }
        }
    }
}

class TokenClient21 {
    InetAddress lclhost;
    int sendport, recport;
    boolean setSendData = false;
    boolean hasToken = false;
    TokenClient21 tkcl;
    TokenClient21 ser;

    TokenClient21(InetAddress lclhost) {
        this.lclhost = lclhost;
    }

    void setSendPort(int sendport) {
        this.sendport = sendport;
    }

    void setRecPort(int recport) {
        this.recport = recport;
    }

    void sendData() throws Exception {
        BufferedReader br;
        String str = "Token";
        DatagramSocket ds;
        DatagramPacket dp;
        if (setSendData == true) {
            System.out.println("Enter the Data");
            br = new BufferedReader(new InputStreamReader(System.in));
            str = "ClientTwo....." + br.readLine();
            System.out.println("now sending.....");
            System.out.println("Data Sent");
        }
        ds = new DatagramSocket(sendport);
        dp = new DatagramPacket(str.getBytes(), str.length(), lclhost, sendport - 1000);
        ds.send(dp);
        ds.close();
        setSendData = false;
        hasToken = false;
    }

    void recData() throws Exception {
        String msgstr;
        byte buffer[] = new byte[256];
        DatagramSocket ds;
        DatagramPacket dp;
        ds = new DatagramSocket(recport);
        dp = new DatagramPacket(buffer, buffer.length);
        ds.receive(dp);
        ds.close();
        msgstr = new String(dp.getData(), 0, dp.getLength());
        System.out.println("The data is " + msgstr);
        if (msgstr.equals("Token")) {
            hasToken = true;
        }
    }
}
