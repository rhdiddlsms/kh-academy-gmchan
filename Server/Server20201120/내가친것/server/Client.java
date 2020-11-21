package server;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.nio.charset.StandardCharsets;

/**
 * 여기서 클라이언트는 서버에서 접속자를 관리하기 위한 객체 클라이언트임
 * 채팅 클라이언트가 아님!!!!!
 * 
 * Client가 하는일!
 * 1. 접속자의 데이터를 수신하고 ClientManager에게 broadcast를 부탁
 * 2. 접속자에게 전송
 */

public class Client extends Thread {

	private final Socket socket;

	public Client(Socket clientSocket) {
		socket = clientSocket;
	}

	@Override
	public void run() {
		try {
			final InputStream in = socket.getInputStream();
			final byte[] buffer = new byte[4096]; //메세지 담을 곳
			int readBytes; //읽은 메세지 바이트 수
			while((readBytes = in.read(buffer)) != -1) {
				final String dataFromClient = new String(buffer, StandardCharsets.UTF_8 );  //첫번째 인자 : buffer 두번쨰 : 어떤 인코딩을 할건지

				String.format("[%s]: %s", socket.getInetAddress().getHostAddress(), dataFromClient);
				ClientManager.broadcast(message);
			}

		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	//밖으로 쏘는것 outputStream
	public void sendMessage(String message) {
		try {
			final OutputStream out = socket.getOutputStream();
			out.write(message.getBytes(StandardCharsets.UTF_8));
			out.flush();
			
		}catch(IOException e){
			e.printStackTrace();

		}
	}

}
