package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCTemplate {
<<<<<<< HEAD
<<<<<<< HEAD
   
   public static Connection getConnection() {
      
      Connection conn = null;
      
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         
         conn= DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","KH_SERVER","1234");
         
         conn.setAutoCommit(false); // 오토커밋 방지 설정
         
      } catch (ClassNotFoundException e) {
         e.printStackTrace();
      } catch (SQLException e) {
         e.printStackTrace();
      }
      
      
      return conn;
   }
   
   public static void close(Connection conn) {
      
      try {
         if(conn != null && !conn.isClosed()) {
            conn.close();
         }
         
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
   
   public static void close(ResultSet rset) {
      try {
         if(rset != null && !rset.isClosed()) {
            rset.close();
         }
         
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
   
   public static void close(Statement stmt) {
      
      try {
         if(stmt!=null && !stmt.isClosed()) {
            stmt.close();
         }
         
      } catch (Exception e) {
         e.printStackTrace();
      }
   }

   public static void commit(Connection conn) {
      try {
         
         if(conn!=null && !conn.isClosed()) {
            conn.commit();
         }
         
      } catch (Exception e) {
          e.printStackTrace();
      }
   }
   
   public static void rollback(Connection conn) {
      
      try {
         
         if(conn!=null && !conn.isClosed()) {
            conn.rollback();
         }
         
      } catch (Exception e) {
          e.printStackTrace();
      }
   }
   
}
=======
	
	public static Connection getConnection() {
=======
>>>>>>> c206ee5a196b89bdf42c692a558bc9d5a8c8dd7b

	public static Connection getConnection() {
		Connection conn = null;
		try {
			// 1.드라이버 등록
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "lastFarm", "1234");
			// 자동 커밋 방지 설정

			conn.setAutoCommit(false);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;

		
	}
	
	public static void close(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.close();
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void close(ResultSet rset) {
		try {
			if(rset != null && !rset.isClosed()) {
				rset.close();
			}
		}catch (Exception e ) {
			e.printStackTrace();
		}
	}
	
	public static void close(Statement stmt) {
		try {
			if(stmt != null && !stmt.isClosed()) {
				stmt.close();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void commit(Connection conn) {
		try {
			if(conn!=null && !conn.isClosed()) {
				conn.commit();
			}
		}catch (Exception e ) {
			e.printStackTrace();
		}
	}
	
	public static void rollback(Connection conn) {
		try {
			if(conn!=null && !conn.isClosed()) {
				
				conn.rollback();
			}
		}catch (Exception e ) {
			e.printStackTrace();
		}
	}
	
	

}
>>>>>>> 8fc76aa5483c8e188ec8b28549477f3eb7468d44
