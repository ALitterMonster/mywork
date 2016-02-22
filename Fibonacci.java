
public class Fibonacci {
	
	public static void main(String agrc[]){
		for(int count=1;count<11;count++){
			System.out.println(algFibonacci(count));
		}
	}
	public static int algFibonacci(int n){
		if(n<=1){
			return n;
		}else{
			return algFibonacci(n-1)+algFibonacci(n-2);
		}
	}
}
