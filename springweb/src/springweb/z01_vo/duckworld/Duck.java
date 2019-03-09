package springweb.z01_vo.duckworld;
// springweb.z01_vo.duckworld.Duck
public class Duck {
	private String kind;
	private Flyway fly;
	
	public Duck() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Duck(String kind) {
		super();
		this.kind = kind;
	}
	public void flying() {
		System.out.println(kind+" ");
		if(fly!=null) {
			fly.flying();
		}
	}
	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public Flyway getFly() {
		return fly;
	}

	public void setFly(Flyway fly) {
		this.fly = fly;
	}
	
	
}
