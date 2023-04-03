package my.shop.mall;

import java.util.Vector;

import my.shop.ProductBean;
import my.shop.ProductDao;

// 장바구니. 장바구니에는 상품정보가 여러개 담긴다.
public class CartBean {
	private Vector<ProductBean> clist; // 상품정보를 담음. 즉 장바구니

	public CartBean() {
		clist = new Vector<ProductBean>(); // 벡터의 객체를 생성함.
	}
	
	// 장바구니에 담을 수 있는 메서드
	public void addProduct(String pnum, String oqty) {
		// 현재 clist 에는 장바구니에 넣은 11상품정보, 14상품정보 등이 담겨있ㄴㅇ
		// 이미 장바구니에 들어가있는데 14를 또 넣으면 또들어가니까 문제생김
		// 벡터는 순서가 있으므로 list를 이용해 for문으로 접근할 수 있당.
		
		int pnum_new = Integer.parseInt(pnum);
		int oqty_new = Integer.parseInt(oqty);
		
		boolean flag = false;
		
		for(ProductBean x : clist) {
			if(x.getPnum() == pnum_new) { // 이미 장바구니에 있다면
				flag = true;
				// 주문수량에 새로운 주문수량(oqty) 추가
				x.setPqty(x.getPqty() + oqty_new);
				System.out.println("수량" + x.getPqty());
				break;
			}
		}
		if(!flag) {
			ProductDao pdao = ProductDao.getInstance();
			ProductBean pb = pdao.getProductByNum(pnum);
			// 원래는 pqty는 관리자가 사용하던 재고수량이었음
			// 이 자리에 주문수량을 넣음~!
			pb.setPqty(Integer.parseInt(oqty)); // 주문수량을 임시로 재고수량 자리에 넣은상태임
			// DB 테이블까지 접근한 상태는 아니다. -> 떄문에 같은걸 넣을때 중복으로 여러개가 막 뜸
			
			
			clist.add(pb); // 넘어온 상품번호에 해당하는 상품의 정보를 clist에 넣음
		}
		System.out.println("장바구니 상품 개수 : " + clist.size());
	}
	
	
	// 장바구니에 담은 상품을 출력하는 메서드
	public Vector<ProductBean> getAllProducts() {
		return clist;
	}
	
	//주문수량 수정버튼 클릭했을때
	public void setEdit(String pnum, String oqty) {
		for(ProductBean pb : clist) { // pb에는 상품번호가 들어감!
			if(pb.getPnum() == Integer.parseInt(pnum)) {
				if(Integer.parseInt(oqty) == 0) {
					clist.removeElement(pb);
					break;
				} else {
					pb.setPqty(Integer.parseInt(oqty));
					break;
				}
			}
		}
	}
	
	//장바구니 삭제
	public void removeProduct(String pnum) {
		for(ProductBean pb : clist) { 
			if(pb.getPnum() == Integer.parseInt(pnum)) {
				clist.removeElement(pb);
				break;
			}
		}
	}
	
	// 장바구니 전체삭제
	public void removeAllProduct() {
		clist.removeAllElements();
	}
}
