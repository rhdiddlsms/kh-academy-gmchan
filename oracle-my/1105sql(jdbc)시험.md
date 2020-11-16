*# 문제 1 

## Dao.java

```java
package test01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

//

public class Dao {

	public ArrayList<Memo> selectAll() {
		ArrayList<Memo> list = new ArrayList<Memo>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from memo";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); 

            // 커넥션 요청단계에서 오류
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "oracleuser", "pwd1234");
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();

            //3번 조치사항 - 
			if(rset.next()) {
				Memo m = new Memo();
                //1번 원인 조치 - 컬럼 인덱스 수정하기.
				m.setNo(rset.getInt(0));
				m.setName(rset.getString(1));
				m.setMsg(rset.getString(2));
				m.setWriteday(rset.getDate(3));

                //2번 조치사항 - list에 메모 추가

			}
		} catch (ClassNotFoundException e) {			
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rset.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
}
```

# 원인

1. 컬럼 인덱스는 1부터 시작해야 하는데 0부터 불러오고 있다.
    - (시험 답)ResultSet에서 조회한 결과를 불러 올 때, 컬럼 순서는 1부터 시작이지만 0부터 시작하게 작성함.
2. 조회된 결과 memo객체에 저장 후 list에 담아야 하지만 담지 않았다.
    - (시험 답) 조회된 결과를 Memo 객체에 저장 한 뒤 리턴하는 list에 추가하지 않고 빈 리스트를 추가함.
3. 여러 행을 출력하는 쿼리지만 if문을 사용해서 상단의 첫 행만 불러와서 저장함(여러 행을 사용하려면 while)
    - (시험 답) 조회 결과 처리하는 코드에서 if를 사용했기 때문에 여로 row가 조회되어도 상단의 첫 행만 처리하고 끝난다.
        

# 조치사항 

1. 컬럼 인덱스를 1부터 시작하도록 수정했음
```java
		Memo m = new Memo();
				m.setNo(rset.getInt(1));
				m.setName(rset.getString(2));
				m.setMsg(rset.getString(3));
				m.setWriteday(rset.getDate(4)));	
```

2. list에 담음 

```java
list.add(m);   //2번 조치사항
```

3. if문을 while문으로 바꾼다

```java 
while(rset.next());{
				Memo m = new Memo();
				m.setNo(rset.getInt(1));  // 컬럼 인덱스 0으로 시작하면 안됨. 무조건 1부터 시작
				m.setName(rset.getString(2));
				m.setMsg(rset.getString(3));
				m.setWriteday(rset.getDate(4));	
				
				list.add(m);   //2번 조치사항
			}
```

# 문제 2

## Memo.java

```java
import java.sql.Date;
public class Memo {
	private int no;
	private String name;
	private String msg;
	private Date writeday;
	public Memo() {
		super();
	}
	public Memo(int no, String name, String msg, Date writeday) {
		super();
		this.no = no;
		this.name = name;
		this.msg = msg;
		this.writeday = writeday;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Date getWriteday() {
		return writeday;
	}
	public void setWriteday(Date writeday) {
		this.writeday = writeday;
	}	
}
```


##  Controller.java

```java
import java.util.ArrayList;
import kh.exam.dao.Dao;
import kh.exam.vo.Memo;
public class Controller {
	public void main() {
		Dao dao = new Dao();
		Memo m = dao.selectOne(101);
		if(m == null) {
			System.out.println("데이터가 없습니다.");
		}else {
			System.out.println("NO\tNAME\tMSG\tWRITEDAY");
			System.out.println("-----------------------------------");
			System.out.println(m.getNo() + "\t" + m.getName() + "\t" + m.getMsg() + "\t" + m.getWriteday());			
			
		}
	}
}

```

## Dao.java
```java
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import kh.exam.vo.Memo;
public class Dao {
	public Memo selectOne(int no) {
		Memo m = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from memo where no = ?";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "oracleuser", "pwd1234");
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(0, no);   // 1번 조치사항
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new Memo();

                //2번 조치 사항
				m.setNo(rset.getInt(0));
				m.setName(rset.getString(1));
				m.setMsg(rset.getString(2));
				m.setWriteday(rset.getDate(3));				
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

            //3번 조치사항
            finally {
			try {
				rset.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}


		return m;
	}
}
```

### 원인

1. setInt 메소드에 파라미터 순서 설정이 잘못되었다. (index 1부터 시작 해야됨)
2. resultSet 에서 파라미터 순서가 1번부터이지만 0번부터 시작되고 있음.
3. 자원 반환을 안해주고 있다.

### 조치사항

1. setInt를 0 -> 1로 변경 해줘야됨.   
    ``` java
    1. pstmt.setInt(1, no);
    ```
2. 	           
    ```java
    m = new Memo();
    m.setNo(rset.getInt(1));
    m.setName(rset.getString(2));
    m.setMsg(rset.getString(3));
    m.setWriteday(rset.getDate(4));		
    ```

3. 자원반환 코드를 추가
``` java
   finally {
			try {
				rset.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

```

업데이트 할 때 항상 commit조건을 달아줘야 한다.

#문제 3

## 원인 
1. dao.java에서  DML은 executeUpdate로 실행 해야함. 그러나 executeQuery로 실행중임.
2. controller.java에서 if문 변경 성공 여부를 출력하는 부분이 잘못되었다.
3. commit 이나 rollback제어가 안되고있다. (코드 추가하기.)


## 조치사항

1. executeQuery -> executeUpdate로 변경 해주기
2. 출력부분 조건 변경
```java
if (result > 0) {
            System.out.println("변경 성공");
        }

```

3. commit, rollback 제어코드 추가
```java
    if (result > 0) {
            conn.commit
        } else {
            conn.rollback
        }

```