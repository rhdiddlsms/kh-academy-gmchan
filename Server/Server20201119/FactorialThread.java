public class FactorialThread extends Thread{

    private long data =1;

    @Override
    public void run(){
        for (int i =1; i <=20; i++){
            data *=i;
        }
    }
    
}
