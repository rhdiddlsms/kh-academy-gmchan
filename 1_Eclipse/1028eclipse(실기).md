
```java

final List<String> list = new ArrayList();  //힙영역
		list.add("A");
		list.add("B");
		list.add("C");
		list.add("D");
		
		// 배열안에 있는것을 반복해줌
		for (String message : list) {
			System.out.println(message);
		}
		
		String[] str = new String[5];
		for(int i =0 ; i<5; i++) {
			str[i] = "A";
		}
		
		for(String value : str) {
			System.out.println(value);
		}
		
		for (String string : str) {
			
		}

```