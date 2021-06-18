package rentcarModel;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class RentcarDAO {
	
	String id = "����Ŭ ���̵�";
	String pass = "����Ŭ ��й�ȣ";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	
	Connection con;
	
	PreparedStatement pstmt;
	
	ResultSet rs;
	
	public void getCon() {
		
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			con = DriverManager.getConnection(url, id, pass);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
	}
	
	//�ֽż� 3���� �ڵ����� �����ϴ� �޼ҵ�
	public Vector<CarListBean> getSelectCar() {
		
		Vector<CarListBean> vec = new Vector<CarListBean>();
		
		try {
			
			getCon();
			
			String sql = "select * from rentcar order by no desc";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			int count = 0;
			
			while(rs.next()) {
				
				CarListBean bean = new CarListBean();
				
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				
				vec.add(bean);
				
				count++;
				
				if(count > 2) {break;}
			}
			
			con.close();
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return vec;
	}
	
	public Vector<CarListBean> getCategoryCar(int category) {
		
		Vector<CarListBean> vec = new Vector<CarListBean>();
		
		try {
			
			getCon();
			
			String sql = "select * from rentcar where category=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, category);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				CarListBean bean = new CarListBean();
				
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				
				vec.add(bean);
				
			}
			
			con.close();
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return vec;
		
	}
	
	public Vector<CarListBean> getAllCar() {
		
		Vector<CarListBean> vec = new Vector<CarListBean>();
		
		try {
			
			getCon();
			
			String sql = "select * from rentcar";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				CarListBean bean = new CarListBean();
				
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				
				vec.add(bean);
				
			}
			
			con.close();
			
		} catch (Exception e) {

			e.printStackTrace();
			
		}
		
		return vec;
	}
	
	public CarListBean getOneCar(int no) {
		
		CarListBean bean = new CarListBean();
		
		try {
			
			getCon();
			
			String sql = "select * from rentcar where no=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				
			}
			
			con.close();
		
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return bean;
	}
	
	public int getMember(String id, String pass) {
		
		//0�̸� ȸ�� ����
		int result = 0;
		
		try {
			
			getCon();
			
			String sql = "select count(*) from member where id=? and pass1=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				//0�Ǵ� 1�� �����
				result = rs.getInt(1);
			}
			
			con.close();
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return result;
	}
	
	public void setReserveCar(CarReserveBean rBean) {
		
		try {
			
			getCon();
			
			String sql = "insert into carreserve values(reserve_seq.NEXTVAL,?,?,?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rBean.getNo());
			pstmt.setString(2, rBean.getId());
			pstmt.setInt(3, rBean.getQty());
			pstmt.setInt(4, rBean.getdDay());
			pstmt.setString(5, rBean.getrDay());
			pstmt.setInt(6, rBean.getUseIn());
			pstmt.setInt(7, rBean.getUseWifi());
			pstmt.setInt(8, rBean.getUseNavi());
			pstmt.setInt(9, rBean.getUseSeat());
			
			pstmt.executeUpdate();
			
			con.close();
					
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
	}
		
		public Vector<CarViewBean> getAllReserve(String id) {
			
			Vector<CarViewBean> vec = new Vector<CarViewBean>();
			
			try {
				
				getCon();
				
				String sql = "select * from rentcar natural join carreserve "
						+ "where sysdate < to_date(rday,'YYYY-MM-DD') and id=?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					
					CarViewBean cBean = new CarViewBean();
					
					//������ ������ ����� ������ ������
					cBean.setName(rs.getString(2));
					cBean.setPrice(rs.getInt(4));
					cBean.setImg(rs.getString(7));
					cBean.setQty(rs.getInt(11));
					cBean.setdDay(rs.getInt(12));
					cBean.setrDay(rs.getString(13));
					cBean.setUseIn(rs.getInt(14));
					cBean.setUseWifi(rs.getInt(15));
					cBean.setUseNavi(rs.getInt(16));
					cBean.setUseSeat(rs.getInt(17));
					
					vec.add(cBean);
				}
				
				con.close();
				
			} catch (Exception e) {
				
				e.printStackTrace();
				
			}
			
			return vec;
	}
		
		public void carRemoveReserve(String id, String rDay) {
			
			try {
				
				getCon();
				
				String sql = "delete from carreserve where id=? and rDay=?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, rDay);
				pstmt.executeUpdate();
				
				con.close();
						
			} catch (Exception e) {
				
				e.printStackTrace();
				
			}
		}
}
