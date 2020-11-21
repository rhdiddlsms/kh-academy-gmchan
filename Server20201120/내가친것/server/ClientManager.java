package server;

import java.net.Socket;
import java.util.*;

public class ClientManager {
	
	private static final ClientManager INSTANCE = new ClientManager();
	
	private List<Client> clients = new ArrayList<>();
	
	//�ܺο��� �ν��Ͻ� ������ ����
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
		//1. Ŭ���̾�Ʈ ��ü ���
		clients.add(client);
		//2. Ŭ���̾�Ʈ ������ ����
		client.start();
		
	}

	public void broadcast(String message) {
		for(Client client : clients) {
			client.sendMessage(message);
		}
		
	}

}
