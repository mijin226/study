package test1002;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Client2 { //클라이언트 객체
	public static void main(String[] args) { //메인 함수
        // AbstractApplicationContext : 스프링 컨테이너 명칭. 여러 서브클래스(ex.GenericXmlApplicationContext)를 통해 Bean 생성 및 관리할 수 있도록 유연성 제공.
        // GenericXmlApplicationContext : XML 파일 기반 applicationContext를 설정하는 클래스
        // applicationContext.xml : Spring 설정 파일 경로. Bean 정의와 의존성 주입 등의 설정을 읽어옴.
        // 컨테이너 구동시키는 코드
        // 1. applicationContext.xml 파일 읽음.
        // 2. 애플리케이션 컨텍스트를 생성한 후, Bean을 관리할 준비.
		AbstractApplicationContext factory = new GenericXmlApplicationContext("applicationContext2.xml");
		
		// Bean == 자바객체 == 객체 == POJO
		// "apple" 객체를 요청 == look up
		Phone phone = (Phone)factory.getBean("apple");

		//apple 객체(AppleWatch)의 메서드 호출
		phone.powerOn();
		phone.powerOff();
		phone.powerOff();

		//컨테이너 사용 종료
		factory.close();
		
	}
}
