package server;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.nio.charset.StandardCharsets;

/**
 * ���⼭ Ŭ���̾�Ʈ�� �������� �����ڸ� �����ϱ� ���� ��ü Ŭ���̾�Ʈ��
 * ä�� Ŭ���̾�Ʈ�� �ƴ�!!!!!
 * 
 * Client�� �ϴ���!
 * 1. �������� �����͸� �����ϰ� ClientManager���� broadcast�� ��Ź
 * 2. �����ڿ��� ����
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
			final byte[] buffer = new byte[4096]; //�޼��� ���� ��
			int readBytes; //���� �޼��� ����Ʈ ��
			while((readBytes = in.read(buffer)) != -1) {
				final String dataFromClient = new String(buffer, StandardCharsets.UTF_8 );  //ù��° ���� : buffer �ι��� : � ���ڵ��� �Ұ���

				String.format("[%s]: %s", socket.getInetAddress().getHostAddress(), dataFromClient);
				ClientManager.broadcast(message);
			}

		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	//������ ��°� outputStream
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
