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
}
