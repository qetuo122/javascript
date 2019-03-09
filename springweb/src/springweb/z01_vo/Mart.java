package springweb.z01_vo;

import java.util.ArrayList;
//  springweb.z01_vo.Mart
public class Mart {
	private String name;
	private Product product;
	private ArrayList<Product> plist;
	public Mart() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Mart(String name) {
		super();
		this.name = name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public ArrayList<Product> getPlist() {
		return plist;
	}
	public void setPlist(ArrayList<Product> plist) {
		this.plist = plist;
	}
	public void buy() {
		System.out.println(name+"마트에 가서 ");
		if(product!=null) {
			System.out.println(product.getName()+"를 "+product.getCnt()+"개 구매하였다.");
		}
	}
	public void buyList() {
		System.out.println(name+"마트에 가서 ");
		System.out.println("구매한 물건 리스트..");
		if(plist!=null && plist.size()>0) {
			int tot=0;
			for(Product p:plist) {
				System.out.println(p.getName()+"\t"
						+p.getPrice()+"\t"+p.getCnt()+"\t"
						+p.getPrice()*p.getCnt());
				tot+=p.getPrice()*p.getCnt();
			}
			System.out.println("총 구매 비용:"+tot);
		}
	}
	
	
}
