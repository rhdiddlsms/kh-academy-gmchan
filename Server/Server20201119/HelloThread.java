
public class HelloThread extends Thread{
 
    @Override
    public void run(){
        while(true){
            System.out.println("안녕");
        }
    }
}
