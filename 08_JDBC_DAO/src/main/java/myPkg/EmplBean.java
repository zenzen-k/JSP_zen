package myPkg;

public class EmplBean {
	private int num;
	private String name;
	private int deptno;
	private int salary;
	
	public EmplBean() {
		super();
	}

	public EmplBean(String name, int deptno, int salary) {
		super();
		this.name = name;
		this.deptno = deptno;
		this.salary = salary;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		System.out.println("num");
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		System.out.println("name");
		this.name = name;
	}
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	
}
