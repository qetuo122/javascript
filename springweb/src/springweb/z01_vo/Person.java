package springweb.z01_vo;
// springweb.z01_vo.Person
public class Person {
	private String alias;
	private int age;
	private String loc;
	public Person() {}
	
	public Person(String alias, int age, String loc) {
		super();
		this.alias = alias;
		this.age = age;
		this.loc = loc;
	}

	public String getName() { // el, mybatis에도  #{name01}
		return alias;
	}
	public void setName(String alias) {
		this.alias = alias;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	
}
