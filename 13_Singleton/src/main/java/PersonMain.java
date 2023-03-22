
public class PersonMain {
	public static void main(String[] args) {
		//PersonDao p1 = new PersonDao();
		//PersonDao p2 = new PersonDao();
		// 만약 변수가 private이 아니었다면 p1.name = "홍길동" 이런식의 접근이 가능~
		
		// PersonDao객체의 주소를 리턴해준다
		PersonDao p1 = PersonDao.getInstance();
		PersonDao p2 = PersonDao.getInstance(); // 위에서 생성한 객체의 주소를 리턴해준다.
		
		p1.name = "홍길동";
		p1.age = 20;
		
		System.out.println("p1: " + p1);
		System.out.println("p2: " + p2);
		
		
	}
}
