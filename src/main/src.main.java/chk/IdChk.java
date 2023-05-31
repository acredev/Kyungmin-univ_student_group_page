package chk;

import java.sql.*;

public class IdChk
{
	public int idchk (String id)
	{
		int result = -1;
		try
		{
			// JDBC 드라이버 연결
			Class.forName("com.mysql.jdbc.Driver");
			String db_address = "jdbc:mysql://127.0.0.1:3306/19831049_finalproject";
			String db_username = "root";
			String db_pwd = "root";
			Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
				
			// 아이디 중복확인을 위한 DB 쿼리문 전송
			String insertQuery = "SELECT id from 19831049_finalproject.member where id = ?";
			PreparedStatement psmt = connection.prepareStatement(insertQuery);
			psmt.setString(1, id);
					
			ResultSet rs = psmt.executeQuery();
			
			if (rs.next())
			{
				// DB에 쿼리문을 넘기고, 반환된 값이 있다면 그 아이디는 사용 불가능한 아이디
				result = 0;
			}
			else
			{
				// DB에 쿼리문을 넘기고, 반환된 값이 없다면 그 아이디는 사용 가능한 아이디
				result = 1;
			}
		}
		catch (Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
		
		}
	return result;
	}
}
