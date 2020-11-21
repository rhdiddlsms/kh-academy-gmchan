package server;

import java.net.Socket;
import java.util.*;

public class ClientManager {
	
	private static final ClientManager INSTANCE = new ClientManager();
	
	private List<Client> clients = new ArrayList<>();
	
	//외부에서 인스턴스 생성을 막음
	private ClientManager() {
		
	}

	public static ClientManager getInstance() {
		return INSTANCE;
	}
	
	public static void registerClient(Socket clientSocket) {
		getInstance().addClient(clientSocket);
		
	}

	private void addClient(Socket clientSocket) {
		final Client client = new Client(clientSocket);
		//1. 클라이언트 객체 등록
		clients.add(client);
		//2. 클라이언트 스레드 시작
		client.start();
		
	}

	public void broadcast(String message) {
		for(Client client : clients) {
			client.sendMessage(message);
		}
		
	}

}
