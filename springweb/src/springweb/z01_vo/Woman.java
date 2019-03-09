package springweb.z01_vo;
// springweb.z01_vo.Woman
public class Woman {
	private String name;
	private String favFood;
	public Woman() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Woman(String name, String favFood) {
		super();
		this.name = name;
		this.favFood = favFood;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFavFood() {
		return favFood;
	}
	public void setFavFood(String favFood) {
		this.favFood = favFood;
	}
	
}
