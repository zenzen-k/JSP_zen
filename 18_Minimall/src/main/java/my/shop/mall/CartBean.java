package my.shop.mall;

import java.util.Vector;

import my.shop.ProductBean;
import my.shop.ProductDao;

// 장바구니. 장바구니에는 상품정보가 여러개 담긴다.
public class CartBean {
	private Vector<ProductBean> clist; // 상품정보를 담음

	public CartBean() {
		clist = new Vector<ProductBean>(); // 벡터의 객체를 생성함.
	}
	
	// 장바구니에 담을 수 있는 메서드
	public void addProduct(String pnum, String oqty) {
		ProductDao pdao = ProductDao.getInstance();
		ProductBean pb = pdao.getProductByNum(pnum);
		// 원래는 pqty는 관리자가 사용하던 재고수량이었음
		// 이 자리에 주문수량을 넣음~!
		pb.setPqty(Integer.parseInt(oqty));
		clist.add(pb); // 넘어온 상품번호에 해당하는 상품의 정보를 clist에 넣음
		System.out.println("장바구니 상품 개수 : " + clist.size());
	}
	
	
	// 장바구니에 담은 상품을 출력하는 메서드
	public Vector<ProductBean> getAllProducts() {
		return clist;
	}
}
