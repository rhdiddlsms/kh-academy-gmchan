package 수업요약.Server20201119;

import java.io.FileInputStream;

public class Application {
    public static void main(String[] args) {
        try {
            // 서버 소켓 생성
            final ServerSocket serverSocket = new ServerSocket(12345);
            // 외부의 접속을 대기
            
            final Socket socket = serverSocket.accept();
            
            // 1. 접속한 클라이언트에게 메세지를 하나 받음
            recvMessage(socket.getInputStream());
            
            // 2. 접속한 클라이언트에게 메세지를 보냄
            sendMessage(socket.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static void recvMessage(InputStream is) throws IOException {
        final byte[] buffer = new byte[4096];
        int readBytes;

        while ((readBytes = is.read(buffer)) != -1) {
            final String messageFromClient = new String(buffer);
            System.out.println(messageFromClient);
        }
    }

    private static void sendMessage(OutputStream os) {
        
    }
}

/**
 * 서버측에서
 * Socket발생
 * - InputStream(클라에게 받음)
 * - OutputStream( 클라에게 보냄)
 * 
 * `
 */