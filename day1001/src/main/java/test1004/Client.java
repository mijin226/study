package test1004;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Client {
	public static void main(String[] args) {
		
		AbstractApplicationContext factory = new GenericXmlApplicationContext("applicationContext.xml");
		// 컨테이너를 구동시키는 코드
//		객체주입 힙메모리. 힙메모리 - 동적으로 활용될 때 사용.
//		값주입 원시타입은 데이터 메모리 프로그램 실행될 때, 고정값 사용할 때 사용
		
		Phone phone = (Phone)factory.getBean("apple");
		// Bean == 자바객체 == 객체 == POJO
		// 객체를 요청하다.
		// == look up
		
		phone.powerOn();
		phone.powerOff();
		phone.powerOff();

		factory.close();
		
	}
}
