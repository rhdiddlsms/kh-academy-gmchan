package kr.or.iei.ex20201120.multichat.server;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class Application {

    // 포트번호: 0 ~ 65535
    private static final int PORT = 12345;

    public static void main(String[] args) {
        try {
            final ServerSocket serverSocket = new ServerSocket(PORT);
            Socket clientSocket;
            System.out.println("서버 시작됨");
            while ((clientSocket = serverSocket.accept()) != null) {
                System.out.println("클라이언트같은거들어옴");
                ClientManager.registerClient(clientSocket);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
