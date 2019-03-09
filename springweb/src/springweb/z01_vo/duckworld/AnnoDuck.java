package springweb.z01_vo.duckworld;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

// springweb.z01_vo.duckworld.AnnoDuck
public class AnnoDuck {
	private String kind;
	// Flyway으로 할당이 가능한 객체는 자동을 할당하세요..
	// flyway = new LakeFlying();
	// Flyway로 현재 등록된 실제 객체가 2개가 할당될 수 있기 때문에,
	// Qualifier를 이용해서 특정한 객체를 지정할 수 있다.
	@Autowired
	@Qualifier("lakeFlying") 
	private Flyway flyway;
	
	public void setKind(String kind) {
		this.kind = kind;
	}
	public void flying() {
		System.out.println(kind+" ");
		if(flyway!=null) {
			flyway.flying();
		}
	}
	
}
