package myPkg;

public class Ex04_Bean {
	private String name;
	private String password;
	private String[] fruit;
	
	
	public Ex04_Bean() {
		super();
	}

	public Ex04_Bean(String name, String password, String[] fruit) {
		super();
		this.name = name;
		this.password = password;
		this.fruit = fruit;
	}
	
	public String[] getFruit() {
		return fruit;
	}
	public void setFruit(String[] fruit) {
		this.fruit = fruit;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
