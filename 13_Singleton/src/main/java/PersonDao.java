
public class PersonDao {
	
	String name;
	int age;
	
	private static PersonDao pdao;
	
	public static PersonDao getInstance() {
		if(pdao == null) {
			pdao = new PersonDao();
		}
		return pdao;
	}
	private PersonDao() {
		System.out.println("PersonDao 객체 생성");
	}
}

// 생성자는 private 설정
