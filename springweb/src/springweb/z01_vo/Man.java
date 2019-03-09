package springweb.z01_vo;
// springweb.z01_vo.Man
public class Man {
	private String name;
	private int age;
	private Woman woman;
	public Man() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Man(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public Woman getWoman() {
		return woman;
	}
	public void setWoman(Woman woman) {
		this.woman = woman;
	}
	public void show() {
		System.out.println("이름은 "+name);
		System.out.println("나이는  "+age);
		if(woman!=null) {
			System.out.println("그녀의 이름은 "+woman.getName());
			System.out.println("그녀가 좋아하는 음식은"+woman.getFavFood());
		}
	}
	
}
