package test;

public class IPhoneWatch implements Watch {
	public IPhoneWatch() {
		System.out.println("아이폰워치 생성자 호출");
	}
	@Override
	public void powerOn() {
		System.out.println("아이폰워치로 ON");		
		
	}

	@Override
	public void powerOff() {
		System.out.println("아이폰워치로 OFF");		
	}

}
