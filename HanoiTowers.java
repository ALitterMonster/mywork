
public class HanoiTowers {
	private int count=0;
	
	public static void culTower(int n,String A,String B,String C){
		if(n==1){
			System.out.println(n+":从"+A+"到"+C);
		}else{
			culTower(n-1, A, C, B);
			System.out.println(n+":从"+A+"到"+C);
			culTower(n-1, B, A, C);
		}
	}
	public static void main(String agrc[]){
		culTower(3, "A", "B", "C");
	}
}
