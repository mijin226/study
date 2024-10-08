package test;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Client {
	public static void main(String[] args) {

		AbstractApplicationContext factory = new GenericXmlApplicationContext("applicationContext.xml");
//		Phone phone = (Phone) factory.getBean(args[0]);
//		phone.powerOn();
//		phone.powerOff();   

		Watch watch = (Watch)factory.getBean(args[0]);
		watch.powerOn();
		watch.powerOff();   
		
		factory.close();
	}
}
