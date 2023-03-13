package myPkg;

public class SimpleBean { // DTO, VO, Bean
	private String msg;
	
	public SimpleBean() {
		System.out.println("SimpleBean 생성자");
	}

	public String getMsg() {
		System.out.println("getMsg()");
		return msg;
	}

	public void setMsg(String msg) {
		System.out.println("setMsg(String msg)");
		this.msg = msg;
	}
	
	
}
